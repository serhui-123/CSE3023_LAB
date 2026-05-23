<%-- 
    Document   : insertStudent
    Created on : 12 May 2026, 4:11:20 pm
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
        <h1>Lab 6-Task 3- Create Records Constrained by Regular Expression In JSP </h1>
        <form action="processStudent.jsp" method="post"> 
            <fieldset>
                <legend>Student Registration</legend>
                <label for ="stuno">Student No: </label>
                <input type="text" id="stuno" name="stuno"><br><!-- comment -->
                <label for ="name">Name: </label>
                <input type="text" id="name" name="name"><br><!-- comment -->
                <label for ="program">Program: </label>
                <select id="program" name="program"><br><!-- comment -->
                    <option value="software engineering">BSc.Soft.Eng</option>
                    <option value="im">BSc. with IM</option>
                    <option value="networking">BSc.in Networking</option>
                    <option value="robotic">BSc.Robotics</option>
                </select>
                <input type="submit" value="Submit">
                <input type="reset" value="Cancel">
                    
            </fieldset>
            <p>&copy;2026-Grace Phua Ser Hui</p>
        </form>
    </body>
</html>
