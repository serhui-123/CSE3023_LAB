<%-- 
    Document   : SampleInsertionRecord
    Created on : 12 May 2026, 2:29:23 pm
    Author     : 60179
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Lab 6 - Task 1 - Sample Insertion records into MySQL through JSP’s page</h1>
        
        <%
            int result;
            
        //step 1: Load JDBC Driver..
        Class.forName("com.mysql.cj.jdbc.Driver");
        out.println("Step 1: MySQL driver loaded...!");
        %>
        <br>
        <%
        
        //step 2 Establish the connection
        String myURL ="jdbc:mysql://localhost/csa3203";
        Connection myConnection = DriverManager.getConnection(myURL,"root","admin");
        out.println("Step 2: Database is connected");
        
        %>
        
        <br><!-- comment -->
        <%
        
        //step 3 Create a PreparedStatement object
        out.println("Step 3: Prepared Statements created...!");
        
        //Prepared SQL Query as a String
        String sInsertQry ="INSERT INTO FirstTable(Name, Age, Course) VALUES (?, ?, ?)";
        //Call method preparedStatement
        PreparedStatement myPS = myConnection.prepareStatement(sInsertQry);

        myPS.setString(1, "Ali");
        myPS.setInt(2, 22);
        myPS.setString(3, "Computer Science");

        %>
        
        <br>
        <%
        //Assign each value to respective columns for Book's table---
        out.println("Step 4:Perform insertion of records");
        String name = "Welcome to access MySQL database with JSP....!";
        myPS.setString(1,name);
        
        result=myPS.executeUpdate();
        
        if(result>0){
        %>
        
        <br>
        
        <%
            out.println("Step 5: Close database connection...!");
            out.println(" ");
            out.println("Database connection is closed...!");
            out.println("<p>"+"The record:("+name+") is successfullyt created...!"+"</p>");
            
            }
            //step 5 close the database connection...!
            myConnection.close();
        %>
    </body>
</html>
