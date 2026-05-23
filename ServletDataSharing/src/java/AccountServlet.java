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


public class AccountServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        //mengambil semula parameter dari borang html asal
        String username = request.getParameter("username");
        
        //mengambil data yang dikongsi oleh LoginServlet
        String accountType = (String)request.getAttribute("accountType");
        String email = (String)request.getAttribute("email");
        
            
            out.println("<html><body>");
            out.println("<h2>Account Information</h2>");
            out.println("<hr>");
            out.println("<p><strong>Welcome, "+username+"!</strong><p>");
            out.println("<p><b>Email:</b> "+email+"</p>");
            out.println("<p><b>Account Type:</b> "+accountType + "</p>");
            out.println("<h1>Servlet AccountServlet at " + request.getContextPath() + "</h1>");
            out.println("</br>");
            out.println("<a href='login.html>Logout</a>");
            out.println("</body></html>");
        
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
