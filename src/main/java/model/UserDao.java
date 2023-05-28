//package model;
//
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.ArrayList;
//
//public class UserDao {
//	public Connection getConnection() throws ClassNotFoundException, SQLException {
//		String url = "jdbc:mysql://localhost:3305/e-commerceDatabase";
//		String username = "root";
//		String password = "";
//		Class.forName("com.mysql.jdbc.Driver");
//		Connection con = DriverManager.getConnection(url,username,password);
//		return con;
//	}
//	
//	public ArrayList<Users> fetchUser(){
//		ArrayList<Users> userList = new ArrayList<>();
//		Connection con = null;
//		try {
//			con = getConnection();
//			String query = "select * from userDetails";
//			PreparedStatement st = con.prepareStatement(query);
//			ResultSet table = st.executeQuery();
//			while(table.next()) {
//				String firstName = table.getString(1);
//				String lastName = table.getString(2);
//				String email = table.getString(3);
//				String password = table.getString(4);
//				String imagePath = table.getString(5);
//				
//				
//				Users user = new Users(firstName,lastName, email, password, imagePath);
//				userList.add(user);		
//				
//				System.out.println("Name: " + firstName);
//				System.out.println("Name: " + lastName);
//	            System.out.println("Price: " + email);
//	            System.out.println("Stock: " + password);
//	            System.out.println("Image Path: " + imagePath);
//			}
//			
//			
//			
//		} catch (ClassNotFoundException | SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			
//		}
//		finally {
//			try {
//				con.close();
//			} catch (SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//			
//		}
//		return userList;
//		
//					
//	}
//}

package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserDao {
	public Connection getConnection() throws ClassNotFoundException, SQLException {
		String url = "jdbc:mysql://localhost:3305/e-commerceDatabase";
		String username = "root";
		String password = "";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, username, password);
		return con;
	}

	public Users fetchUser(String email) {
//		ArrayList<Users> userList = new ArrayList<>();
		Users user = null;
		Connection con = null;
		try {
			con = getConnection();
			String query = "select * from userDetails where email= ?";
			PreparedStatement st = con.prepareStatement(query);
			st.setString(1, email);
			ResultSet table = st.executeQuery();
			while (table.next()) {
				String firstName = table.getString(1);
				String lastName = table.getString(2);
				String userEmail = table.getString(3);
				String password = table.getString(4);
				String file = table.getString(5);

				user = new Users(firstName, lastName, userEmail, password, file);
//				userList.add(user);

				System.out.println("id: " + firstName);
				System.out.println("Name: " + lastName);
				System.out.println("Price: " + email);
				System.out.println("Stock: " + password);
				System.out.println("Image Path: " + file);
			}

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} 
		return user;

	}

	public String updateUser(Users user) {
		String message = "";
		try {
//			
			Connection con = getConnection();
			String query = "UPDATE userDetails SET `First Name` =?, `Last Name`=?, Password=?,Image =? where Email=?";
			PreparedStatement pst = con.prepareStatement(query);
			
			pst.setString(1, user.getFirstName());
			pst.setString(2, user.getLastName());
			pst.setString(3, user.getPassword());
			pst.setString(4, user.getImagePath());
			pst.setString(5, user.getEmail());
			
			System.out.println(pst);
			int rows = pst.executeUpdate();
			System.out.println(rows);
			if (rows >= 1) {
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
