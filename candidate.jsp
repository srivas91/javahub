<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="logo.html" %>
<%@include file="header.html" %>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">
    table
    {
        margin-top:20px;
        margin-left:300px;
        position: absolute;
    }
    td:nth-child(2n+1)
    {
        font-size: 20px;
        color:blue;
    }
    input[type="email"]
    {
        width:250px;
    }
    input[type="text"]
    {
        width:250px;
    }
      input[type="password"]
    {
        width:250px;
    }
    select option
    {
        width:100px;
    }
    input[type="date"]
    {
        width:250px;
    }
    #link a
    {
        margin-top:500px;
        position: absolute;
    }
</style>
    </head>
    <body>
         <sql:setDataSource var="dataset" driver="org.h2.Driver" url="jdbc:h2:~/mydb" user="sa" password="" />
    <sql:query dataSource="${dataset}" var="result">
        select * from stateinfo;
    </sql:query>
        <sql:query dataSource="${dataset}" var="job">
        select * from jobinfo;
    </sql:query>
         <sql:query dataSource="${dataset}" var="qualify">
        select * from qualification;
    </sql:query>
        <form action="CandidateServlet" method="post">
      <table border="0" align="center">
          <caption><h3><font color=green>New Registration</font></h3></caption>
          <tr><td>Username:</td><td><input type="text" name="username" required="" value="${param.username}"></td></tr>
          <tr><td>Password:</td><td><input type="password" name="password" required=""></td></tr>
          <tr><td>Candidate Name:</td><td><input type="text" name="candidname" required=""></td></tr>
          <tr><td>Mobile Number:</td><td><input type="text" name="mobile" required=""></td></tr>
          <tr><td>Email Id:</td><td><input type="email" name="email" required=""></td></tr>
<tr><td>Address:</td><td><textarea rows="5" cols="30" name="address"></textarea></td></tr>
<tr><td>City:</td><td><input type="text" name="city"></td></tr>
<tr><td>State:</td>
    <td><select name="state">
    <c:forEach var = "row" items = "${result.rows}">
            
                <option value="${row.stateid}">${row.statename}</option>
            
         </c:forEach>
        </select></td></tr>



<tr><td>Year Of Experience:</td><td><input type="number" name="exp"></td></tr>

<tr><td>Qualification:</td>
    <td><select name="course">
    <c:forEach var="row" items="${qualify.rows}" >
         <option value="${row.courseid}">${row.course}</option>
        
    </c:forEach>
    </select>
    </td>
</td>
<tr><td></td><td><input type="submit" value="submit">
<input type="reset" value="cancel"></td></tr>
</table>
          
</form>
          <div id="link"> <a href="loginClient.jsp">Already Register?Login</a> </div>
    </body>
</html>
