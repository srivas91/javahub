
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <sql:setDataSource var="dataset" driver="org.h2.Driver" url="jdbc:h2:~/mydb" user="sa" password="" />
        <% int candidid=Integer.parseInt(request.getParameter("candidid")); %>
        <c:set var="jobid" value="<%=candidid %>" />
        <sql:query dataSource="${dataset}" var="result">
            select * from candidate where cid=?
            <sql:param value="${jobid}"></sql:param>     
           
        </sql:query>
        <form action="updateCandid.jsp" method="post">
            <table border="5">
                <tr>
                    <th>Client Id</th>
                    <th>Candidate Name</th>
                    <th>Mobile</th>
                    <th>Email</th>
                    <th>City</th>
                </tr> 

                <c:forEach var = "row" items = "${result.rows}">
                    <tr>
                        <td><c:out value = "${row.cid}" /></td> 
                        <td><c:out  value = "${row.candidname}"/></td>
                        <td><c:out value = "${row.mobile}"/></td>
                        <td><c:out value = "${row.email}"/></td>
                        <td><c:out value = "${row.city}"/></td>
                        
                    </tr>
                </c:forEach>

            </table>
        </form>
    </body>

</html>
