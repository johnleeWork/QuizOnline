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
import java.util.List;
import org.apache.log4j.Logger;
import truonglt.dtos.SubjectDTO;
import truonglt.utils.DBUtils;

/**
 *
 * @author truon
 */
public class SubjectDAO {
    private static final Logger LOGGER = Logger.getLogger(SubjectDAO.class);
    public List<SubjectDTO> getSubject() throws SQLException {
        List<SubjectDTO> listSubject = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select subjectID, name,numberQuestion, timeDo\n" +
                            "from tblSubjects";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String subjectID = rs.getString("subjectID");
                    String subjectName = rs.getString("name");
                    int numberQuestion = rs.getInt("numberQuestion");
                    int timeDo = rs.getInt("timeDo");

                    if (listSubject == null) {
                        listSubject = new ArrayList<>();
                    }
                    listSubject.add(new SubjectDTO(subjectID, subjectName,numberQuestion,timeDo));
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
        return listSubject;
    }
    
    public int getNumberQuestion(String subjectID) throws SQLException {
        int result = -1;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select numberQuestion\n" +
                            "from tblSubjects where subjectID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, subjectID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    result = rs.getInt("numberQuestion");
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
    public int getTime(String subjectID) throws SQLException {
        int result = -1;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select timeDo\n" +
                            "from tblSubjects where subjectID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, subjectID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    result = rs.getInt("timeDo");
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
