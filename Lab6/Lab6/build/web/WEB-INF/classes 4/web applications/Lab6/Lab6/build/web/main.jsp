<%-- 
    Document   : main
    Created on : 12 May 2026, 7:21:01 pm
    Author     : 60179
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Main Page</h2>
        <%
        String username = (String) session.getAttribute("username");
        String firstname = (String) session.getAttribute("firstname");
        String lastname = (String) session.getAttribute("lastname");

        if (username == null) {
            response.sendRedirect("login.jsp");
        }
        %>

        <p>Welcome: <%= username %></p>
        <p>First Name: <%= firstname %></p>
    </body>
</html>
