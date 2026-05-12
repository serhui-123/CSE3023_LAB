<%-- 
    Document   : doLogin
    Created on : 12 May 2026, 7:20:02 pm
    Author     : 60179
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/csa3203",
                "root",
                "admin"
            );

            String sql = "SELECT * FROM userprofile WHERE username=? AND password=?";
            ps = conn.prepareStatement(sql);

            ps.setString(1, username);
            ps.setString(2, password);

            rs = ps.executeQuery();

            if (rs.next()) {
                session.setAttribute("username", rs.getString("username"));
                session.setAttribute("firstname", rs.getString("firstname"));
                session.setAttribute("lastname", rs.getString("lastname"));

                response.sendRedirect("main.jsp");
            } else {
                response.sendRedirect("login.jsp?msg=Invalid username or password..!");
            }

        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
        %>
    </body>
</html>
