<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="model.Users" %>
<%@ page import="model.UserDao" %>
<%@page import="java.util.ArrayList"%>
<%
String Email = (String) request.getSession().getAttribute("email");
UserDao uDao = new UserDao();
Users user =  uDao.fetchUser(Email);
pageContext.setAttribute("user",user);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile</title>
</head>
<style>
	<style>
	
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
    }

    form {
        margin: 20px;
        padding: 20px;
        background-color: #fff;
        border: 1px solid #ccc;
        border-radius: 5px;
        width: 400px;
    }

    label {
        display: block;
        margin-bottom: 10px;
        font-weight: bold;
    }

    input[type="text"],
    input[type="password"],
    input[type="email"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 3px;
        box-sizing: border-box;
    }

    input[type="file"] {
        margin-top: 10px;
    }

    input[type="submit"] {
        padding: 10px 20px;
        background-color: #4CAF50;
        color: #fff;
        border: none;
        border-radius: 3px;
        cursor: pointer;
    }

    #image {
        display: block;
        margin-top: 10px;
        max-width: 100px;
        max-height: 100px;
    }
    
    .content{
    	margin-left: 300px;
    	margin-top: 80px;
    }
    
</style>
	
<body>

	<h1 style=" margin-left: 420px;"> Edit Profile</h1>
	<form action="${pageContext.request.contextPath}/updateUser" method="post" enctype="multipart/form-data" class="content" >
		<div>
			<label for="email"> User Email</label>
			<input type="email" name="email" id="email" value="${user.email}" />
		</div>
		<div>
			<label for="firstName">First Name</label>
			<input type="text" name="firstName" id="firstName" value="${user.firstName}"/>
		</div>
		<div>
			<label for="lastName">Last Name</label>
			<input type="text" name="lastName" id="lastName" value="${user.lastName}"/>
		</div>
		<div>
			<label for="pass">Password</label>
			<input type="password" name="password" id="pass" value="${user.password}"/>
		</div>
		
		<div>
			<input type="file" name="image" onchange="onImageChange()" id="imageChooser"/>
			<img id="image" src="images/${student.imagePath}" height="100px" width="100px" ">
		</div>
		
		<div>
			<input type="submit" value="Update"/>
		</div>
	</form>
	<script>
		function onImageChange(){
			var imageChooser = document.getElementById("imageChooser");
			var image = document.getElementById("image");
			image.src = URL.createObjectURL(imageChooser.files[0]);
		}
	</script>
</body>
</html>