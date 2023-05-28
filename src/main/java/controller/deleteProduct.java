package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class deleteProduct {
	// DeleteServlet.java
	@WebServlet("/deleteProduct")
	public class deleteServlet extends HttpServlet {
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        // Retrieve the product ID from the request parameter
	        String productId = request.getParameter("id");
	        
	        // Delete the product from the database based on the product ID
	        
	        // Redirect the user back to the product list page
	        response.sendRedirect(request.getContextPath() + "/viewProduct.jsp");
	    }
	}

}
