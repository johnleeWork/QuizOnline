/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package truonglt.dtos;

import java.util.List;

/**
 *
 * @author truon
 */
public class ExamDetailDTO {
    private int questionID;
    private String question_content;
    List<AnswerDTO> listAnswer;
    private String subjectID;
    private int answerChoose;
    private boolean status;

    public ExamDetailDTO(int questionID, String question_content, List<AnswerDTO> listAnswer, String subjectID) {
        this.questionID = questionID;
        this.question_content = question_content;
        this.listAnswer = listAnswer;
        this.subjectID = subjectID;
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

    public List<AnswerDTO> getListAnswer() {
        return listAnswer;
    }

    public void setListAnswer(List<AnswerDTO> listAnswer) {
        this.listAnswer = listAnswer;
    }

    public String getSubjectID() {
        return subjectID;
    }

    public void setSubjectID(String subjectID) {
        this.subjectID = subjectID;
    }

    public int getAnswerChoose() {
        return answerChoose;
    }

    public void setAnswerChoose(int answerChoose) {
        this.answerChoose = answerChoose;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }


    
}
