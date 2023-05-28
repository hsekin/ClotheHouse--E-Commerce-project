package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.AESEncryption;
import model.Users;
import model.UserDao;

@WebServlet("/updateUser")
@MultipartConfig
public class updateUser extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String encryptedPassword = AESEncryption.encrypt(password);
		String file = email+".png";
	
		Users user = new Users(firstName,lastName,email,encryptedPassword,file);
		UserDao uDao = new UserDao();
		String message =  uDao.updateUser(user);
		Part image = request.getPart("image");
		
		if(message.equals("Successfully Updated") && image!=null && image.getInputStream().available() > 0) {
			String savePath = "/Users/hsekin/Desktop/AD coursework/Java Coursework/src/main/webapp/web-content/userImages/";
			String fullPath = savePath + file;
			image.write(fullPath);
		}
		response.sendRedirect("view/Profile.jsp?id="+email);
	}
}
