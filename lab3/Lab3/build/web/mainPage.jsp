 <%-- 
    Document   : mainPage
    Created on : 14 Apr 2026, 2:54:09 pm
    Author     : 60179
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@includefile="headerPage.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            p{
                color:red
            }
            </style>
    </head>
    <body>
        <h1>Using JSP Include directive</h1>
        <p>
         Java Server Page(JSP) is a technology for controlling the content
         or appearance of Web pages through the use of servlets, small 
         programs that are specified in the Web page and run on the Web server 
         to modify the Web page before it is sent to the user who request it.
        </p>
    </body>
</html>
<%@includefile="footerPage.jsp" %>
