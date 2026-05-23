<%-- 
    Document   : processStudent
    Created on : 12 May 2026, 4:35:59 pm
    Author     : 60179
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@page errorPage="errorStudent.jsp" %>
<jsp:useBean id="myStudent" class="Lab6.com.Student" scope="request"/>
<jsp:setProperty name="myStudent" property="*"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
            int result;
            
        //step 1: Load JDBC Driver..
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        //step 2 Establish the connection
        String myURL ="jdbc:mysql://localhost/csa3203";
        Connection myConnection = DriverManager.getConnection(myURL,"root","admin");        
       
        //Step 3: Create a PreparedStatement object...
        System.out.println("Step 3: Prepared Statements created...!");

        //Prepared SQL Query as a String...
        String sInsertQry = "INSERT INTO Student(stuno, stuname, stuprogram) VALUES(?, ?, ?)" ;
        System.out.println("\tSQL Query: " + sInsertQry);

        //Call method preparedStatement
        PreparedStatement myPS = myConnection.prepareStatement(sInsertQry);

        //Assign each value to respective columns for Book's table... (C-Create)
        System.out.println("Step 4: Perform insertion of record...!");
        myPS.setString(1, myStudent.getStuno());
        myPS.setString(2, myStudent.getName());
        myPS.setString(3, myStudent.getProgram());

        %>
        
        <br>
        <%
        //Assign each value to respective columns for Book's table---
        
        
        
        //Step 4: Execute the query...
        result = myPS.executeUpdate();
        if ( result > 0 )
        {
            System.out.println("\tRecord successfully added into Book's table...!");
            out.print("<p>" + "Record with student no " + myStudent.getStuno() + 
                      " successfully created..!" + "</p>");
            out.print("<p>" + "Details of record are; " + "</p>");
            out.print("<p>Student ID : " + myStudent.getStuno() + "</p>");
            out.print("<p>Name : " + myStudent.getName() + "</p>");
            out.print("<p>Program : " + myStudent.getProgram() + "</p>");
        }
            //step 5 close the database connection...!
            
            out.println("Database connection is closed...!");
            myConnection.close();
        %>
    </body>
</html>

