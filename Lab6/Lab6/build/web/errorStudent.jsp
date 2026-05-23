<%-- 
    Document   : errorStudent
    Created on : 12 May 2026, 5:26:35 pm
    Author     : 60179
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form id="errorFrm" action="insertStudent.jsp" method="post">
            <h1>Lab 6 - Task 3- Create Records Constrained by Regular Expression In JSP</h1>
            <%= exception.getMessage() %>
                    <br>
        </form>
    </body>
</html>
