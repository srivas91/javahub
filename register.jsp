
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="logo.html" %>
<%@include file="header.html" %>
<html>
    <head>
        <style type="text/css">
            table input[type="text"]
            {
                width:200px;
            }
            table input[type="password"]
            {
                width:200px;
            }
            table
            {
                margin-top:-170px;
            }
            </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body bgcolor="44ffbb">
        <br><br>
        <form action="RegisterServlet" method="post">
            <table border="5">
                <caption>New Registration</caption>
                <tr><td>Username:</td><td><input type="text" name="username"></td></tr><br><br>
                <tr><td>Password:</td><td><input type="password" name="password"></td></tr><br><br>
                <tr><td>Re-Password:</td><td><input type="password" name="repassword"></td></tr><br><br>
            <tr><td>Mobile Number:</td><td><input type="text" maxlength="10" name="mobile"></td></tr><br><br>
            <tr><td>Role:</td><td><input type="radio" name="role" value="Admin">Admin
                    <input type="radio" name="role" value="Client">Client
                    <input type="radio" name="role" value="Applicant">Applicant</td><br><br>
            <tr><td></td><td><input type="submit" value="submit">
                    <input type="reset" value="cancel"></td></tr>
        </form>
    </body>
</html>
