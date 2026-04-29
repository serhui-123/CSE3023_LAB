/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.lab.controller;

import com.lab.bean.Employee;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author 60179
 */
public class PayrollServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PayrollServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PayrollServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Create a list to hold student objects
        List<Employee> empList = new ArrayList<>();
        
        // Adding sample data
        Employee e1 = new Employee();
        e1.setEmpID("E001"); 
        e1.setName("Yap Soo Yan"); 
        e1.setDepartment("Information Department");
        e1.setBasicSalary(3500.00);
        
        
        Employee e2 = new Employee();
        e2.setEmpID("E002"); 
        e2.setName("Lim Chia Ying"); 
        e2.setDepartment("Information Department");
        e2.setBasicSalary(2800.00);
        
       Employee e3 = new Employee();
        e3.setEmpID("E003"); 
        e3.setName("Wong Cai Yi"); 
        e3.setDepartment("Information Department");
        e3.setBasicSalary(4200.00);

        // Employee 4
        Employee e4 = new Employee();
        e4.setEmpID("E004"); 
        e4.setName("Tan Ah Kao"); 
        e4.setDepartment("HR Department");
        e4.setBasicSalary(2500.00);

        // Employee 5
        Employee e5 = new Employee();
        e5.setEmpID("E005"); 
        e5.setName("Muthu"); 
        e5.setDepartment("Sales");
        e5.setBasicSalary(3100.00);
        empList.add(e1);
        empList.add(e2);
        empList.add(e3);
        empList.add(e4);
        empList.add(e5);
        
        // Share data with JSP
        request.setAttribute("employeeList", empList);
        
        // Forward to View
        RequestDispatcher rd = request.getRequestDispatcher("payroll_view.jsp");
        rd.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
