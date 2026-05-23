<%-- 
    Document   : memberDirectory
    Created on : 14 Apr 2026, 3:32:39 pm
    Author     : 60179
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %> <%-- Requirement 7.1 [cite: 736] --%>
<!DOCTYPE html>
<html>
<head>
    <title>Member Directory</title>
</head>
<body>
    <%@include file="header.jsp" %> <%-- Requirement 2 [cite: 721] --%>

    <h2>Committee Member Directory</h2>

    <%
        ArrayList<String> members = (ArrayList<String>) session.getAttribute("clubMembers");
        ArrayList<String> memberClubs = (ArrayList<String>) session.getAttribute("clubNames");

        // Fix: If either list is missing, reset them both to be safe
        if (members == null || memberClubs == null) {
            members = new ArrayList<String>();
            memberClubs = new ArrayList<String>();

            session.setAttribute("clubMembers", members);
            session.setAttribute("clubNames", memberClubs);
        }

        // Check for new registration input
        String newStudent = request.getParameter("studName");
        String newClub = request.getParameter("club");

        if (newStudent != null && !newStudent.isEmpty()) {
            members.add(newStudent);
            // Ensure we add a club name so the lists stay the same size
            memberClubs.add(newClub != null ? newClub : "General"); 
        }
    %>

    <%-- Requirement 7.3: Dynamically display the names in an HTML table [cite: 738] --%>
    <table border="1" cellpadding="10" style="width: 80%; margin: auto; border-collapse: collapse;">
        <tr style="background-color: #d4b96e;">
            <th>No.</th>
            <th>Member Name</th>
            <th>Club Name</th> 
        </tr>
        <% for(int i=0; i < members.size(); i++) { %>
        <tr>
            <td><%= i + 1 %></td>
            <td><%= members.get(i) %></td>
            <td><%= memberClubs.get(i) %></td> 
        </tr>
        <% } %>
    </table>

    <%@include file="footer.jsp" %> <%-- Requirement 2 [cite: 721] --%>
</body>
</html>