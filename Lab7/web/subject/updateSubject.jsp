<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.lab.bean.SubjectBean" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Subject</title>
</head>
<body>
    <h2>Edit Subject Details</h2>
    <%
        SubjectBean sub = (SubjectBean) request.getAttribute("subject");
        if (sub != null) {
    %>
    <form action="SubjectServlet" method="POST">
        <input type="hidden" name="action" value="update" />
        <input type="hidden" name="id" value="<%= sub.getId() %>" />
        
        Subject Code: <input type="text" name="subjectCode" value="<%= sub.getSubjectCode() %>" required /><br><br>
        Subject Name: <input type="text" name="subjectName" value="<%= sub.getSubjectName() %>" required /><br><br>
        <input type="submit" value="Save Changes" />
        <a href="SubjectServlet?action=view">Cancel</a>
    </form>
    <%
        } else {
            out.println("<p style='color:red;'>Subject not found.</p>");
        }
    %>
</body>
</html>