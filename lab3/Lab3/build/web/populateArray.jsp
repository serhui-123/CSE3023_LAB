<%-- 
    Document   : populateArray
    Created on : 14 Apr 2026, 2:16:03 pm
    Author     : 60179
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            
            table {
                margin-left: auto;
                margin-right: auto;
            }

            th {
                background-color: #d4b96e; /* gold color */
                padding: 10px 20px;
                font-size: 16px;
            }

            td {
                background-color: #FDF5E6;
                padding: 10px 20px;
                text-align: center;
            }
            
            tr:nth-child(3) td {
                background-color: white;
            }

            h1 {
                text-align: center;
            }
</style>
    </head>
    <body>
        <h1>Read Java array and populate it into HTML table</h1>
        <%
            String[] salesman = {"Salesman 1", "Salesman 2", "Salesman 3"};

            int[][] sales = {
                {2500, 2100, 2200},
                {2000, 1900, 2400},
                {1800, 2200, 2450}
            };
        %>

    <table border="1" cellpadding="5" cellspacing="0">
        
        <tr>
            <th>Salesman</th>
            <th>Jan</th>
            <th>Feb</th>
            <th>Mar</th>
        </tr>

    <%
        for(int i = 0; i < salesman.length; i++) {
    %>
        <tr>
            <td><%= salesman[i] %></td>
            <td><%= sales[i][0] %></td>
            <td><%= sales[i][1] %></td>
            <td><%= sales[i][2] %></td>
        </tr>
    <%
        }
    %>
    </table>
        &copy;2026-Syafiq
    </body>
</html>
