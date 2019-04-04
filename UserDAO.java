package connect;

import model.UserBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
public class UserDAO {

 

    public int insertUser(UserBean bean) {
        int result = 0;
        try {
            Connection con = ConnectionTest.connect();
            PreparedStatement ps = con.prepareStatement("insert into user(username,password,mobile,role)values(?,?,?,?)");
            
            ps.setString(1, bean.getUsername());
            ps.setString(2, bean.getPassword());
            ps.setString(3, bean.getMobile());
            ps.setString(4, bean.getRole());
            result = ps.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return result;
    }
}