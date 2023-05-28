package controller;

import java.io.IOException;
import java.io.InputStream;
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


@WebServlet("/AddProduct")
@MultipartConfig
public class addProduct extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	String id = request.getParameter("id");
    	String name = request.getParameter("name");
        String price = request.getParameter("price");
        String stock = request.getParameter("stock");
        String category = request.getParameter("category");
        String image = request.getParameter("image");
        
        
   
        
        
     // Get the uploaded file part
        Part filePart = request.getPart("image");
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = name + ".jpg".toString();
            InputStream fileContent = filePart.getInputStream();


        // save the file to a folder in your Eclipse project
        String savePath = "/Users/hsekin/Desktop/AD coursework/Java Coursework/src/main/webapp/web-content/productImage/" + fileName;
//        Files.copy(fileContent, Paths.get(savePath));
        
        filePart.write(savePath);

        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            // Connect to the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3305/e-commerceDatabase", "root", "");

            // Insert user data into the database
            String sql = "INSERT INTO `productDetails` (`Product ID`, `Product Name`, `Product Price`, `Stock`, `Category`, `Image`) VALUES (?,?,?,?,?,?)";

            stmt = conn.prepareStatement(sql);
            stmt.setString(1, id);
            stmt.setString(2, name);
            stmt.setString(3, price);
            stmt.setString(4, stock);
            stmt.setString(5, category);
            stmt.setString(6, fileName);
            stmt.executeUpdate();

            // Forward the request to a confirmation page
             request.getRequestDispatcher("view/addProduct.jsp").forward(request, response);
             }
        
        catch (SQLException e) {
        	e.printStackTrace();
            if (e.getErrorCode() == 1062) {
                String errorMessage = "This ID is already registered. Please use a different email.";
                System.out.println(errorMessage);
                request.setAttribute("errorMessage", errorMessage);
                request.getRequestDispatcher("view/addProduct.jsp").forward(request, response);
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
