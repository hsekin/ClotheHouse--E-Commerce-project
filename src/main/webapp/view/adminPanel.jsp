<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
ProductDao pdao = new ProductDao();
ArrayList<Products> productList = pdao.fetchProduct();
pageContext.setAttribute("pdList", productList);
%>
<%@ page import="model.Products"%>
<%@ page import="model.ProductDao"%>


<!DOCTYPE html>
<html>

<head>
<title>Clothe House</title>
</head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/view/Home.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<body>
	<nav>
		<div class="logo">
			<h1>Clothe House</h1>
		</div>
		<div class="search-bar">
			<form action="#" method="post">
				<input type="text" placeholder="Search..." /> <a href=""
					class="fa fa-search"></a>
			</form>


		</div>
		<ul class="menu">
			<li><a href="${pageContext.request.contextPath}/view/adminPanel.jsp">Home</a></li>
			<li class="dropdown"><a class="dropbtn">Admin Action</a>
				<ul class="sub-menu">
					<li><a
						href="${pageContext.request.contextPath}/view/viewProduct.jsp">View
							Product</a></li>
					<li><a
						href="${pageContext.request.contextPath}/view/addProduct.jsp">Add
							Product</a></li>
				</ul>

			<li><a href="${pageContext.request.contextPath}/view/#"
				class="fa fa-shopping-cart"> Orders</a></li>
		</ul>

	</nav>
 <div class="title" style= "font-size:20px; margin-left:450px;">
	<h2>Available Products</h2>
</div>
	<div class="product-listing">
		<c:forEach var="product" items="${pdList}">
			<div class="product-container">
				<div class="product-image">
					<img
						src="${pageContext.request.contextPath}/web-content/productImage/${product.imagePath}"
						alt="Product 1 Image" />
				</div>
				<div class="product-details">
					<p>Product Name: ${product.name}</p>
					<p>Category: ${product.category}</p>
					<p>Available Stock: ${product.stock}</p>
					<p>Price: $${product.price}</p>
				</div>
			</div>
		</c:forEach>
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
	<!-- <script >
	setTimeout(function() {
        location.reload();
    }, 5000);
	</script> -->
</body>
</html>
