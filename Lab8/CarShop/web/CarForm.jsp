<%-- 
    Document   : CarForm
    Created on : 2 Jun 2026
    Author     : 60179
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Car Specification Processing</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body>
        <header>
            <nav class="navbar navbar-expand-md navbar-dark" style="background-color: #2c3e50">
                <div><a href="<%=request.getContextPath()%>/list" class="navbar-brand">Car Shop Management App</a></div>
            </nav>
        </header>
        <br>
        
        <div class="container col-md-5 my-4">
            <div class="card shadow">
                <div class="card-body">
                    <c:if test="${car != null}">
                        <form action="update" method="post">
                    </c:if>
                    <c:if test="${car == null}">
                        <form action="insert" method="post">
                    </c:if>

                        <h2 class="mb-4 text-secondary">
                            <c:if test="${car != null}">Edit Car Specifications</c:if>
                            <c:if test="${car == null}">Add New Car Spec</c:if>
                        </h2>

                        <c:if test="${car != null}">
                            <input type="hidden" name="id" value="<c:out value='${car.carId}' />" />
                        </c:if>

                        <fieldset class="form-group">
                            <label class="font-weight-bold">Car Brand</label>
                            <input type="text" value="<c:out value='${car.brand}' />" class="form-control" name="brand" required="required" placeholder="e.g. Toyota, Honda">
                        </fieldset>

                        <fieldset class="form-group">
                            <label class="font-weight-bold">Model Configuration</label>
                            <input type="text" value="<c:out value='${car.model}' />" class="form-control" name="model" required="required" placeholder="e.g. Civic, Camry">
                        </fieldset>

                        <fieldset class="form-group">
                            <label class="font-weight-bold">Cylinder Count (Engine)</label>
                            <input type="number" value="<c:out value='${car.cyclinder}' />" class="form-control" name="cyclinder" required="required" min="1" placeholder="4, 6, 8">
                        </fieldset>
                        
                        <fieldset class="form-group">
                            <label class="font-weight-bold">Retail Price ($)</label>
                            <input type="number" step="0.01" value="<c:out value='${car.price}' />" class="form-control" name="price" required="required" placeholder="0.00">
                        </fieldset>

                        <div class="mt-4">
                            <button type="submit" class="btn btn-success px-4">Save Specification</button>
                            <a href="<%=request.getContextPath()%>/list" class="btn btn-secondary px-4 ml-2">Cancel</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>