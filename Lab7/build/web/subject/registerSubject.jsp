<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register Subject</title>
</head>
<body>
    <h2>Register New Subject</h2>
    <form action="../SubjectServlet" method="POST">
    <input type="hidden" name="action" value="add" />
    Subject Code: <input type="text" name="subjectCode" required /><br><br>
    Subject Name: <input type="text" name="subjectName" required /><br><br>
    
    <input type="submit" value="Register" />
    <a href="../dashboard.jsp">Cancel and Back</a>
    </form>
</body>
</html>