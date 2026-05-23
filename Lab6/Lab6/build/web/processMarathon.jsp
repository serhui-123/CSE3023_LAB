<%-- 
    Document   : processMarathon
    Created on : 12 May 2026, 6:38:53 pm
    Author     : 60179
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="Lab6.com.Database"%>
<%@page import="Lab6.com.Marathon"%>
<%@page import="Lab6.com.MarathonDAO"%>
<!-- Create an object for Marathon -->
<jsp:useBean id="myMarathon" class="Lab6.com.Marathon" scope="request"/>
<jsp:setProperty name="myMarathon" property="*"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Lab 6 -Task 5</h1>
        <%
            int result;

            //Step 1: Create Database object...
            Database myDB = new Database();

            MarathonDAO object1 = new MarathonDAO();

            //Step 2: Add the records...
            result = object1.addDetails(myMarathon);

            //Step 3: Determine whether the transaction is success...
            out.println("IC: " + myMarathon.getIcno());
            out.println("<br>Name: " + myMarathon.getName());
            out.println("<br>Category: " + myMarathon.getCategory());


            out.println("<br>Result = " + result);

            if (result > 0) {
                out.println("<p>Insert SUCCESS</p>");
            } else {
                out.println("<p>Insert FAILED</p>");
            }
            
            myDB.closeConnection();
            
        %>
    </body>
</html>
