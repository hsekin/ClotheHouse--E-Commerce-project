
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="model.Products"%>
<%@ page import="model.ProductDao"%>
<%
ProductDao pdao = new ProductDao();
ArrayList<Products> productList = pdao.fetchProduct();
pageContext.setAttribute("pdList", productList);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Details</title>
</head>
<style>
nav {
	height: 50px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	transition: 1s;
}

a {
	text-decoration: none;
}

nav:hover {
	transform: scale(1.01);
	z-index: 2;
}

nav form {
	display: flex;
	align-items: center;
}

nav input[type="text"] {
	width: 350px;
	padding: 5px;
	border-radius: 50px;
	border: none;
	margin-right: 5px;
	height: 40px;
}

nav button[type="submit"] {
	padding: 10px 40px;
	border-radius: 5px;
	border: none;
	background-color: #e9e9e9;
	color: white;
	cursor: pointer;
	margin-bottom: 10px;
}

nav ul {
	list-style-type: none;
	margin-left: 80px;
	padding-right: 30px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	height: 100%;
}

nav li {
	display: inline-flex;
	transition: 0.5s;
}

nav li:hover {
	transform: scale(1.3);
}

nav a {
	padding: 15px;
	border-radius: 15px;
	color: black;
}

th, td {
	padding: 40px;
}

.footer {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
	padding: 50px 40px;
	background-color: #E5E4E2;
	margin-top: 10px;
	padding-top: 20px;
}

.footer h2 {
	margin-top: 0;
	font-size: 1.5rem;
	font-weight: bold;
	color: #444;
}

.footer a {
	color: #333;
	text-decoration: none;
	margin-right: 10px;
}

.footer a:hover {
	color: #1d1c1c;
	background-color: rgb(211, 178, 178);
	border-radius: 3px;
}

.footer ul {
	list-style: none;
	margin: 0;
	padding: 0;
}

.footer ul li {
	margin-bottom: 10px;
	list-style: none;
}

.footer ul li a:hover {
	color: #030303;
	background-color: rgb(241, 207, 207);
}

.footer-content-2, .footer-content-3, .footer-content-4 {
	flex-basis: 25%;
	padding: 0 20px;
	text-align: center;
	display: block;
	list-style: none;
	float: left;
}

@media only screen and (max-width: 768px) {
	.footer-content-2 {
		margin: 20px;
	}
	.footer-content {
		margin-right: 30px;
	}

	/* First vertical menu */
	.footer-content-1 {
		margin-right: 30px;
	}

	/* Third vertical menu */
	.footer-content-3 {
		margin-right: 30px;
	}
	.e-button a {
		padding: 10px;
	}
</style>
<body>

	<nav>
		<div class="logo">
			<h1>Clothe House</h1>
		</div>
		<ul class="menu">
			<li><a href="adminPanel.jsp">Home</a></li>
		</ul>

	</nav>
	<h1 style="font-size: 46px;">Product Details</h1>

	<div class="table" style="margin-left: 20px;">
		<table>
			<tr>
				<th>Product Name</th>
				<th>Product Price</th>
				<th>Stock Available</th>
				<th>Category</th>
				<th>Product Image</th>
			</tr>
			<c:forEach var="product" items="${pdList}">
				<tr>
					<td><c:out value="${product.name}" /></td>
					<td>${product.price}</td>
					<td>${product.stock}</td>
					<td>${product.category}</td>
					<td><img
						src="${pageContext.request.contextPath}/web-content/productImage/${product.imagePath}"
						height="100px" width="100px"></td>
					<td class="e-button">
					<a href="${pageContext.request.contextPath}/editProduct?id=${product.name}">Edit</a>
					<a href="">Delete</a>
					</td>
				</tr>
			</c:forEach>
		</table>

	</div>

	<footer>
		<div class="footer">
			<div class="footer-content-2">
				<h2>Follow Us</h2>
				<ul>
					<li><a href="#"><i class="fa fa-instagram"></i> Instagram</a></li>
					<li><a href="#"><i class="fa fa-facebook-f"></i> Facebook</a></li>
					<li><a href="#"><i class="fa fa-youtube"></i> YouTube</a></li>
					<li><a href="#"><i class="fa fa-twitter"></i> Twitter</a></li>
				</ul>
			</div>
			<div class="footer-content-3">
				<h2>Popular Categories</h2>
				<ul>
					<li><a href="#">Menswear</a></li>
					<li><a href="#">Womenswear</a></li>
					<li><a href="#">Accesories</a></li>
					<li><a href="#">Shoes</a></li>
				</ul>
			</div>
			<div class="footer-content-4">
				<h2>Contact Us</h2>
				<ul>
					<li><a href="#">Itahari, Sunsari- Nepal</a></li>
					<li><a href="#">Clothehouse@gmail.com</a></li>
					<li><a href="#">98324424244</a></li>

				</ul>
			</div>
		</div>
	</footer>

</body>
</html>
