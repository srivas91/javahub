
package controller;

import connect.CandidateDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.CandidateBean;


public class loginServlet extends HttpServlet {

      CandidateBean bean=null;
   
    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         response.setContentType("text/html;charset=UTF-8");
         String msg;
         bean=new CandidateBean();
        try (PrintWriter out = response.getWriter()) {
           
            bean.setUsername(request.getParameter("user"));
            bean.setPassword(request.getParameter("password"));
            
             boolean status=CandidateDAO.candidateLogin(bean);
             out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet loginServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
            if(status)
            {
               out.println("login success");
               RequestDispatcher rd=request.getRequestDispatcher("searchJob.jsp");
                rd.forward(request, response);
                
             }
            
            else
            {
                msg="<font color='red'>invalid username/password</font>";
                
                request.setAttribute("msg",msg);
                out.println(msg);
                RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
                rd.forward(request, response);
            }
            
            out.println("</body>");
            out.println("</html>");
    }

   
   
    }

}
