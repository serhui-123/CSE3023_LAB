<%-- 
    Document   : insertAuthor
    Created on : 12 May 2026, 3:15:09 pm
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
        <h1>Lab 6-Task 2- Perform creating and retrieving records via JSP page </h1>
        <form action="processAuthor.jsp" method="post"> 
            <fieldset>
                <legend>Author Registration</legend>
                <label for ="authNo">Author No: </label>
                <input type="text" id="authNo" name="authNo"><br><!-- comment -->
                <label for ="name">Name: </label>
                <input type="text" id="name" name="name"><br><!-- comment -->
                <label for ="addr">Address: </label>
                <input type="text" id="addr" name="addr"><br><!-- comment -->
                <label for ="city">City: </label>
                <input type="text" id="city" name="city"><br><!-- comment -->
                <label for ="state">State: </label>
                <input type="text" id="state" name="state"><br><!-- comment -->
                <label for ="zip">Zip: </label>
                <input type="text" id="zip" name="zip"><br>
                <input type="submit" value="Submit">
                <input type="reset" value="Cancel">
                    
            </fieldset>
            <p>&copy;2026-Dr.Wan Nural Jawahir Hj Wan Yussof</p>
            </form>
    </body>
</html>
