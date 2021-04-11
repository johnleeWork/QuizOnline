/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package truonglt.controllers;

import java.io.IOException;
import java.text.DecimalFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import truonglt.daos.ExamDAO;
import truonglt.dtos.AnswerDTO;
import truonglt.dtos.ExamDTO;
import truonglt.dtos.ExamDetailDTO;
import truonglt.dtos.UserDTO;

/**
 *
 * @author truon
 */
@WebServlet(name = "ShowResultTimeOutController", urlPatterns = {"/ShowResultTimeOutController"})
public class ShowResultTimeOutController extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(ShowResultTimeOutController.class);
    private static final String SUBMIT = "result.jsp";

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
        String url = SUBMIT;
        try {
            HttpSession session = request.getSession();
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
            ExamDTO exam = (ExamDTO) session.getAttribute("QUIZ_TEST");
            int numberQuizExam = Integer.parseInt(request.getParameter("numberQuizExam"));
            if (request.getParameter("answerChoose") != null) {
                int answerChoose = Integer.parseInt(request.getParameter("answerChoose"));
                int numberFix = Integer.parseInt(request.getParameter("numberFix"));
                exam.updateQuestion(answerChoose, numberFix);
            }
            int numberCorrect = 0;
            for (ExamDetailDTO examDetailDTO : exam.getCart().values()) {
                int answerID = 0;
                for (AnswerDTO answer : examDetailDTO.getListAnswer()) {
                    if (answer.isStatusResult()) {
                        answerID = answer.getAnswerID();
                    }
                }
                if (examDetailDTO.getAnswerChoose() == answerID) {
                    examDetailDTO.setStatus(true);
                    numberCorrect += 1;
                } else {
                    examDetailDTO.setStatus(false);
                }
            }
            ExamDAO examDAO = new ExamDAO();
            DecimalFormat decimalFormat = new DecimalFormat("#.##");
            float point = Float.parseFloat(decimalFormat.format((float) 10 / numberQuizExam * numberCorrect));
            request.setAttribute("numberCorrect", numberCorrect);
            request.setAttribute("numberQuizExam", numberQuizExam);
            request.setAttribute("point", point);
            examDAO.saveExam(exam, numberCorrect, user.getEmail(), numberQuizExam, point);
            url = SUBMIT;

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
