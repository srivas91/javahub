
<%@page import="model.*,connect.CandidateDAO" pageEncoding="UTF-8"%>
<%@include file="logo.html" %>
<%@include file="header.html" %>
<jsp:useBean id="user" class="model.CandidateBean" />
<jsp:setProperty property="*" name="user" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            
            int i=CandidateDAO.updateCandidate(user);
            if(i>0)
            {
                response.sendRedirect("viewpro.jsp");
            }
            %>
    </body>
</html>
