package daon;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
 
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
 
public class MariaDBConnectionTest {
 
	protected final Logger logger = LoggerFactory.getLogger(this.getClass());
	
    static final String DRIVER = "org.mariadb.jdbc.Driver";
    static final String URL = "jdbc:mariadb://umj7-015.cafe24.com:3306/daontech65";
    static final String USERNAME = "daontech65";
    static final String PASSWORD = "passdaon@11";
 
    @Test
    public void getMySQLConnectionTest() {
        
        Connection conn = null;
        Statement stmt = null;
        
        try {
            
           logger.info("==================== MariaDB Connection START ====================");
           // System.out.println("==================== MariaDB Connection START ====================");
            
            Class.forName(DRIVER);
            
            conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            stmt = conn.createStatement();
 
            String sql = "SELECT * from tb_recruit_board";
 
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                
                String boardno = rs.getString("board_no");
                String boardtitle = rs.getString("board_title");
                String boardcontent = rs.getString("board_content");
                String boardregdate = rs.getString("reg_date");
                String boardwriter = rs.getString("board_writer");
 
                logger.info("boardno : {}", boardno);
                logger.info("boardSubject : {}", boardtitle);
                logger.info("boardContent: {}", boardcontent);
                logger.info("boardregdate: {}", boardregdate);
                logger.info("boardwriter: {}", boardwriter);
                logger.info("========================================");
                
                /*System.out.print("no : " + boardno + ", ");
                System.out.print("title: " + boardtitle + ", ");
                System.out.print("content: " + boardcontent +", ");
                System.out.println("reg_date:" + boardregdate);*/
            }
 
            rs.close();
            stmt.close();
            conn.close();
 
        } catch (SQLException se1) {
            se1.printStackTrace();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
        logger.info("==================== MariaDB Connection END ====================");        
        //System.out.println("==================== MariaDB Connection END ====================");
    }
}