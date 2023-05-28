package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.AESEncryption;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Connect to the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3305/e-commerceDatabase", "root", "");

            // Check if the user exists in the database
            String query = "SELECT * FROM userDetails WHERE Email = ?";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, email);
            System.out.println(stmt);
            rs = stmt.executeQuery();

            if (rs.next()) {
                String encryptedPassword = rs.getString("Password");
                String decryptedPassword = AESEncryption.decrypt(encryptedPassword);
                System.out.println("Decrypted password: " + decryptedPassword + password);
                if (email.equals("admin@gmail.com") && password.equals("admin")) {
                    HttpSession session = request.getSession();
                    session.setAttribute("email", email);
                    session.setAttribute("password", password);
                    
                    request.getRequestDispatcher("view/adminPanel.jsp").forward(request, response);
                    System.out.println(password);
                }
                else if (password.equals(decryptedPassword)) {
                    // The user exists and password matches, so redirect to the home page
                    System.out.println("Redirecting to home page");
                    
                 // Storing user data in session using the SessionManager class
                    request.getSession().setAttribute("email", email);
                    
                    
                    request.getRequestDispatcher("view/home.jsp").forward(request, response);
                } 
                
                else {
                    // The user password does not match, so redirect to the login page with an error message
                    response.sendRedirect("view/userRegistration.jsp?error=Invalid email or password");
                    System.out.println("User password is not valid");
                }
            } else {
                // The user does not exist, so redirect to the login page with an error message
            	request.getSession().setAttribute("errorMessage", "User is not valid");
                response.sendRedirect("view/userRegistration.jsp");
                System.out.println("User is not valid");
                
                
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();	
        } finally {
            // Close the database connection and statement
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
