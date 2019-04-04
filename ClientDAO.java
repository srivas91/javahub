
package connect;
import model.ClientBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.CandidateBean;

public class ClientDAO {
    
    public static int insertClient(ClientBean bean) {
        int result = 0;
        try {
            Connection con = ConnectionTest.connect();
            PreparedStatement ps = con.prepareStatement("insert into client(username,password,cname,mobile,email,address,city,state)values(?,?,?,?,?,?,?,?)");
            ps.setString(1,bean.getUsername());
            ps.setString(2,bean.getPassword());
            ps.setString(3, bean.getCname());
            ps.setString(4, bean.getMobile());
            ps.setString(5, bean.getEmail());
            ps.setString(6, bean.getAddress());
            ps.setString(7, bean.getCity());
            ps.setString(8, bean.getState());
            
            result = ps.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return result;
    }
    public static int updateClient(ClientBean bean) {
        int result = 0;
        try {
            Connection con = ConnectionTest.connect();
            PreparedStatement ps = con.prepareStatement("update client set cname=?,mobile=?,email=?,address=?,city=?,state=? where cid=?");
            ps.setString(1, bean.getCname());
            ps.setString(2, bean.getMobile());
            ps.setString(3, bean.getEmail());
            ps.setString(4, bean.getAddress());
            ps.setString(5, bean.getCity());
            ps.setString(6, bean.getState());
            ps.setInt(7,bean.getCid());
            result = ps.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return result;
    }
    
    
    public static boolean clientLogin(ClientBean bean)
    {
        ResultSet rs=null;
         boolean status=false;
         try
        {
            
            
            Connection con = ConnectionTest.connect();
            PreparedStatement ps=con.prepareStatement("select * from client where username=? and password=?");
            ps.setString(1,bean.getUsername());
            ps.setString(2, bean.getPassword());
             rs=ps.executeQuery();
             status=rs.next();
            if(rs.next())
            {
               
               bean.setUsername(rs.getString("username"));
               bean.setPassword(rs.getString("password"));
            }
        }
         catch(Exception ex)
        {
            System.out.println(ex);
        }
        return status;
    }
}
