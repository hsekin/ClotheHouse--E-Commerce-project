<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.Users" %>
<%@ page import="model.UserDao" %>

<%
String Email = (String) request.getSession().getAttribute("email");
String Password = (String) request.getAttribute("password");
UserDao uDao = new UserDao();
Users user =  uDao.fetchUser(Email);
pageContext.setAttribute("user",user);

%>


<!DOCTYPE html>
<html>
<head>
<title>Profile</title>
</head>
<style>
nav {
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 10px;
	background-color: #f1f1f1;
}

.logo h1 {
	margin: 0;
}

.nav-content {
	display: flex;
	align-items: center;
}

.nav-content a {
	text-decoration: none;
	color: #333;
	font-weight: bold;
	padding:10px;
}

.menu {
	list-style: none;
	font-color: black;
}

.welcome h1 {
	font-size: 24px;
	font-style: bold;
}

.nav-content a:hover {
	transform: scale(1.4);
	z-index: 6;
}
 th, td{
  padding: 30px;
  text-decoration: none;
  }
  
  td a{
  text-decoration: none;
  }
  .e-button a{
  	padding: 6px;
  }
</style>
<body>
	<nav>
		<div class="logo">
			<h1>Clothe House</h1>	
		</div>

		<div class="nav-content">
			<%
			if (session.getAttribute("email") != null) {
			%>
			<a href="${pageContext.request.contextPath}/logoutServlet">Logout</a>
			<a href="home.jsp">Home</a>
			
			<%
			} else {
			%>
			<a href="userRegistration.jsp">Login</a>
			<%
			}
			%>
			<ul class="menu">
				
			</ul>
		</div>
	</nav>


	<div class="welcome">
		<% if (session.getAttribute("email") != null) { %>
    <h1>Welcome, <%= session.getAttribute("email") %>!
    </h1>
<% } else { %>
    <h1>Please login to view your profile.</h1>
<% } %>
		
	</div>
	
	<div class= "table" style="margin-left:20px;" >
    <table >
        <tr  >
            <th>User First Name</th>
            <th>User Last Name</th>
            <th>User Email</th>
            <th>User Password</th>
            <th>User Image</th>
        </tr>
        	
            <tr>
				<td><c:out value="${user.firstName}"/></td>
				<td>${user.lastName}</td>
				<td>${user.email}</td>
				<td>${user.password}</td>
				<td><img src="${pageContext.request.contextPath}/web-content/userImages/${user.imagePath}" height="100px" width="100px"></td>
				<td class= "e-button">
				<a href=" ${pageContext.request.contextPath}/view/editUser.jsp">Edit</a>
				 <a href="">Delete</a>
				 </td>
			</tr>	
       
    </table>
    
    </div>
	
	
	

</body>
</html>
