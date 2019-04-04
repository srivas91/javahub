

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body bgcolor="pink">
       <sql:setDataSource var="dataset" driver="org.h2.Driver" url="jdbc:h2:~/mydb" user="sa" password="" />
       <sql:query var="result" dataSource="${dataset}">
           select * from jobinfo;
       </sql:query>
           <form action="jobinfo.jsp">
           <table border="0"  align="center">
    <tr><td>Job Id:</td>
        
        <td><select name="jobid">
            <c:forEach var="row" items="${result.rows}">
                <option value="${row.jobid}">${row.jobid}</option>
            </c:forEach> 
            </select></td>
            <td><input type="submit" value="search"></td></table>
           </table>
    </form>
    </body>
</html>
