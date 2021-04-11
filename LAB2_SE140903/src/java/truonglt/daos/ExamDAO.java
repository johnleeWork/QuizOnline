/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package truonglt.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;
import org.apache.log4j.Logger;
import truonglt.dtos.ExamDTO;
import truonglt.dtos.ExamDetailDTO;
import truonglt.dtos.HistoryExamDTO;
import truonglt.dtos.QuestionDTO;
import truonglt.utils.DBUtils;

/**
 *
 * @author truon
 */
public class ExamDAO {

    private static final Logger LOGGER = Logger.getLogger(ExamDAO.class);

    public boolean checkExamID(int examID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select email\n"
                        + "from tblExam\n"
                        + "where examID = ?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, examID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
            LOGGER.error("error: ", e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public int saveExam(ExamDTO examDTO, int numberCorrect, String email, int numberQuizExam, float point) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        int result = -1;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                conn.setAutoCommit(false);
                Random random = new Random();
                int examID;
                do {
                    examID = random.nextInt(1000 - 1) + 1;
                } while (checkExamID(examID) == true);

                String sql = "INSERT INTO dbo.tblExam(examID, email, subjectID, numberCorrect,point) VALUES (?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, examID);
                stm.setString(2, email);
                stm.setString(3, examDTO.getCart().get(1).getSubjectID());
                stm.setInt(4, numberCorrect);
                stm.setFloat(5, point);
                stm.executeUpdate();
                for (ExamDetailDTO examDetailDTO : examDTO.getCart().values()) {
                    sql = "INSERT INTO dbo.tblExamDetail(examID ,questionID ,answerChooseID ,status ) VALUES (?,?,?,?)";
                    stm = conn.prepareStatement(sql);
                    stm.setInt(1, examID);
                    stm.setInt(2, examDetailDTO.getQuestionID());
                    stm.setInt(3, examDetailDTO.getAnswerChoose());
                    stm.setBoolean(4, examDetailDTO.isStatus());
                    result = stm.executeUpdate();
                }
            }
            conn.commit();
        } catch (Exception e) {
            conn.rollback();
            result = -1;
            LOGGER.error("error: ", e);
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }

    public List<HistoryExamDTO> searchExamHistory(String subjectID, String email, int pagesize, int pageNumber) throws SQLException {
        List<HistoryExamDTO> listHistoryQuestion = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String fettleSubject = "";
                if (subjectID != null && !(subjectID.trim().isEmpty())) {
                    fettleSubject = " and subjectID = '" + subjectID + "' ";
                }
                String sql = "select examID, dateTimeFinish, subjectID, numberCorrect, point\n"
                        + "from tblExam\n"
                        + "where email = ? " + fettleSubject
                        + " ORDER BY dateTimeFinish DESC \n"
                        + "OFFSET ? * (? - 1) ROWS\n"
                        + "FETCH NEXT ? ROWS ONLY";
                stm = conn.prepareStatement(sql);
                stm.setString(1, email);
                stm.setInt(2, pagesize);
                stm.setInt(3, pageNumber);
                stm.setInt(4, pagesize);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int examID = rs.getInt("examID");
                    Date dateTimeFinish = rs.getDate("dateTimeFinish");
                    String subjectDAO = rs.getString("subjectID");
                    int numberCorrect = rs.getInt("numberCorrect");
                    float point = rs.getFloat("point");
                    if (listHistoryQuestion == null) {
                        listHistoryQuestion = new ArrayList<>();
                    }
                    listHistoryQuestion.add(new HistoryExamDTO(examID, dateTimeFinish, subjectDAO, numberCorrect, point));
                }
            }
        } catch (Exception e) {
            LOGGER.error("error: ", e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listHistoryQuestion;
    }

    public List<QuestionDTO> searchByExamID(int examID) throws SQLException {
        List<QuestionDTO> listQuestion = null;
        QuestionDAO questionDAO = new QuestionDAO();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select ED.questionID as questionID,Q.question_content as question_content,answerChooseID, ED.status\n"
                        + "from tblExamDetail ED inner join tblQuestions Q on ED.questionID = Q.questionID\n"
                        + "where examID = ?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, examID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int questionID = rs.getInt("questionID");  
                    String question_content = rs.getString("question_content");         
                    int answerChoose = rs.getInt("answerChooseID");
                    boolean status = rs.getBoolean("status");
                    if (listQuestion == null) {
                        listQuestion = new ArrayList<>();
                    }
                    listQuestion.add(new QuestionDTO(questionID, question_content, answerChoose, status, questionDAO.getAnswer(questionID)));
                }
            }
        } catch (Exception e) {
            LOGGER.error("error: ", e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listQuestion;
    }

    public int getNumberExam(String subjectID, String email) throws SQLException {
        int result = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String fettleSubject = "";
                if (subjectID != null && !(subjectID.trim().isEmpty())) {
                    fettleSubject = " and subjectID = '" + subjectID + "' ";
                }
                String sql = "select count(*) as number\n"
                        + "from tblExam\n"
                        + "where email = ? " + fettleSubject;
                stm = conn.prepareStatement(sql);
                stm.setString(1, email);
                rs = stm.executeQuery();
                if (rs.next()) {
                    result = rs.getInt("number");
                }
            }
        } catch (Exception e) {
            LOGGER.error("error: ", e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }

}
