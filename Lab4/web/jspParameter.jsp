<%-- 
    Document   : jspParameter
    Created on : 21 Apr 2026, 2:19:53 pm
    Author     : 60179
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Using JSP Standard Action</title>
        <style>
            /* Basic Settings */
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: #f4f7f6;
                margin: 0;
                padding: 20px;
            }
            
            .card {
                background: #ffffff;
                padding: 30px;
                border-radius: 8px;
                box-shadow: 0 4px 15px rgba(0,0,0,0.1);
                max-width: 500px; /* Added max-width to keep it card-sized */
                margin: 40px auto;
            }
             /* Main Title */
            h1 {
            font-size: 1.5rem;
            color: #333;
            margin-bottom: 20px;
            border-left: 5px solid #6f42c1;
            padding-left: 10px;
            }

            .form-title {
                color: #6f42c1;
                font-size: 1.8rem;
                font-weight: 600;
                margin-top: 0;
                margin-bottom: 25px;
            }

            .input-group { margin-bottom: 20px; }

            /* Main Labels */
            label {
                display: block;
                font-weight: bold;
                margin-bottom: 8px;
                color: #555;
            }

            input[type="text"] {
                width: 100%;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 4px;
                box-sizing: border-box;
            }

            /* Fix: Radio Button Alignment */
            .radio-group {
                display: flex;
                flex-wrap: wrap; /* Allows title to stay on top */
                gap: 15px;
                align-items: center;
            }

            /* Fix: Stop radio labels from jumping to new lines */
            .radio-group label {
                display: inline; 
                font-weight: normal;
                margin-left: 5px;
                margin-bottom: 0;
            }

            /* Make sure the "Customer Type" title stays as a block on top */
            .radio-group .group-label {
                display: block;
                width: 100%;
                font-weight: bold;
            }

            .button-group {
                margin-top: 30px;
                display: flex;
                gap: 10px;
            }

            .btn {
                padding: 10px 25px;
                border-radius: 4px;
                cursor: pointer;
                font-weight: bold;
                border: 1px solid #adadad;
            }

            .btn-submit { background-color: #e0e0e0; color: #333; }
            .btn-cancel { background-color: #e0e0e0; color: #333; }
            .btn-cancel:hover { background-color: #ffcccc; }
        </style>
    </head>
    <body>
        <h1>Using jsp:include and jsp:param to display information</h1>
        
        <%
            String sCode = "CSE3023";
            String sSubject = "Web-based Application Development";
            String sCredit = "3(2+1)";
        %>
        
        <jsp:include page="subjectInfo.jsp" flush="true">
        <jsp:param name="code" value="<%= sCode %>" />
        <jsp:param name="subject" value="<%= sSubject %>" />
        <jsp:param name="credit" value="<%= sCredit %>" />
        </jsp:include>
    </body>
</html>
