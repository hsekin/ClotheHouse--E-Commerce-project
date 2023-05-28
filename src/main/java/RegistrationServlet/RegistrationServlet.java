package RegistrationServlet;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.AESEncryption;

@WebServlet("/RegistrationServlet")
@MultipartConfig
public class RegistrationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String firstName = request.getParameter("fName");
        String lastName = request.getParameter("lName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String image = request.getParameter("file");
        String encryptedPassword = AESEncryption.encrypt(password);
        
        
        System.out.println("First Name: " + firstName);
        System.out.println("Last Name: " + lastName);
        System.out.println("Email: " + email);
        System.out.println("Password: " + password);
        System.out.println("Password: " + image);
        
        
        
     // Get the uploaded file part
        Part filePart = request.getPart("file");
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = email + ".jpg".toString();
            InputStream fileContent = filePart.getInputStream();


        // save the file to a folder in your Eclipse project
        String savePath = "/Users/hsekin/Desktop/AD coursework/Java Coursework/src/main/webapp/web-content/userImages/" + fileName;
//        Files.copy(fileContent, Paths.get(savePath));
        filePart.write(savePath);

        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            // Connect to the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3305/e-commerceDatabase", "root", "");

            // Insert user data into the database
            String sql = "INSERT INTO userDetails (`First Name`, `Last Name`, Email, Password, Image) VALUES (?, ?, ?, ?, ?)";

            stmt = conn.prepareStatement(sql);
            stmt.setString(1, firstName);
            stmt.setString(2, lastName);
            stmt.setString(3, email);
            stmt.setString(4, encryptedPassword);
            stmt.setString(5, fileName);
            stmt.executeUpdate();

            // Forward the request to a confirmation page
             request.getRequestDispatcher("view/home.jsp").forward(request, response);
             }
        
        catch (SQLException e) {
            if (e.getErrorCode() == 1062) {
                String errorMessage = "This email is already registered. Please use a different email.";
                System.out.println(errorMessage);
                request.setAttribute("errorMessage", errorMessage);
                request.getRequestDispatcher("view/userRegistration.jsp").forward(request, response);
            } 
        }
        
        catch (ClassNotFoundException e) {
            e.printStackTrace();
            
        } finally {
            // Close the database connection and statement
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
    
    
    
}
