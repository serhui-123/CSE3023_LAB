<%-- 
    Document   : index
    Created on : 2 Jun 2026
    Author     : 60179
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Car Shop Management System</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body class="container mt-5">
        <div class="jumbotron text-center bg-dark text-white">
            <h1 class="display-4">Application MVC System for Car Shop</h1>
            <p class="lead">Manage your inventory, pricing models, and engine specifications smoothly.</p>
        </div>
        
        <br>
        <div class="row justify-content-center">
            <ul class="list-group col-md-5 text-center shadow-sm">
                <li class="list-group-item list-group-item-action font-weight-bold">
                    <a href="<%=request.getContextPath()%>/list" class="text-primary d-block py-2">🚗 All Car Inventory List</a>
                </li>
                <li class="list-group-item list-group-item-action font-weight-bold">
                    <a href="<%=request.getContextPath()%>/new" class="text-success d-block py-2">➕ Add a New Car Entry</a>
                </li>
            </ul>
        </div>
    </body>
</html>