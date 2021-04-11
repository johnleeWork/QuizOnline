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
public class HistoryExamDTO {
    private int examID;
    private Date dateTimeFinish;
    private String subjectID;
    private int numberCorrect;
    private float point;
    List<QuestionDTO> listQuestion;

    public HistoryExamDTO(int examID, Date dateTimeFinish, String subjectID, int numberCorrect, float point, List<QuestionDTO> listQuestion) {
        this.examID = examID;
        this.dateTimeFinish = dateTimeFinish;
        this.subjectID = subjectID;
        this.numberCorrect = numberCorrect;
        this.point = point;
        this.listQuestion = listQuestion;
    }

    public HistoryExamDTO(int examID, Date dateTimeFinish, String subjectID, int numberCorrect, float point) {
        this.examID = examID;
        this.dateTimeFinish = dateTimeFinish;
        this.subjectID = subjectID;
        this.numberCorrect = numberCorrect;
        this.point = point;
    }

    public int getExamID() {
        return examID;
    }

    public void setExamID(int examID) {
        this.examID = examID;
    }

    public Date getDateTimeFinish() {
        return dateTimeFinish;
    }

    public void setDateTimeFinish(Date dateTimeFinish) {
        this.dateTimeFinish = dateTimeFinish;
    }

    public String getSubjectID() {
        return subjectID;
    }

    public void setSubjectID(String subjectID) {
        this.subjectID = subjectID;
    }

    public int getNumberCorrect() {
        return numberCorrect;
    }

    public void setNumberCorrect(int numberCorrect) {
        this.numberCorrect = numberCorrect;
    }

    public float getPoint() {
        return point;
    }

    public void setPoint(int point) {
        this.point = point;
    }

    public List<QuestionDTO> getListQuestion() {
        return listQuestion;
    }

    public void setListQuestion(List<QuestionDTO> listQuestion) {
        this.listQuestion = listQuestion;
    }

    
    
    
}
