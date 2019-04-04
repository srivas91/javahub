package connect;
import model.CandidateBean;
import java.sql.*;
public interface DBCon {
    
public int addCandid(CandidateBean bean);
public int delCandid(CandidateBean bean);
public int upCandid(CandidateBean bean);
/*public ResultSet CandidByName();
public ResultSet CandidById();
public ResultSet CandidAll(); */
}	
