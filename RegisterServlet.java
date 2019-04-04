/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import connect.UserDAO;
import model.UserBean;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class RegisterServlet extends HttpServlet {

    
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String user = request.getParameter("username");
        String pass = request.getParameter("password");
        String mobile=request.getParameter("mobile");
        String role=request.getParameter("role");
        
        
       out.println(user);
        out.println(pass);
       
        UserBean bean=new UserBean();
        bean.setUsername(user);
        bean.setPassword(pass);
        bean.setMobile(mobile);
        bean.setRole(role);
        //request.setAttribute("beanuse",bean);
       try
        {
          UserDAO user1=new UserDAO();
          int c;
            c =user1.insertUser(bean);
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
