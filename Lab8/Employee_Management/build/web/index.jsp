<%-- 
    Document   : index
    Created on : 2 Jun 2026, 3:31:57pm
    Author     : 60179
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Management Application</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body class="container mt-5">
        <h1>Application MVC system for Employee Management</h1>
        <br>
        <ul class="list-group col-md-4">
            <li class="list-group-item">
                <a href="<%=request.getContextPath()%>/list">All Employee List</a>
            </li>
            <li class="list-group-item">
                <a href="<%=request.getContextPath()%>/new">Add a New Employee</a>
            </li>
            <li class="list-group-item">
                <a href="<%=request.getContextPath()%>/list">Edit Employee</a>
            </li>
        </ul>
    </body>
</html>