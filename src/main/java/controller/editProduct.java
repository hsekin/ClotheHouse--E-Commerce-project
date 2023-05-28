package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ProductDao;
import model.Products;

// EditServlet.java
@WebServlet("/editProduct")
public class editProduct extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the product ID from the request parameter
        String productId = request.getParameter("id");
        
        // Retrieve the product details from the database based on the product ID
        ProductDao productDao = new ProductDao();
        Products product = productDao.getProductById(productId);
        
        // Set the product object as an attribute in the request
        request.setAttribute("product", product);
        
        // Forward the request to the edit page
        request.getRequestDispatcher("/editProduct.jsp").forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the updated product details from the form
        String productId = request.getParameter("productId");
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String stock = request.getParameter("stock");
        String category = request.getParameter("category");
        String imagePath = request.getParameter("imagePath");
        
        // Create a new Product object with the updated details
//        Products updatedProduct = new Products(productId, name, price, stock, category, imagePath);
        
        // Update the product in the database
        ProductDao productDao = new ProductDao();
        String message = productDao.updateProduct(updatedProduct);
        
        // Set a success message or error message as an attribute in the request
        request.setAttribute("message", message);
        
        // Redirect the user back to the product list page
        response.sendRedirect(request.getContextPath() + "/viewProduct.jsp");
    }
}
