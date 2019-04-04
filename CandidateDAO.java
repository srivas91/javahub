
package connect;
import model.CandidateBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CandidateDAO {
    
   
    public static int insertCandidate(CandidateBean bean) {
        int result = 0;
        try {
            Connection con = ConnectionTest.connect();
            PreparedStatement ps = con.prepareStatement("insert into candidate(username,password,candidname,mobile,email,address,city,stateid,exp)values(?,?,?,?,?,?,?,?,?)");
            ps.setString(1,bean.getUsername());
            ps.setString(2,bean.getPassword());
            ps.setString(3, bean.getCandidname());
            ps.setString(4, bean.getMobile());
            ps.setString(5, bean.getEmail());
            ps.setString(6, bean.getAddress());
            ps.setString(7, bean.getCity());
            ps.setString(8, bean.getState());
            ps.setInt(9, bean.getExp());
            result = ps.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return result;
    }
    public static int deleteCandidate(CandidateBean bean){  
    int result=0;  
    try{  
        Connection con=ConnectionTest.connect();
        PreparedStatement ps=con.prepareStatement("delete from candidate where cid=?");  
        ps.setInt(1,bean.getCid());  
        result=ps.executeUpdate();  
    }catch(Exception e){System.out.println(e);}  
  
    return result;  
}  
    public static int updateCandidate(CandidateBean bean) {
        int result = 0;
        try {
            Connection con = ConnectionTest.connect();
            PreparedStatement ps = con.prepareStatement("update candidate set candidname=?,mobile=?,email=?,address=?,city=?,stateid=?,exp=? where cid=?");
            ps.setString(1, bean.getCandidname());
            ps.setString(2, bean.getMobile());
            ps.setString(3, bean.getEmail());
            ps.setString(4, bean.getAddress());
            ps.setString(5, bean.getCity());
            ps.setString(6, bean.getState());
            ps.setInt(7, bean.getExp());
            ps.setInt(8,bean.getCid());
            result = ps.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return result;
    }
    
    public static List<CandidateBean> getAllRecords()
    {
        List<CandidateBean> list=new ArrayList<>();
        try
        {
            Connection con = ConnectionTest.connect();
            PreparedStatement ps=con.prepareStatement("select * from candidate");
            ResultSet rs=ps.executeQuery();
            while(rs.next())
            {
                CandidateBean bean=new CandidateBean();
                bean.setCid(rs.getInt("cid"));
                bean.setCandidname(rs.getString("candidname"));
                bean.setMobile(rs.getString("mobile"));
                bean.setEmail(rs.getString("email"));
                bean.setAddress(rs.getString("address"));
                bean.setCity(rs.getString("city"));
                bean.setState(rs.getString("state"));
                list.add(bean);
            }
        }
        catch(Exception ex)
        {
            System.out.println(ex);
        }
        return list;
    }
    
    public static CandidateBean getRecordById(int id)
    {
        CandidateBean bean=null;
        try
        {
            Connection con = ConnectionTest.connect();
            PreparedStatement ps=con.prepareStatement("select * from candidate where cid=?");
            ps.setInt(1, id);
            ResultSet rs=ps.executeQuery();
            while(rs.next())
            {
                bean=new CandidateBean();
                bean.setCid(rs.getInt("cid"));
                bean.setCandidname(rs.getString("candidname"));
                bean.setMobile(rs.getString("mobile"));
                bean.setEmail(rs.getString("email"));
                bean.setAddress(rs.getString("address"));
                bean.setCity(rs.getString("city"));
                bean.setState(rs.getString("state"));
                
            }
            
        }
        catch(Exception ex)
        {
            System.out.println(ex);
        }
        return bean;
    }
    
    
    public static boolean candidateLogin(CandidateBean bean)
    {
        ResultSet rs=null;
         boolean status=false;
         try
        {
            
            
            Connection con = ConnectionTest.connect();
            PreparedStatement ps=con.prepareStatement("select * from candidate where username=? and password=?");
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
