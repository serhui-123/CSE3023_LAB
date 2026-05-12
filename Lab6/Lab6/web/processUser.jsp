<%-- 
    Document   : processUser
    Created on : 12 May 2026, 7:17:34 pm
    Author     : 60179
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%@page import="java.sql.*"%>

        <%
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");

        Connection conn = null;
        PreparedStatement ps = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/csa3203",
                "root",
                "admin"
            );

            String sql = "INSERT INTO userprofile VALUES (?, ?, ?, ?)";
            ps = conn.prepareStatement(sql);

            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, firstname);
            ps.setString(4, lastname);

            int result = ps.executeUpdate();

            if (result > 0) {
                response.sendRedirect("login.jsp?msg=Registration successful! Please login.");
            } else {
                out.println("Registration failed!");
            }

        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
        %>
    </body>
</html>
