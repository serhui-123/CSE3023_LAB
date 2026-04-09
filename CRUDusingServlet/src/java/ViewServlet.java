/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;

public class ViewServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ViewServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<h2>Users List</h2>");
            out.println("<table border='1'>");
            out.println("<tr><th>ID</th><th>Username</th><th>Password </th><th>Role</th><th>Actions</th></tr>");

        try {
            //1.Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            //2.Connect to database
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/CSE3023", "root", "admin");
            //3.Execute Select Query
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM users");
            //4.Display result in html table
            while(rs.next()){
                int id = rs.getInt("id");
                out.println("<tr>");
                out.println("<td>" + id + "</td>");
                out.println("<td>"+rs.getString("username")+"</td>");
                out.println("<td>"+rs.getString("password")+"</td>");
                out.println("<td>"+rs.getString("roles")+"</td>");
                
                out.println("<td><a href='UpdateServlet?id=" +id+"'>Edit</a> | ");
                out.println("<a href='DeleteServlet?id=" +id+"'>Delete</a></td>");
                out.println("</tr>");
                
            }
            out.println("</table>");
            out.println("<br><a href = 'index.html'>Add New User</a>");
            //5.closure
            rs.close();
            stmt.close();
            conn.close();
           
        }catch (Exception e){
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
