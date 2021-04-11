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
import org.apache.log4j.Logger;
import truonglt.dtos.AnswerDTO;
import truonglt.dtos.QuestionDTO;
import truonglt.utils.DBUtils;

/**
 *
 * @author truon
 */
public class QuestionDAO {

    private static final Logger LOGGER = Logger.getLogger(QuestionDAO.class);

    public List<AnswerDTO> getAnswer(int questionID) throws SQLException {
        List<AnswerDTO> listAnswer = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select answerID,answer_content,isRight from tblAnswer where questionID=?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, questionID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int answerID = rs.getInt("answerID");
                    String answer_content = rs.getString("answer_content");
                    boolean isRight = rs.getBoolean("isRight");
                    if (listAnswer == null) {
                        listAnswer = new ArrayList<>();
                    }
                    listAnswer.add(new AnswerDTO(answerID, answer_content, isRight));
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
        return listAnswer;
    }

    public List<QuestionDTO> getQuestionUS(String subjectID, int numberQuestionExam) throws SQLException {
        List<QuestionDTO> listQuestion = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select TOP " + numberQuestionExam + " questionID,question_content,createDate,S.subjectID as subjectID,S.name as name,status\n"
                        + "from tblQuestions Q inner join tblSubjects S on Q.subjectID = S.subjectID\n"
                        + "WHERE status  = 'active' and Q.subjectID = ?\n"
                        + "ORDER BY NEWID()";
                stm = conn.prepareStatement(sql);
                stm.setString(1, subjectID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int questionID = rs.getInt("questionID");
                    String question_content = rs.getString("question_content");                   
                    if (listQuestion == null) {
                        listQuestion = new ArrayList<>();
                    }
                    listQuestion.add(new QuestionDTO(questionID, question_content, getAnswer(questionID)));
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

    public List<QuestionDTO> searchQuestionAD(String questionName, String statusQuestion, String subjectQuestion, int pagesize, int pageNumber) throws SQLException {
        List<QuestionDTO> listQuestion = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String fettleName = "";
                String fettleStatus = "";
                String fettleSubject = "";
                if (questionName != null && !(questionName.trim().isEmpty())) {
                    fettleName = " where question_content LIKE '%" + questionName + "%'";
                }
                if (statusQuestion != null && !(statusQuestion.trim().isEmpty())) {
                    fettleStatus = " and status = '" + statusQuestion + "'";
                }
                if (subjectQuestion != null && !(subjectQuestion.trim().isEmpty())) {
                    fettleSubject = " and S.subjectID = '" + subjectQuestion + "' ";
                }

                String sql = "select questionID,question_content,createDate,S.subjectID as subjectID,S.name as name,status\n"
                        + " from tblQuestions Q inner join tblSubjects S on Q.subjectID = S.subjectID\n"
                        + fettleName + fettleStatus + fettleSubject
                        + "ORDER BY question_content DESC \n"
                        + "OFFSET ? * (? - 1) ROWS\n"
                        + "FETCH NEXT ? ROWS ONLY";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, pagesize);
                stm.setInt(2, pageNumber);
                stm.setInt(3, pagesize);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int questionID = rs.getInt("questionID");
                    String question_content = rs.getString("question_content");
                    Date createDate = rs.getDate("createDate");
                    String subjectID = rs.getString("subjectID");
                    String subjectName = rs.getString("name");
                    String status = rs.getString("status");
                    if (listQuestion == null) {
                        listQuestion = new ArrayList<>();
                    }
                    listQuestion.add(new QuestionDTO(questionID, question_content, createDate, subjectID, subjectName, status, getAnswer(questionID)));
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

    public int getNumberQuestion(String questionName, String statusQuestion, String subjectQuestion) throws SQLException {
        int result = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String fettleName = "";
                String fettleStatus = "";
                String fettleSubject = "";
                if (questionName != null && !(questionName.trim().isEmpty())) {
                    fettleName = " where question_content LIKE '%" + questionName + "%'";
                }
                if (statusQuestion != null && !(statusQuestion.trim().isEmpty())) {
                    fettleStatus = " and status = '" + statusQuestion + "'";
                }
                if (subjectQuestion != null && !(subjectQuestion.trim().isEmpty())) {
                    fettleSubject = " and S.subjectID = '" + subjectQuestion + "' ";
                }

                String sql = "select count(*) as number\n"
                        + " from tblQuestions Q inner join tblSubjects S on Q.subjectID = S.subjectID\n"
                        + fettleName + fettleStatus + fettleSubject;
                stm = conn.prepareStatement(sql);
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

    public QuestionDTO searchByQuestionID(int questionID) throws SQLException {
        QuestionDTO question = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select questionID,question_content,createDate,S.subjectID as subjectID,S.name as name,status\n"
                        + " from tblQuestions Q inner join tblSubjects S on Q.subjectID = S.subjectID\n"
                        + "WHERE questionID=? ";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, questionID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String question_content = rs.getString("question_content");                    
                    Date createDate = rs.getDate("createDate");
                    String subjectID = rs.getString("subjectID");
                    String subjectName = rs.getString("name");
                    String status = rs.getString("status");
                    question = new QuestionDTO(questionID, question_content, createDate, subjectID, subjectName, status, getAnswer(questionID));
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

        return question;
    }

    public int createNewQuestion(QuestionDTO question) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        int result = -1;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                int numberQuestion= getNumberQuestion("", "", "") + 1;
                conn.setAutoCommit(false);
                String sql = "INSERT INTO tblQuestions(questionID,question_content,subjectID) VALUES(?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, numberQuestion);
                stm.setString(2, question.getQuestion_content());
                stm.setString(3, question.getSubjectID());
                result = stm.executeUpdate();
                for (AnswerDTO answer : question.getListAnswer()) {
                    sql = "INSERT INTO tblAnswer(answer_content,questionID,isRight) VALUES (?,?,?)";
                    stm = conn.prepareStatement(sql);
                    stm.setString(1, answer.getAnswer_content());
                    stm.setInt(2, numberQuestion);
                    stm.setBoolean(3, answer.isStatusResult());          
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

    public int deleteQuestion(int questionID) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        int result = -1;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE tblQuestions SET status= 'deActive' WHERE questionID=?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, questionID);
                result = stm.executeUpdate();
            }
        } catch (Exception e) {
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

    public int update(QuestionDTO question) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        int result = -1;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                conn.setAutoCommit(false);
                String sql = "UPDATE tblQuestions SET question_content=?,subjectID=?,status=?\n"
                        + "WHERE questionID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, question.getQuestion_content());                
                stm.setString(2, question.getSubjectID());
                stm.setString(3, question.getStatus());
                stm.setInt(4, question.getQuestionID());
                result = stm.executeUpdate();
                for (AnswerDTO answer : question.getListAnswer()) {
                    sql = "UPDATE tblAnswer SET answer_content=? , isRight=? WHERE answerID=?";
                    stm = conn.prepareStatement(sql);
                    stm.setString(1, answer.getAnswer_content());                    
                    stm.setBoolean(2, answer.isStatusResult());
                    stm.setInt(3, answer.getAnswerID());
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

}
