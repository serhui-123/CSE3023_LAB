<%-- 
    Document   : registerClub
    Created on : 14 Apr 2026, 3:30:17 pm
    Author     : 60179
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>Club Registration</title></head>
<body>
    <%@include file="header.jsp" %>
    <h2>Student Club Registration</h2>
    <form action="processRegistration.jsp" method="POST">
        <p>Student Name: <input type="text" name="studName" required></p>
        <p>Matric Number: <input type="text" name="matricNo" required></p>
        <p>Selected Club: 
            <select name="club">
                <option>Computer Science Club</option>
                <option>Math Society</option>
            </select>
        </p>
        <input type="submit" value="Register and View List">
    </form>
    <%@include file="footer.jsp" %>
</body>
</html>
