<%-- 
    Document   : resultBMI
    Created on : 21 Apr 2026, 3:25:39 pm
    Author     : 60179
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>BMI Result</title>
    <style>
        .result-card { background: white; padding: 30px; border-radius: 8px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); max-width: 400px; margin: 40px auto; text-align: center; }
    </style>
</head>
<body>
    <%@ include file="header.jsp" %>
    
   <%
        // Retrieve the parameters sent via <jsp:param>
        String bmiDisplay = request.getParameter("bmiVal");
        String categoryDisplay = request.getParameter("bmiCat");
        
        // Convert string back to double for formatting
        double finalBmi = Double.parseDouble(bmiDisplay);
    %>

    <div class="result-card" style="text-align: center; padding: 30px;">
        <h2>BMI Results</h2>
        <p>Your BMI: <strong><%= String.format("%.2f", finalBmi) %></strong></p>
        <p>Category: <strong><%= categoryDisplay %></strong></p>
        
        <br>
        <a href="bmiCalculator.jsp">Calculate Again</a>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>
