<%-- 
    Document   : feeCalculator
    Created on : 14 Apr 2026, 3:32:24 pm
    Author     : 60179
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>Fee Calculator</title></head>
<body>
    <%@include file="header.jsp" %>
    <h2>Membership Fee Calculator</h2>
    <form method="GET">
        Number of activities joined: <input type="number" name="activities">
        <input type="submit" value="Calculate">
    </form>
    
    <%
        String input = request.getParameter("activities");
        if (input != null && !input.isEmpty()) {
            int count = Integer.parseInt(input);
            double totalFee = count * 10.00; // RM10 per activity [cite: 733]
    %>
            <h3>Total Amount: RM <%= String.format("%.2f", totalFee) %></h3>
    <%  } %>
    <%@include file="footer.jsp" %>
</body>
</html>
