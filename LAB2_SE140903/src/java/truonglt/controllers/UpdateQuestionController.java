/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package truonglt.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import truonglt.daos.QuestionDAO;
import truonglt.dtos.AnswerDTO;
import truonglt.dtos.QuestionDTO;
import truonglt.dtos.QuestionErrorDTO;

/**
 *
 * @author truon
 */
@WebServlet(name = "UpdateQuestionController", urlPatterns = {"/UpdateQuestionController"})
public class UpdateQuestionController extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(UpdateQuestionController.class);
    private static final String SUCCESS = "SearchADController";
    private static final String ERROR = "edit.jsp";

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
        QuestionErrorDTO questionError = new QuestionErrorDTO("", "", "", "", "", "", "", "");
        String url = ERROR;
        try {
            int questionID = Integer.parseInt(request.getParameter("txtQuestionID"));
            String question_content = request.getParameter("txtQuestion");
            String answer_content1 = request.getParameter("txtAnswerA");
            String answer_content2 = request.getParameter("txtAnswerB");
            String answer_content3 = request.getParameter("txtAnswerC");
            String answer_content4 = request.getParameter("txtAnswerD");
            int answerID1 = Integer.parseInt(request.getParameter("txtAnswerID1"));
            int answerID2 = Integer.parseInt(request.getParameter("txtAnswerID2"));
            int answerID3 = Integer.parseInt(request.getParameter("txtAnswerID3"));
            int answerID4 = Integer.parseInt(request.getParameter("txtAnswerID4"));
            String answer_correct = request.getParameter("txtAnswerCorrect");
            String subjectID = request.getParameter("txtSubjectQuestion");
            String status = request.getParameter("txtStatusQuestion");
            boolean check = true;
            if (question_content.isEmpty()) {
                questionError.setQuestion_content("Question can not empty!");
                check = false;
            }
            if (answer_content1.isEmpty()) {
                questionError.setAnswer_content1("Answer can not empty!");
                check = false;
            }
            if (answer_content2.isEmpty()) {
                questionError.setAnswer_content2("Answer can not empty!");
                check = false;
            }
            if (answer_content3.isEmpty()) {
                questionError.setAnswer_content3("Answer can not empty!");
                check = false;
            }
            if (answer_content4.isEmpty()) {
                questionError.setAnswer_content4("Answer can not empty!");
                check = false;
            }

            if (check) {
                List<AnswerDTO> listAnswer = new ArrayList<>();
                listAnswer.add(new AnswerDTO(answerID1, answer_content1, (Integer.parseInt(answer_correct) == 1) ? true : false));
                listAnswer.add(new AnswerDTO(answerID2, answer_content2, (Integer.parseInt(answer_correct) == 2) ? true : false));
                listAnswer.add(new AnswerDTO(answerID3, answer_content3, (Integer.parseInt(answer_correct) == 3) ? true : false));
                listAnswer.add(new AnswerDTO(answerID4, answer_content4, (Integer.parseInt(answer_correct) == 4) ? true : false));
                QuestionDTO questionDTO = new QuestionDTO(questionID, question_content, subjectID, status, listAnswer);
                QuestionDAO question = new QuestionDAO();
                if (question.update(questionDTO) != -1) {
                    url = SUCCESS;
                }
            } else {
                request.setAttribute("ERROR_QUESTION_UPDATE", questionError);
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
