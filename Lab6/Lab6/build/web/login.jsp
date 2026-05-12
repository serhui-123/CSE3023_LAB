<%-- 
    Document   : login
    Created on : 12 May 2026, 7:18:29 pm
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
        <h2>Login Page</h2>
        <%
        String msg = request.getParameter("msg");
        if (msg != null) {
            out.println("<p style='color:red'>" + msg + "</p>");
        }
        %>

        <form action="doLogin.jsp" method="post">

            Username: <input type="text" name="username"><br><br>
            Password: <input type="password" name="password"><br><br>
            <input type="submit" value="Login">

        </form>


    </body>
</html>
