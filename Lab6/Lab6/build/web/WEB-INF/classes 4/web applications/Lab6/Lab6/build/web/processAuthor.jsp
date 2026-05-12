<%-- 
    Document   : processAuthor
    Created on : 12 May 2026, 3:33:27 pm
    Author     : 60179
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<jsp:useBean id="myAuthor" class="Lab6.com.Author" scope="request"/>
<jsp:setProperty name="myAuthor" property="*"/>
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
       
        //step 3 Create a PreparedStatement object   
        //Prepared SQL Query as a String
        String sInsertQry ="INSERT INTO Author(authNo, name, address, city, state, zip) VALUES (?,?,?,?,?,?)";        //Call method preparedStatement
        PreparedStatement myPS = myConnection.prepareStatement(sInsertQry);

        myPS.setString(1, myAuthor.getAuthNo());
        myPS.setString(2, myAuthor.getName());
        myPS.setString(3, myAuthor.getAddr());
        myPS.setString(4, myAuthor.getCity());
        myPS.setString(5, myAuthor.getState());
        myPS.setString(6, myAuthor.getZip());

        %>
        
        <br>
        <%
        //Assign each value to respective columns for Book's table---
        
        
        result = myPS.executeUpdate();
        if (result > 0) {

            out.print("<h1>Lab 6 - Task 2</h1>");

            out.print("<p>Record successfully added into Author table!</p>");

            out.print("<p>Record with author no "
                    + myAuthor.getAuthNo()
                    + " successfully created!</p>");

            out.print("<p>Details of record are:</p>");

            out.print("<p>Name : " + myAuthor.getName() + "</p>");
            out.print("<p>Address : " + myAuthor.getAddr() + "</p>");
            out.print("<p>City : " + myAuthor.getCity() + "</p>");
            out.print("<p>State : " + myAuthor.getState() + "</p>");
            out.print("<p>Zip : " + myAuthor.getZip() + "</p>");
        }
            //step 5 close the database connection...!
            out.println("Step 5: Close database connection...!");
            out.println("Database connection is closed...!");
            myConnection.close();
        %>
    </body>
</html>
