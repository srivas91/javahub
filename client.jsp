

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="logo.html" %>
<%@include file="header.html" %>
<html>
<head> 
<title>job portal</title>
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
        margin-top:530px;
        position: absolute;
    }
</style>
</head>
<body bgcolor=pink>
    <sql:setDataSource var="dataset" driver="org.h2.Driver" url="jdbc:h2:~/mydb" user="sa" password="" />
    <sql:query dataSource="${dataset}" var="state">
        select * from stateinfo;
    </sql:query>
   <sql:query dataSource="${dataset}" var="qualify">
        select * from qualification order by course asc;
    </sql:query>
    <sql:query dataSource="${dataset}" var="job">
        select * from jobinfo order by job_title asc;
    </sql:query>
<form action="ClientServlet" method="post">
<table border="0" align="center">
    <caption><h3><font color=green>New Registration</font></h3></caption>
    <tr><td>Username:</td><td><input type="text" name="username" required="" value="${param.username}"></td></tr>
          <tr><td>Password:</td><td><input type="password" name="password" required=""></td></tr>
    <tr><td>Client Name:</td><td><input type="text" name="clientname" required="" ></td></tr>
    <tr><td>Mobile Number:</td><td><input type="text" name="mobile" required=""></td></tr>
    <tr><td>Email Id:</td><td><input type="email" name="email" required=""></td></tr>

<tr><td>Address:</td><td><textarea rows="5" cols="30" name="address"></textarea></td></tr>
<tr><td>City:</td><td><input type="text" name="city"></td></tr>
<tr><td>State:</td>
    <td><select name="state">
    <c:forEach var="row" items="${state.rows}" >
         <option value="${row.stateid}">${row.statename}</option>
    </c:forEach>
    
    </select></td>
</tr>
<tr><td>Job Id:</td><td><select>
    <c:forEach var="row" items="${job.rows}" >
         <option value="${row.jobid}">${row.jobid}</option>
    </c:forEach>
    
        </select></td></tr>
<tr><td>Job Title:</td><td><select>
    <c:forEach var="row" items="${job.rows}" >
         <option value="${row.jobid}">${row.job_title}</option>
    </c:forEach>
    
        </select name="state"></td></tr>
<tr><td>No.Of Openings:</td><td><input type="number" name="numopen"></td></tr>
<tr><td>Last date for Apply:</td><td><input type="date" name="lastdate"></td></tr>
<tr><td>Qualification:</td>
<td><select>
    <c:forEach var="row" items="${qualify.rows}" >
         <option value="${row.courseid}">${row.course}</option>
        
    </c:forEach>
    </select>
    </td>
    
<tr><td></td><td><input type="submit" value="submit">
<input type="reset" value="cancel"></td></tr>
</table>
    
    
    <div id="link"> <a href="loginClient.jsp">Already Register?Login</a> </div>
    
</form>
</body>
</html>