package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class ProductDao {
	
	public Connection getConnection() throws ClassNotFoundException, SQLException {
		String url = "jdbc:mysql://localhost:3305/e-commerceDatabase";
		String username = "root";
		String password = "";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url,username,password);
		return con;
	}
	
	public ArrayList<Products> fetchProduct(){
		ArrayList<Products> productList = new ArrayList<>();
		Connection con = null;
		try {
			con = getConnection();
			String query = "select * from productDetails";
			PreparedStatement st = con.prepareStatement(query);
			ResultSet table = st.executeQuery();
			while(table.next()) {
				String id = table.getString(1);
				String name = table.getString(2);
				String price = table.getString(3);
				String stock = table.getString(4);
				String category = table.getString(5);
				String imagePath = table.getString(6);
				
				
				Products product = new Products(name,price, stock, category, imagePath);
				productList.add(product);		
				
				
			}
			
			
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return productList;
		
					
	}
	public String updateProduct(Products product) {
		String message = "";
		try {
			
			Connection con =  getConnection();
			String query = "UPDATE productDetails SET name=?, price=?,password=?,image_path=? where id=?";
			PreparedStatement pst = con.prepareStatement(query);
			
			pst.setString(1,product.getId());
			pst.setString(2,product.getName());
			pst.setString(3,product.getPrice());
			pst.setString(4,product.getStock());
			pst.setString(5,product.getCategory());
			pst.setString(6,product.getImagePath());

			int rows = pst.executeUpdate();
			if(rows >= 1) {
				message = "Successfully Updated";
			}
			con.close();	
		} catch (SQLException | ClassNotFoundException e) {
			System.out.println(e.getMessage());
			message = e.getMessage();
		}
		return message;	
	}
}