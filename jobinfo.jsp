
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
        <% int jobid=Integer.parseInt(request.getParameter("jobid")); %>
        <c:set var="jobid" value="<%=jobid %>" />
        <sql:query dataSource="${dataset}" var="result">
            select * from jobinfo where jobid=?
            <sql:param value="${jobid}"></sql:param>     
           
        </sql:query>
        <form action="updateCandid.jsp" method="post">
            <table border="5">
                <tr>
                    <th>Job Id</th>
                    <th>Job Title</th>
                    <th>Salary</th>
                    <th>Location</th>
                    <th>Action</th>
                </tr> 

                <c:forEach var = "row" items = "${result.rows}">
                    <tr>
                        <td><c:out value = "${row.jobid}" /></td> 
                        <td><c:out  value = "${row.job_title}"/></td>
                        <td><c:out value = "${row.salary}"/></td>
                        <td><c:out value = "${row.location}"/></td>
                        <td><input type="submit" value="apply"></td>
                    </tr>
                </c:forEach>

            </table>
        </form>
    </body>

</html>
