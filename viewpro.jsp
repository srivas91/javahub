

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <% int cid=Integer.parseInt(request.getParameter("id")); %>
        <sql:setDataSource var="dataset" driver="org.h2.Driver" url="jdbc:h2:~/mydb" user="sa" password="" />
        <sql:query dataSource="${dataset}" var="result">
           select * from candidate c,stateinfo s where c.stateid=s.stateid and c.cid=?
           <sql:param value="<%=cid%>"></sql:param>
        </sql:query>

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
                <tr><td><c:out value="${row.cid}" /></td>
                    <td><c:out value = "${row.candidname}"/></td>
                    <td><c:out value = "${row.mobile}"/></td>
                    <td><c:out value = "${row.email}"/></td>
                    <td><c:out value = "${row.address}"/></td>
                    <td><c:out value = "${row.city}"/></td>
                    <td><c:out value = "${row.statename}"/></td>
                    <td><a href="editCandid.jsp?id=${row.cid}" >Edit</a></td></tr>
            </c:forEach>

            </table>    

        
    </body>
</html>
