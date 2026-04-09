import com.lab.dao.ProductDAO;
import com.lab.model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateProductServlet extends HttpServlet {
    
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
            out.println("<title>Servlet UpdateProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateProductServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        int id = Integer.parseInt(request.getParameter("id"));
        Product existingProduct = productDAO.selectUser(id); // Panggil DAO
        if (existingProduct != null) {
            out.println("<h2>Update Product (Using DAO)</h2>");
            out.println("<form action='UpdateProductServlet' method='POST'>");
            out.println("<input type='hidden' name='id' value='"
                    + existingProduct.getId() + "'>");
            out.println("Name: <input type='text' name='name' value ='" + existingProduct.getName() + "'  required><br><br>");
            
            out.println("Category: <input type='text' name='category' value ='" + existingProduct.getCategory() + "'  required><br><br>");

            out.println("Price: <input type='text' name='price' value ='" + existingProduct.getPrice() + "'  required><br><br>");
            
            out.println("Quantity: <input type='text' name='quantity' value ='" + existingProduct.getQuantity() + "'  required><br><br>");

            out.println("<input type='submit' value='Update Product'>");
            out.println("</form>");

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        Double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        Product product = new Product(id, name, category, price, quantity);
        productDAO.updateProduct(product); // Panggil DAO, bukan JDBC
        response.sendRedirect("ViewProductServlet");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
