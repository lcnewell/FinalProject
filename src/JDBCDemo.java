import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import org.webproject.servlet.DBUtility;

public class JDBCDemo {
    public static void main(String[] args){
        String sql = "select * from event";
        DBUtility util = new DBUtility();
        ResultSet res = util.queryDB(sql);
        try {
            if (res != null) {
                while (res.next()) {

                    System.out.println("race name: " + res.getString("race_name"));

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
