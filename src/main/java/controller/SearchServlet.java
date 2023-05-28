//package controller;
//
//import java.io.IOException;
//import java.util.List;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import model.ProductDao;
//import model.Products;
//
//
//
//@WebServlet("/searchServlet")
//public class SearchServlet extends HttpServlet {
//    private Products productService;
//
//    @Override
//    public void init() throws ServletException {
//        // Initialize the ProductService (assuming you have a service class for handling product-related operations)
//        productService = new Products();
//    }
//
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        String searchTerm = request.getParameter("searchTerm");
//
//        // Perform the search operation
//        List<Product> searchResults = productService.searchProducts(searchTerm);
//
//        // Set the search results as a request attribute
//        request.setAttribute("searchResults", searchResults);
//
//        // Forward the request to the search results page
//        request.getRequestDispatcher("searchResults.jsp").forward(request, response);
//    }
//}