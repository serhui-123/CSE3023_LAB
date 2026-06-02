<%-- 
    Document   : CarList
    Created on : 2 Jun 2026, 4:34:37 pm
    Author     : 60179
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Car Shop Inventory</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body>
        <header>
            <nav class="navbar navbar-expand-md navbar-dark" style="background-color: #2c3e50">
                <div>
                    <a href="" class="navbar-brand">Car Shop Management App</a>
                </div>
                <ul class="navbar-nav">
                    <li>
                        <a href="<%=request.getContextPath()%>/list" class="nav-link">Inventory</a>
                    </li>
                </ul>
            </nav>
        </header>
        <br>
        
        <div class="row mx-3">
            <div class="container-fluid">
                <h3 class="text-center">Car Showroom Catalog</h3>
                <hr>
                <div class="container-fluid text-left mb-3">
                    <a href="<%=request.getContextPath()%>/new" class="btn btn-success">Add New Car Spec</a>
                </div>
                
                <table class="table table-bordered table-striped">
                    <thead class="thead-dark">
                        <tr>
                            <th>ID</th>
                            <th>Brand</th>
                            <th>Model</th>
                            <th>Cylinders</th>
                            <th>Price ($)</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="car" items="${listCars}">
                            <tr>
                                <td><c:out value="${car.carId}" /></td>
                                <td><c:out value="${car.brand}" /></td>
                                <td><c:out value="${car.model}" /></td>
                                <td><c:out value="${car.cyclinder}" /></td>
                                <td><c:out value="${car.price}" /></td>
                                <td>
                                    <a href="edit?id=<c:out value='${car.carId}' />" class="btn btn-sm btn-primary">Edit</a>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="delete?id=<c:out value='${car.carId}' />" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this car entry?')">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
