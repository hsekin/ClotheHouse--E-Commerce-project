<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<link rel="stylesheet" href="login.Css">
<style type="text/css">
body {
	margin: 0;
	padding: 0;
}

.login-page {
	height: 100vh;
	display: flex;
	align-items: center;
	background-size: cover;
	background-position: center;
	background:
		url("https://images.unsplash.com/photo-1523199455310-87b16c0eed11?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80")
		/* background: linear-gradient(to bottom, dark grey, light grey); */
}

.form-box {
	width: 380px;
	height: 480px;
	position: relative;
	margin: 2% auto;
	background: rgb(199, 191, 199, 0.6);
	/* opacity: 100%; */
	padding: 10px;
	overflow: hidden;
	border-radius: 30px;
}

.button-box {
	width: 220px;
	margin: 35px auto;
	position: relative;
	border-radius: 30px;
}

.toggle-btn {
	padding: 10px 30px;
	cursor: pointer;
	background: transparent;
	border: 0;
	outline: none;
	position: relative;
}

#btn {
	top: 0;
	left: 0;
	position: absolute;
	width: 110px;
	height: 100%;
	background: #F3C693;
	border-radius: 30px;
	transition: .5s;
}

.input-group-login {
	top: 150px;
	position: absolute;
	width: 180px;
	transition: .5s;
	padding-left: 50px;
	font-color: black;
}

.my-input::placeholder {
  color: red;
}
.input-group-register {
	top: 120px;
	position: absolute;
	width: 190px;
	transition: .5s;
	padding-left: 50px;
}

.input-field {
	width: 100%;
	padding: 10px 0;
	margin: 5px 0;
	border-left: 0;
	border-top: 0;
	border-right: 0;
	border-bottom: 1px solid black;
	outline: none;
	background: transparent;
}
.input-field::placeholder {
  color: black;
}

.submit-btn {
	width: 85%;
	padding: 10px 30px;
	cursor: pointer;
	display: block;
	margin: auto;
	background: #F3C693;
	border: 0;
	outline: none;
	border-radius: 30px;
}

.check-box {
	margin: 30px 10px 34px 0;
}

span {
	/* color: #777 */;
	font-size: 12px;
	bottom: 68px;
	position: absolute;
}

#login {
	left: 50px;
}

#login input {
	color: rgb(0, 0, 0);
	font-size: 15;
}

#register {
	left: 450px;
}

#register input {
	color: rgb(0, 0, 0);
	font-size: 15;
}
</style>
</head>
<body>
	<div id='login-form' class='login-page'>
		<div class="form-box">
			<div class='button-box'>
				<div id='btn'></div>
				<button type='button' onclick='login()' class='toggle-btn'>Log
					In</button>
				<button type='button' onclick='register()' class='toggle-btn'>Register</button>
			</div>
			<div class="form">
				<form id='login' class='input-group-login' method="post"
					action="${pageContext.request.contextPath}/LoginServlet">
					<%-- <h1>${errorMessage}</h1> --%>
					<input type='text' class='input-field' placeholder='Email'
						name="email" required> <input type='password'
						class='input-field' placeholder='Enter Password' required name= "password"/> <input
						type='checkbox' class='check-box'><span>Remember
						Password</span>
					<button type='submit' class='submit-btn'>Log in</button>
				</form>
				<form id='register' class='input-group-register' method="post"
					action="${pageContext.request.contextPath}/RegistrationServlet" enctype="multipart/form-data">
					<input type='text' class='input-field' id='fName' name='fName'
						placeholder='First Name' required> <input type='text'
						class='input-field' id='lName' name='lName'
						placeholder='Last Name ' required> <input type='email'
						class='input-field' id='email' name='email' placeholder='Email'
						required> <input type='password' class='input-field'
						id='password' name='password' placeholder='Enter Password'
						required> <input type="file" id="file" name="file"
						required> <input type='checkbox' class='check-box'><span>I
						agree to the terms and conditions</span>
					<button type='submit' class='submit-btn'>Register</button>
				</form>
			</div>
		</div>
	</div>
	<script>
		var x = document.getElementById('login');
		var y = document.getElementById('register');
		var z = document.getElementById('btn');
		function register() {
			x.style.left = '-400px';
			y.style.left = '50px';
			z.style.left = '110px';
		}
		function login() {
			x.style.left = '50px';
			y.style.left = '450px';
			z.style.left = '0px';
		}
	</script>
	<script>
		var modal = document.getElementById('login-form');
		window.onclick = function(event) {
			if (event.target == modal || modal.contains(event.target)) {
				// Click inside the login form, do nothing
				return;
			}
			// Click outside the login form, close the form
			modal.style.display = "none";
		}
	</script>
</body>
</html>