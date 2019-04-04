package controller;

import model.CandidateBean;
import java.io.IOException;
import connect.CandidateDAO;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class CandidateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	CandidateBean bean;
    
    public CandidateServlet() {
        super();
       
    }

	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 PrintWriter out=response.getWriter();
	       
	       String username=request.getParameter("username");
               String password=request.getParameter("password");
               String candidname=request.getParameter("candidname");
	       String mobile=request.getParameter("mobile");
	       String email=request.getParameter("email");
	       String address=request.getParameter("address");
	      String city=request.getParameter("city");
              String state=request.getParameter("state");
              int exp=Integer.parseInt(request.getParameter("exp"));
	       
              bean=new CandidateBean();
              bean.setUsername(username);
              bean.setPassword(password);
              bean.setCandidname(candidname);
              bean.setMobile(mobile);
              bean.setEmail(email);
              bean.setAddress(address);
              bean.setCity(city);
              bean.setState(state);
	      bean.setExp(exp);
              
              try
        {
          
          int c;
            c =CandidateDAO.insertCandidate(bean);
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet RegisterServlet</title>");
        out.println("</head>");
        out.println("<body bgcolor=yellow>");
        if(c>0)
        {
        out.println("registration success");
        }
        else
        {
          out.println("registration failed");
        }
        out.println("</body>");
        out.println("</html>");
        }
        
       finally
       {
           out.close();
       }

	}

}
