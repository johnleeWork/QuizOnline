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
public class QuestionErrorDTO {
    private String question_content;
    private String answer_content1;
    private String answer_content2;
    private String answer_content3;
    private String answer_content4;
    private String answer_correct;
    private String subjectID;
    private String status;

    public QuestionErrorDTO(String question_content, String answer_content1, String answer_content2, String answer_content3, String answer_content4, String answer_correct, String subjectID, String status) {
        this.question_content = question_content;
        this.answer_content1 = answer_content1;
        this.answer_content2 = answer_content2;
        this.answer_content3 = answer_content3;
        this.answer_content4 = answer_content4;
        this.answer_correct = answer_correct;
        this.subjectID = subjectID;
        this.status = status;
    }

    public QuestionErrorDTO(String question_content, String answer_content1, String answer_content2, String answer_content3, String answer_content4, String answer_correct, String subjectID) {
        this.question_content = question_content;
        this.answer_content1 = answer_content1;
        this.answer_content2 = answer_content2;
        this.answer_content3 = answer_content3;
        this.answer_content4 = answer_content4;
        this.answer_correct = answer_correct;
        this.subjectID = subjectID;
    }

    public String getQuestion_content() {
        return question_content;
    }

    public void setQuestion_content(String question_content) {
        this.question_content = question_content;
    }

    public String getAnswer_content1() {
        return answer_content1;
    }

    public void setAnswer_content1(String answer_content1) {
        this.answer_content1 = answer_content1;
    }

    public String getAnswer_content2() {
        return answer_content2;
    }

    public void setAnswer_content2(String answer_content2) {
        this.answer_content2 = answer_content2;
    }

    public String getAnswer_content3() {
        return answer_content3;
    }

    public void setAnswer_content3(String answer_content3) {
        this.answer_content3 = answer_content3;
    }

    public String getAnswer_content4() {
        return answer_content4;
    }

    public void setAnswer_content4(String answer_content4) {
        this.answer_content4 = answer_content4;
    }

    public String getAnswer_correct() {
        return answer_correct;
    }

    public void setAnswer_correct(String answer_correct) {
        this.answer_correct = answer_correct;
    }

    public String getSubjectID() {
        return subjectID;
    }

    public void setSubjectID(String subjectID) {
        this.subjectID = subjectID;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
    
}
