package controller;

import connect.ClientDAO;
import model.ClientBean;
import java.io.IOException;
import connect.ClientDAO;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ClientBean;


public class ClientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	ClientBean bean;
    
        @Override
          protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         response.setContentType("text/html;charset=UTF-8");
         String msg;
         bean=new ClientBean();
        try (PrintWriter out = response.getWriter()) {
           
            bean.setUsername(request.getParameter("user"));
            bean.setPassword(request.getParameter("password"));
            
             boolean status=ClientDAO.clientLogin(bean);
             out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet loginServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
            if(status)
            {
               out.println("login success");
               RequestDispatcher rd=request.getRequestDispatcher("searchClient.jsp");
                rd.forward(request, response);
                
             }
            
            else
            {
                msg="<font color='red'>invalid username/password</font>";
                
                request.setAttribute("msg",msg);
                out.println(msg);
                RequestDispatcher rd=request.getRequestDispatcher("loginClient.jsp");
                rd.forward(request, response);
            }
            
            out.println("</body>");
            out.println("</html>");
    }

          }
       

	

        @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 PrintWriter out=response.getWriter();
	       
	       String username=request.getParameter("username");
               String password=request.getParameter("password");
                 String clientname=request.getParameter("clientname");
	       String mobile=request.getParameter("mobile");
	       String email=request.getParameter("email");
	       String address=request.getParameter("address");
	      String city=request.getParameter("city");
              String state=request.getParameter("state");
             
	       
              bean=new ClientBean();
              bean.setUsername(username);
              bean.setPassword(password);
              bean.setCname(clientname);
              bean.setMobile(mobile);
              bean.setEmail(email);
              bean.setAddress(address);
              bean.setCity(city);
              bean.setState(state);
	      
              
              try
        {
          
          int c;
            c =ClientDAO.insertClient(bean);
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
