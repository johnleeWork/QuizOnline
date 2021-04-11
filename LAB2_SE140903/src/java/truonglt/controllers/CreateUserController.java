/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package truonglt.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import truonglt.daos.UserDAO;
import truonglt.dtos.UserDTO;
import truonglt.dtos.UserErrorDTO;
import static truonglt.utils.EncryptSHA256.getSHA;
import static truonglt.utils.EncryptSHA256.toHexString;

/**
 *
 * @author truon
 */
@WebServlet(name = "CreateUserController", urlPatterns = {"/CreateUserController"})
public class CreateUserController extends HttpServlet {
    private static final String SUCCESS = "login.jsp";
    private static final String ERROR = "register.jsp";
    static final Logger LOGGER = Logger.getLogger(CreateUserController.class);

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        UserErrorDTO error = new UserErrorDTO("", "", "");
        try {
            String email = request.getParameter("txtEmail").trim();
            String name = request.getParameter("txtName").trim();
            String password = request.getParameter("txtPassword").trim();
            boolean check = true;
            if (email.isEmpty()) {
                error.setEmailError("Email can not empty!");
                check = false;
            }
            if (name.isEmpty()) {
                error.setNameError("Name can not empty!");
                check = false;
            }
            if (password.isEmpty()) {
                error.setPasswordError("Password can not empty!");
                check = false;
            }           
            UserDAO dao = new UserDAO();
            if (check) {
                UserDTO user = new UserDTO(email, name, toHexString(getSHA(password)), "US");
                if(dao.createUser(user)!=-1){
                    url = SUCCESS;
                }else if(dao.checkEmail(email)){
                    error.setEmailError("Email already exists!");
                    request.setAttribute("ERROR_USERC", error);
                }                   
            }else {
                request.setAttribute("ERROR_USERC", error);
            }
        } catch (Exception e) {
            LOGGER.error("error: ", e);
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
