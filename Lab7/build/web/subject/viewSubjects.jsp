<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.lab.bean.SubjectBean" %>
<!DOCTYPE html>
<html>
<head>
    <title>My Subjects</title>
</head>
<body>
    <h2>Registered Academic Subjects</h2>
    <p><a href="subject/registerSubject.jsp">➕ Register New Subject</a> | <a href="dashboard.jsp">🏠 Dashboard</a></p>
    
    <table border="1" cellpadding="8" cellspacing="0">
        <tr style="background-color: #f2f2f2;">
            <th>No</th>
            <th>Subject Code</th>
            <th>Subject Name</th>
            <th>Actions</th>
        </tr>
        <%
            ArrayList<SubjectBean> list = (ArrayList<SubjectBean>) request.getAttribute("subjectList");
            if (list == null || list.isEmpty()) {
        %>
            <tr>
                <td colspan="4">No subjects found.</td>
            </tr>
        <%
            } else {
                for (int i = 0; i < list.size(); i++) {
                    SubjectBean sub = list.get(i);
        %>
            <tr>
                <td><%= i + 1 %></td>
                <td><%= sub.getSubjectCode() %></td>
                <td><%= sub.getSubjectName() %></td>
                <td>
               
  
                    <a href="SubjectServlet?action=edit&id=<%= sub.getId() %>" class="btn btn-sm btn-warning">Edit</a> ||
                    <a href="SubjectServlet?action=delete&id=<%= sub.getId() %>" 
                       onclick="return confirm('Adakah anda pasti mahu memadam subjek ini? (Are you sure you want to delete this subject?)');" 
                       class="btn btn-sm btn-danger">
                       Delete
                    </a>||

                    <a href="subject/registerSubject.jsp">Register New Subject</a> ||
                    <a href="dashboard.jsp">Back to Dashboard</a>
                </td>
            </tr>
        <%
                }
            }
        %>
    </table>
</body>
</html>