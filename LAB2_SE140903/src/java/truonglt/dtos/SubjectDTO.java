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
public class SubjectDTO {
    private String subjectID;
    private String subjectName;
    private int numberQuestionExam;
    private int timeDoExam;

    public SubjectDTO(String subjectID, String subjectName, int numberQuestionExam, int timeDoExam) {
        this.subjectID = subjectID;
        this.subjectName = subjectName;
        this.numberQuestionExam = numberQuestionExam;
        this.timeDoExam = timeDoExam;
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

    public int getNumberQuestionExam() {
        return numberQuestionExam;
    }

    public void setNumberQuestionExam(int numberQuestionExam) {
        this.numberQuestionExam = numberQuestionExam;
    }

    public int getTimeDoExam() {
        return timeDoExam;
    }

    public void setTimeDoExam(int timeDoExam) {
        this.timeDoExam = timeDoExam;
    }
    
    
}
