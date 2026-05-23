package com.lab.controller;
import com.lab.dao.ProductDAO;
import com.lab.model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class ViewProductServlet extends HttpServlet {
    
    private ProductDAO productDAO;

    public void init() {
        productDAO = new ProductDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ViewProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewProductServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        
        List<Product> listProduct = productDAO.selectAllProducts(); // Panggil DAO
        
        out.println("<h2>Product List</h2>");
        out.println("<table border='1'><tr><th>ID</th><th>Name</th><th>Category</th > <th>Price</th > <th>Quantity</th > <th>Actions</th > < / tr >");

        for (Product product : listProduct) {
        out.println("<tr>");
        out.println("<td>" + product.getId() + "</td>");
        out.println("<td>" + product.getName() + "</td>");
        out.println("<td>" + product.getCategory()+ "</td>");
        out.println("<td>" + product.getPrice() + "</td>");
        out.println("<td>" + product.getQuantity() + "</td>");
        out.println("<td><a href='UpdateProductServlet?id=" + product.getId() + "'>Edit</a> | ");
        out.println("<a href='DeleteProductServlet?id=" + product.getId() + "'> Delete</a></td>");
        out.println("</tr>");
        
        }
        out.println("</table>");
        out.println("<br><a href='add_product.html'>Add New Product</a>");
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
