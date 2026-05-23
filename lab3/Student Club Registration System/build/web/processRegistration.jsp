<%-- 
    Document   : processRegistration
    Created on : 14 Apr 2026, 3:32:07 pm
    Author     : 60179
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head><title>Registration Result</title></head>
<body>
    <%@include file="header.jsp" %>
    <h2>Submission Successful</h2>
    <%
        String name = request.getParameter("studName");
        String matric = request.getParameter("matricNo");
        String club = request.getParameter("club");

        // Get the lists from session
        ArrayList<String> members = (ArrayList<String>) session.getAttribute("clubMembers");
        ArrayList<String> memberClubs = (ArrayList<String>) session.getAttribute("clubNames");

        if (members == null) {
            members = new ArrayList<String>();
            memberClubs = new ArrayList<String>();

            
            session.setAttribute("clubMembers", members);
            session.setAttribute("clubNames", memberClubs);
        }

        if (name != null && !name.isEmpty()) {
            members.add(name);
            memberClubs.add(club); // Save the club name here
        }
    %>
    <p><strong>Student Name:</strong> <%= name %></p> 
    <p><strong>Matric Number:</strong> <%= matric %></p> 
    <p><strong>Selected Club:</strong> <%= club %></p> 
    
    <p><a href="memberDirectory.jsp">Click here to view the updated Member Directory</a></p>
    
    <%@include file="footer.jsp" %>
</body>
</html>