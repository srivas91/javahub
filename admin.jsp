

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="logo.html" %>
<%@include file="header.html" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">
            #rep
            {
                margin-top: 80px;
                position:absolute;
                background:yellow;
                text-decoration: none;  
                margin-left:40px;
            }
            #rep a{
                text-decoration: none;
                padding:20px;
                background: yellow;
                
               
            }

        </style>
    </head>

    <body bgcolor=pink>
        <div id="rep"> <a href="clientrep.jsp">Client Report</a>
            <a href="candidrep.jsp">Candidate Report</a>
            <a href="ackrep.html">Acknowledge Report</a>
        </div>
    </body>

</html>
