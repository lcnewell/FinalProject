import java.sql.ResultSet;
import org.webproject.servlet.DBUtility;

public class JDBCDemo {
    public static void main(String[] args){
        String sql = "select * from event where fiveK_type = true;";
        DBUtility dbutil = new DBUtility();
        ResultSet res = dbutil.queryDB(sql);
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
