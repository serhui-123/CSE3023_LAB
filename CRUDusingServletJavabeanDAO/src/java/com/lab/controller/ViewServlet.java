package com.lab.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.lab.dao.UserDAO;
import com.lab.model.User;
import java.util.List;

public class ViewServlet extends HttpServlet {
    private UserDAO userDAO;

    public void init() {
        userDAO = new UserDAO();
    }

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
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        
        List<User> listUser = userDAO.selectAllUsers(); // Panggil DAO
        
        out.println("<h2>User List</h2>");
        out.println("<table border='1'><tr><th>ID</th><th>Username</th><th>Password</th > <th>Role</th > <th>Actions</th > < / tr >");

        for (User user : listUser) {
        out.println("<tr>");
        out.println("<td>" + user.getId() + "</td>");
        out.println("<td>" + user.getUsername() + "</td>");
        out.println("<td>" + user.getPassword() + "</td>");
        out.println("<td>" + user.getRoles() + "</td>");
        out.println("<td><a href='UpdateServlet?id=" + user.getId() + "'>Edit</a> | ");
        out.println("<a href='DeleteServlet?id=" + user.getId() + "'> Delete</a></td>");
        out.println("</tr>");
        
}
        out.println("</table>");
        out.println("<br><a href='index.html'>Add New User</a>");
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
