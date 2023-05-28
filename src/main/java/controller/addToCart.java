package controller;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;

@WebServlet("/addToCart")
public class addToCart extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        // Retrieve the product ID from the request parameter
        String productId = request.getParameter("id");

        // Retrieve the quantity of the product to add (optional)
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        // Get the user's session
        HttpSession session = request.getSession();

        // Retrieve the cart from the session
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            // If the cart doesn't exist in the session, create a new one
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        // Add the product to the cart
        cart.addItem(productId, quantity);

        // Redirect the user to the cart page or any other appropriate page
//        response.sendRedirect(request.getContextPath() + "/cart.java");
    }
}
