<%-- 
    Document   : bmiCalculator
    Created on : 21 Apr 2026, 3:24:59 pm
    Author     : 60179
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BMI Calculator</title>
    <style>
        .card { background: white; padding: 30px; border-radius: 8px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); max-width: 400px; margin: 40px auto; }
        input { width: 100%; padding: 10px; margin: 10px 0; border: 1px solid #ddd; border-radius: 4px; box-sizing: border-box; }
        .btn { background: #6f42c1; color: white; border: none; padding: 10px; width: 100%; cursor: pointer; border-radius: 4px; }
    </style>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <div class="card">
        <h1>BMI Calculator</h1>
        <form id="bmiform" action="processBMI.jsp" method="post">
            <label>Weight (kg):</label>
            <input type="number" step="0.01" name="weight" required placeholder="e.g. 70.5">
            
            <label>Height (m):</label>
            <input type="number" step="0.01" name="height" required placeholder="e.g. 1.75">
            
            <button type="submit" class="btn">Calculate BMI</button>
        </form>
        </div>
        <%@ include file="footer.jsp" %>
    </body>
</html>
