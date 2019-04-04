<%@page import="model.CandidateBean"%>
<%@page import="connect.CandidateDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*"%>
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
         
        <% 
            List<CandidateBean> list=CandidateDAO.getAllRecords();
            request.setAttribute("list",list);
        %>
        
        <sql:setDataSource var="dataset" driver="org.h2.Driver" url="jdbc:h2:~/mydb" user="sa" password="" />
    <sql:query dataSource="${dataset}" var="result">
        select * from candidate c,stateinfo s where c.stateid=s.stateid
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
            <th>Candidate Id</th>
            <th>Candidate Name</th>
            <th>Mobile Number</th>
            <th>Email Id</th>
            <th>Address</th>
            <th>City</th>
            <th>State</th>
            <th>Action</th>
        </tr> 
        
        <c:forEach items = "${result.rows}" var="row">
            <tr>
                <td>${row.cid}</td> 
               <td>${row.candidname}</td>
               <td>${row.mobile}</td>
               <td>${row.email}</td>
               <td>${row.address}</td>
               <td>${row.city}</td>
               <td>${row.statename}</td>
               <td><a href="editCandid.jsp?id=${row.cid}">Edit</a> &nbsp; &nbsp;
            <a href="deleteCandid.jsp?id=${row.cid}">Delete</a></td>
         </c:forEach>
                       
                       </tr>
            </tr>
      
            
    </table>
    </body>
</html>
