<%-- 
    Document   : payroll_view
    Created on : 29 Apr 2026, 4:04:52 pm
    Author     : 60179
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Employee Payroll View</title>
    </head>
    <body>
        <h2>Employee Payroll List</h2>
        <table border="1" cellpadding="8">
            <thead>
                <tr style="background-color: lightgray;">
                    <th>ID</th>
                    <th>Name</th>
                    <th>Department</th>
                    <th>Basic Salary (RM)</th>
                    <th>Status</th> <!-- New Column for Logic Challenge -->
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${employeeList}" var="emp">
                    <tr>
                        <td>${emp.empID}</td>
                        <td>${emp.name}</td>
                        <td>${emp.department}</td>
                        <td>${emp.basicSalary}</td>
                        <td>
                            <%-- Logic Challenge: RM3000 or above is Senior --%>
                            <c:choose>
                                <c:when test="${emp.basicSalary >= 3000}">
                                    <strong>Senior</strong>
                                </c:when>
                                <c:otherwise>
                                    Junior
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
