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
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import truonglt.daos.QuestionDAO;
import truonglt.daos.SubjectDAO;
import truonglt.daos.UserDAO;
import truonglt.dtos.UserDTO;
import static truonglt.utils.EncryptSHA256.getSHA;
import static truonglt.utils.EncryptSHA256.toHexString;

/**
 *
 * @author truon
 */
@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(LoginController.class);
    private static final String SUCCESSAD = "quizManager.jsp";
    private static final String SUCCESSUS = "quiz.jsp";
    private static final String ERROR = "login.jsp";

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
        try {
            String email = request.getParameter("txtEmail");
            String password = request.getParameter("txtPassword");
            if (email.isEmpty() || password.isEmpty()) {
                request.setAttribute("ERROR_LOGIN", "email or password cannot be empty");
            } else {
                int pageNum = 1;
                int pageSize = 4;
                if (request.getParameter("page") != null) {
                    pageNum = Integer.parseInt(request.getParameter("page"));
                }

                HttpSession session = request.getSession();
                UserDAO userDAO = new UserDAO();
                QuestionDAO questionDAO = new QuestionDAO();
                SubjectDAO subjectDAO = new SubjectDAO();
                UserDTO user = userDAO.checkLogin(email, toHexString(getSHA(password)));
                int noOfPages = (int) Math.ceil(questionDAO.getNumberQuestion("", "", "") * 1.0 / pageSize);
                if (user != null) {
                    if ((user.getRoleID()).equals("AD")) {
                        session.setAttribute("LIST_QUESTIONS_AD", questionDAO.searchQuestionAD("", "", "", pageSize, pageNum));
                        request.setAttribute("noOfPages", noOfPages);
                        request.setAttribute("currentPage", pageNum);
                        url = SUCCESSAD;
                    } else if ((user.getRoleID()).equals("US")) {

                        url = SUCCESSUS;
                    }
                    session.setAttribute("LOGIN_USER", user);
                    session.setAttribute("LIST_SUBJECT", subjectDAO.getSubject());

                } else {
                    request.setAttribute("ERROR_LOGIN", "Incorrect USER ID or PASSWORD");
                }
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
