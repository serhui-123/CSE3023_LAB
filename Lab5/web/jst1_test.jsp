<%-- 
    Document   : jst1_test
    Created on : 29 Apr 2026, 2:13:12 pm
    Author     : 60179
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSTL Core Tags</title>
    </head>
    <body>
        <h2>JSTL Conditional Test</h2>
        
        <c:set var="score" value="85" />
        
        <p>Student Score: <c:out value="${score}" /> marks.</p>
        
        <c:if test="${score >= 50}">
            <p style="color: green;"><strong>Status: Pass! Congratulations.</strong>
            </p>
        </c:if>
            
        <c:if test="${score < 50}">
            <p style="color: red;"><strong>Status: Fail. Please try again.</strong>
            </p>
        </c:if>

    </body>
</html>
