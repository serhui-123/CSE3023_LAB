<%-- 
    Document   : queryStudent
    Created on : 12 May 2026, 5:49:36 pm
    Author     : 60179
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            table {
                border-collapse: collapse;
            }

            td, th {
                border: 1px solid #999;
                padding: 0.5rem;
                text-align: left;
            }

            th {
                background: gold;
            }
        </style>
    </head>
    <body>
        <h1> Lab 6 - Task 4 : Retrieving record vis JSP page.</h1>
        
        <%
            out.println("<table>");
            out.println("<thead>");
            out.println("<tr>");
            out.println("<th>"+"Student No"+"</th>");
            out.println("<th>"+"Name"+"</th>");
            out.println("<th>"+"Program"+"</th>");
            out.println("</tr>");
            out.println("<tbody>");
            
        int result;
            
        //step 1: Load JDBC Driver..
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        //step 2 Establish the connection
        String myURL ="jdbc:mysql://localhost/csa3203";
        Connection myConnection = DriverManager.getConnection(myURL,"root","admin");        
       

        //Step 3: Create a statement object...
        Statement myStatement = myConnection.createStatement();
        
        //Step 4: Perform retrieve record from Student's table... (R-Retrieve)
        String myQuery = "SELECT * FROM student";
        ResultSet myResultSet = myStatement.executeQuery(myQuery);
                
        while ( myResultSet.next() )
        {
            out.print("<tr>");
            out.print("<td width=\"20%\">" + myResultSet.getString(1) + "</td>");
            out.print("<td width=\"40%\">" + myResultSet.getString(2) + "</td>");
            out.print("<td width=\"40%\">" + myResultSet.getString(3) + "</td>");
            out.print("</tr>");
        }
        out.print("</tbody>");
        out.print("</table>");
        myConnection.close();
        %>
    </body>
</html>
