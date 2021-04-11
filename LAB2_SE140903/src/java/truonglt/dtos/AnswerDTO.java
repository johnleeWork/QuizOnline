/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package truonglt.dtos;

/**
 *
 * @author truon
 */
public class AnswerDTO {
    private int answerID;
    private String answer_content;
    private boolean statusResult;

    public AnswerDTO(int answerID, String answer_content, boolean statusResult) {
        this.answerID = answerID;
        this.answer_content = answer_content;
        this.statusResult = statusResult;
    }

    public AnswerDTO(String answer_content, boolean statusResult) {
        this.answer_content = answer_content;
        this.statusResult = statusResult;
    }
    

    public int getAnswerID() {
        return answerID;
    }

    public void setAnswerID(int answerID) {
        this.answerID = answerID;
    }

    public String getAnswer_content() {
        return answer_content;
    }

    public void setAnswer_content(String answer_content) {
        this.answer_content = answer_content;
    }

    public boolean isStatusResult() {
        return statusResult;
    }

    public void setStatusResult(boolean statusResult) {
        this.statusResult = statusResult;
    }
    
    
}
