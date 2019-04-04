package connect;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class ConnectionTest{
	static final String DRIVER="org.h2.Driver";
	 static final String DB_URL="jdbc:h2:~/mydb";
	 static final String DB_USER="sa";
	 static final String DB_PWD="";
    public static Connection connect()
    {
		 
			
			 Connection con=null;
				
				try {
					Class.forName(DRIVER);
					con=DriverManager.getConnection(DB_URL,DB_USER,DB_PWD);
                                        if(con!=null)
                                        {
                                            System.out.println("connection success");
                                        }
                                        else
                                        {
                                            System.out.println("connection failed");
                                        }
                                } catch (Exception e) {
					
					e.printStackTrace();
				}
			
                                return con;
			}	
	
	
	
}
