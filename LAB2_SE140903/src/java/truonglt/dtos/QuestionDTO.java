/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package truonglt.dtos;

import java.util.Date;
import java.util.List;

/**
 *
 * @author truon
 */
public class QuestionDTO {
    private int questionID;
    private String question_content;    
    private Date createDate;
    private String subjectID;
    private String subjectName;
    private String status;
    private int answerChoose;
    private boolean statusAnswer;
    List<AnswerDTO> listAnswer;

    public QuestionDTO(int questionID, String question_content, int answerChoose, boolean statusAnswer, List<AnswerDTO> listAnswer) {
        this.questionID = questionID;
        this.question_content = question_content;
        this.answerChoose = answerChoose;
        this.statusAnswer = statusAnswer;
        this.listAnswer = listAnswer;
    }

    

    
    public QuestionDTO(int questionID, String question_content, Date createDate, String subjectID, String subjectName, String status, List<AnswerDTO> listAnswer) {
        this.questionID = questionID;
        this.question_content = question_content;
        this.createDate = createDate;
        this.subjectID = subjectID;
        this.subjectName = subjectName;
        this.status = status;
        this.listAnswer = listAnswer;
    }
    public QuestionDTO(int questionID, String question_content, String subjectID, String status, List<AnswerDTO> listAnswer) {
        this.questionID = questionID;
        this.question_content = question_content;
        this.subjectID = subjectID;
        this.status = status;
        this.listAnswer = listAnswer;
    }

    public QuestionDTO(String question_content, String subjectID, List<AnswerDTO> listAnswer) {
        this.question_content = question_content;
        this.subjectID = subjectID;
        this.listAnswer = listAnswer;
    }
    

    public QuestionDTO(int questionID, String question_content, List<AnswerDTO> listAnswer) {
        this.questionID = questionID;
        this.question_content = question_content;
        this.listAnswer = listAnswer;
    }

    public int getQuestionID() {
        return questionID;
    }

    public void setQuestionID(int questionID) {
        this.questionID = questionID;
    }

    public String getQuestion_content() {
        return question_content;
    }

    public void setQuestion_content(String question_content) {
        this.question_content = question_content;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getSubjectID() {
        return subjectID;
    }

    public void setSubjectID(String subjectID) {
        this.subjectID = subjectID;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getAnswerChoose() {
        return answerChoose;
    }

    public void setAnswerChoose(int answerChoose) {
        this.answerChoose = answerChoose;
    }

    public boolean isStatusAnswer() {
        return statusAnswer;
    }

    public void setStatusAnswer(boolean statusAnswer) {
        this.statusAnswer = statusAnswer;
    }

    public List<AnswerDTO> getListAnswer() {
        return listAnswer;
    }

    public void setListAnswer(List<AnswerDTO> listAnswer) {
        this.listAnswer = listAnswer;
    }

    
    
}
