<%-- 
    Document   : dashboard
    Created on : 19 May 2026, 4:26:05 pm
    Author     : 60179
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.lab.bean.StudentBean"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Student Dashboard</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .profile-img {
            width: 160px;
            height: 160px;
            object-fit: cover;
            border: 5px solid #198754; 
        }
    </style>
</head>
<body class="bg-light">
    <%
        // 1. Session Verification (Security Check)
        response.setContentType("text/html;charset=UTF-8");
        StudentBean user = (StudentBean) session.getAttribute("loggedUser");

        // 如果没有登录，强行访问直接踢回登录页
        if(user == null) {
            response.sendRedirect("login.html");
            return;
        }
    %>
    <div class="container d-flex justify-content-center align-items-center" style="min-height: 100vh; padding: 20px 0;">
        <div class="card shadow-lg border-0 rounded-4 p-4 p-md-5 text-center" style="max-width: 600px; width: 100%;">
            <div class="card-body">
                <img src="data:image/jpeg;base64,<%= user.getBase64Image() %>"
                     alt="Profile Picture" class="profile-img rounded-circle shadow-sm mb-4" />
                
                <h2 class="fw-bold text-dark mb-2">Welcome, <%= user.getFullname() %>!</h2>
                <p class="text-muted fs-5 mb-4">Matric Number: <strong class="text-secondary"><%= user.getMatricNo() %></strong></p>
                
                <div class="card bg-white border rounded-3 p-3 mb-4 text-start">
                    <h5 class="fw-bold text-success mb-3">📚 Subject Management</h5>
                    <div class="d-grid gap-2">
                        <a href="SubjectServlet?action=view" class="btn btn-outline-success fw-semibold">
                             View My Registered Subjects
                        </a>
                        <a href="subject/registerSubject.jsp" class="btn btn-outline-primary fw-semibold">
                             Register New Subject
                        </a>
                    </div>
                </div>
                <div class="d-flex justify-content-center gap-2 flex-wrap">
                    <a href="UserServlet?action=logout" class="btn btn-dark px-4 py-2 fw-semibold">Logout</a>
                    
                    <a href="UserServlet?action=delete"
                       onclick="return confirm('WARNING: Are you sure you want to delete your account permanently?');"
                       class="btn btn-danger px-4 py-2 fw-semibold">Delete Account</a>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>