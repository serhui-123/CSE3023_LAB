<%-- 
    Document   : processBMI
    Created on : 21 Apr 2026, 3:39:11 pm
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
        <%
            // Retrieve values from the form
            String weightStr = request.getParameter("weight");
            String heightStr = request.getParameter("height");

            double weight = Double.parseDouble(weightStr);
            double height = Double.parseDouble(heightStr);

            // Calculate BMI
            double bmi = weight / (height * height);

            // Determine Category
            String category = "";
            if (bmi < 18.5) category = "Underweight";
            else if (bmi <= 25.0) category = "Normal";
            else category = "Overweight";

            // Use Forward and Param to send data to the Result Page
        %>
    <jsp:forward page="resultBMI.jsp">
    <jsp:param name="bmiVal" value="<%= String.valueOf(bmi) %>" />
    <jsp:param name="bmiCat" value="<%= category %>" />
    </jsp:forward>
    </body>
</html>
