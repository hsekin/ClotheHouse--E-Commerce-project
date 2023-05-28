<!DOCTYPE html>
<html>
<head>
	<title>Add Product</title>
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
  
  th, td{
  padding: 30px;
 
  }
        body{
            background: linear-gradient(to bottom, #f2f2f2, #d9d9d9, #bfbfbf, #a6a6a6);           
        }
		form {
			margin: 50px auto;
			width: 50%;
			padding: 20px;
			border: 1px solid #cccc;
			border-radius: 10px;
		}
		
		label {
			display: block;
			margin-bottom: 5px;
			font-weight: bold;
		}
		
		input[type="text"], input[type="number"], input[type="file"], select {
			width: 100%;
			padding: 10px;
			margin-bottom: 20px;
			border: 1px solid #ccc;
			border-radius: 5px;
			box-sizing: border-box;
			font-size: 16px;
			background-color: #fff;
		}
		
		input[type="submit"], input[type="reset"] {
			background-color: #4CAF50;
			color: white;
			padding: 10px 20px;
			border: none;
			border-radius: 5px;
			cursor: pointer;
			font-size: 16px;
			margin-right: 10px;
		}
		
		input[type="submit"]:hover, input[type="reset"]:hover {
			background-color: #45a049;
		}
        .image-container {
		display: flex;
		flex-direction: column;
		align-items: center;
	    }
		
		/* Image preview styling */
		.image-preview {
        height: 300px;
        width: 250px;
        margin: 20px auto;
        background-size: contain;
        background-repeat: no-repeat;
        background-position: center;
        display: flex;
        justify-content: center;
        align-items: center;
        box-shadow: 3px 3px 9px #888888;
        }
        
	</style>
</head>
<body>

<nav>
		<div class="logo">
			<h1>Clothe House</h1>
		</div>
				<ul class="menu">
            <li><a href="adminPanel.jsp">Home</a></li>
          </ul>
          
	</nav>
	<!-- Add product form -->
	<form method="post" action="${pageContext.request.contextPath}/AddProduct" enctype="multipart/form-data">
		<label for="image">Image:</label>
		<input type="file" id="image" name="image" accept="image/*" onchange="previewImage(event)">
		<div class="image-container">
		    <div class="image-preview" id="imagePreview"></div>
		    <div> <h2>Product Image</h2></div>
	    </div>
	    
		<label for="id">Product Id:</label>
		<input type="text" id="id" name="id" placeholder="Enter Product Id ">
		<label for="name">Name:</label>
		<input type="text" id="name" name="name" placeholder="Enter Name ">
		<label for="price">Price:</label>
		<input type="text" id="price" name="price" placeholder="Enter price">
		<label for="stock">Stock:</label>
		<input type="number" id="stock" name="stock" placeholder="Enter stock">
		<label for="category">Category:</label>
		<select id="category" name="category">
			<option value="T-Shirt">T-Shirt</option>
			<option value="Pants">Pants</option>
			<option value="Jackets">Jackets</option>
			 <option value="Tops">Tops</option>
			 <option value="Hats">caps</option>
			 <option value="Track">Track</option>
		</select>
		<input type="submit" value="Add Product" onclick="validateForm()">
		<input type="reset" value="Reset" onclick="resetForm()">
	</form>
	
	<script>
		function previewImage(event) {
        var reader = new FileReader();
        reader.onload = function() {
        var output = document.getElementById('imagePreview');
        output.style.backgroundImage = 'url(' + reader.result + ')';
        output.style.backgroundSize = 'cover'; // Set background size to cover
    }
    reader.readAsDataURL(event.target.files[0]);
}
		
		function validateForm() {
			var image = document.getElementById("image").value;
			var price = document.getElementById("price").value;
			var stock = document.getElementById("stock").value;
			var category = document.getElementById("category").value;
			
			if (image && price && stock && category) {
				alert("Product has been added successfully");
			} else {
				alert("Please fill in all input fields and Try again");
			}
		}
		
		function resetForm() {
			document.getElementById("image").value = "";
			document.getElementById("imagePreview").value = "";
			document.getElementById("price").value = "";
			document.getElementById("stock").value = "";
			document.getElementById("category").value = "T-Shirt";
			document.getElementById("imagePreview").style.backgroundImage = "";
			alert("Form has been reset");
		}
	</script>
</body>
</html>