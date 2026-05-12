<%-- 
    Document   : registerMarathon
    Created on : 12 May 2026, 6:26:58 pm
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
       <h1>Lab 6-Task 5-Create A Record Using JSP Model 1 </h1>
        <form action="processMarathon.jsp" method="post"> 
            <fieldset>
                <legend>Marathon Registration</legend>
                <label for ="icno">IC No: </label>
                <input type="text" id="icno" name="icno"><br><!-- comment -->
                <label for ="name">Name: </label>
                <input type="text" id="name" name="name"><br><!-- comment -->
                <label for ="category">Category: </label>
                <select id="category" name="category"><br><!-- comment -->
                    <option value="5 KM">5 KM</option>
                    <option value="7 KM">7 KM</option>
                    <option value="10 KM">10 KM</option>
                    
                </select>
                <input type="submit" value="Submit">
                <input type="reset" value="Cancel">
                    
            </fieldset>
            <p>&copy;2026-Grace Phua Ser Hui</p>
            </form>
    </body>
</html>
