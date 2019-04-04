

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="logo.html" %>
<%@include file="header.html" %>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">
            input[type="text"]
            {
                background:yellow;
            }
            </style>
    </head>
    <% int cid=Integer.parseInt(request.getParameter("id")); %>
    <sql:setDataSource var="dataset" driver="org.h2.Driver" url="jdbc:h2:~/mydb" user="sa" password="" />
    <sql:query dataSource="${dataset}" var="result">
        select * from candidate c,stateinfo s where c.stateid=s.stateid and c.cid=?
        <sql:param value="<%=cid%>"></sql:param>
    </sql:query>
        <sql:query dataSource="${dataset}" var="state1">
        select * from stateinfo 
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
        
        <c:forEach var = "row" items = "${result.rows}">
            <tr>
                <td><input type="text" name="cid" value = "${row.cid}" readonly=""/></td> 
               <td><input type="text" name="candidname" value = "${row.candidname}"/></td>
               <td><input type="text" name="mobile" value = "${row.mobile}"/></td>
               <td><input type="text" name="email" value = "${row.email}"/></td>
               <td><input type="text" name="address" value = "${row.address}"/></td>
               <td><input type="text" name="city" value = "${row.city}"/></td>
               <td><input type="text" name="state" value = "${row.statename}"/></td>
               <td><input type="submit" value="update"></td>
            </tr>
        </c:forEach>
            
    </table>
            </form>
                
        
