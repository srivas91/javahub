

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="logo.html" %>
<%@include file="header.html" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">
            table
            {
                margin-left: 300px;
            }
            input[type="text"]
            {
                width:200px;
            }
             input[type="password"]
            {
                width:200px;
            }
            </style>
    </head>
    <body bgcolor="yellow">
        
        <form action="loginServlet" method="get">
            <table border="0">
                <tr><td><h3>${msg}</h3></td></tr>
                <caption>User Login</caption>
                 
                <tr><td>Username:</td><td><input type="text" name="user"></td><br><br>
                <tr><td> Password:</td><td><input type="password" name="password"></td><br><br>
                <tr><td colspan="2"><input type="submit" value="login">
                        <input type="reset" value="cancel"></td></tr>
            </table>
         </form>           
    </body>
</html>
