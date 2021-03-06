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
        margin-top:100px;
        margin-left:100px;
        position: absolute;
    }
    th
    {
        font-size: 20px;
        color:purple;
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
        width:150px;
    }
    select option
    {
        width:100px;
    }
    input[type="date"]
    {
        width:250px;
    }
</style>
    </head>
    <body>
         <sql:setDataSource var="dataset" driver="org.h2.Driver" url="jdbc:h2:~/mydb" user="sa" password="" />
    <sql:query dataSource="${dataset}" var="result">
        select * from client;
    </sql:query>
        <sql:query dataSource="${dataset}" var="job">
        select * from jobinfo;
    </sql:query>
         <sql:query dataSource="${dataset}" var="qualify">
        select * from qualification;
    </sql:query>
          <form action="updateCandid.jsp" method="post">
    <table border="5">
        <tr>
            <th>Client Id</th>
            <th>Company Name</th>
            <th>Mobile Number</th>
            <th>Email Id</th>
            <th>Address</th>
            <th>City</th>
            <th>Action</th>
        </tr> 
        
        <c:forEach var = "row" items = "${result.rows}">
            <tr>
                <td><input type="text" name="cid" value = "${row.cid}" readonly="" size="5"/></td> 
               <td><input type="text" name="clientname" value = "${row.cname}"/></td>
               <td><input type="text" name="mobile" value = "${row.mobile}"/></td>
               <td><input type="text" name="email" value = "${row.email}"/></td>
               <td><input type="text" name="address" value = "${row.address}"/></td>
               <td><input type="text" name="city" value = "${row.city}"/></td>
               <td><a href="editClient.jsp?id=${row.cid}">Edit</a> &nbsp; &nbsp;
            <a href="deleteClient.jsp?id=${row.cid}">Delete</a></td>
            </tr>
        </c:forEach>
            
    </table>
    </body>
</html>
