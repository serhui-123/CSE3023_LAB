<%-- 
    Document   : healthInfo
    Created on : 21 Apr 2026, 3:25:46 pm
    Author     : 60179
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Health Info</title>
    <style>
        table { width: 50%; margin: 40px auto; border-collapse: collapse; background: white; }
        th, td { padding: 12px; border: 1px solid #ddd; text-align: center; }
        th { background-color: #6f42c1; color: white; }
    </style>
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <h2 style="text-align: center;">BMI Categories Reference</h2>
    
    <%
        ArrayList<String> categories = new ArrayList<>();
        categories.add("Underweight (< 18.5)");
        categories.add("Normal (18.5 - 25.0)");
        categories.add("Overweight (> 25.0)");
    %>
    
    <table>
        <tr><th>Health Category</th></tr>
        <% for(String cat : categories) { %>
            <tr><td><%= cat %></td></tr>
        <% } %>
    </table>

    <%@ include file="footer.jsp" %>
</body>
</html>