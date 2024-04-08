<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>admin-Login</title>
<style>
body {
	background-color: black;
	color: white;
}

form {
	width: 400px;
	margin: 0 auto;
	font-family: Arial, sans-serif;
}

.form-group label {
	display: block;
	margin-bottom: 10px;
}

.form-control {
	padding: 10px;
	border-radius: 5px;
	border: 1px solid #ccc;
	font-size: 16px;
	width: 100%;
	box-sizing: border-box;
	margin-bottom: 20px;
}

.btn {
	background-color: #4CAF50;
	color: #fff;
	padding: 10px 20px;
	border-radius: 5px;
	border: none;
	font-size: 16px;
	cursor: pointer;
}

.btn:hover {
	background-color: #3e8e41;
}
</style>
</head>
<body>
	<nav
		style="display: flex; justify-content: space-between; align-items: center; padding: 10px;">
		<div style="text-align: center; flex-grow: 1;">
			<h1 style="margin: 10;">Admin-Login</h1>
		</div>
		<div>
			<a href="<%=request.getContextPath()%>/admin-signup"
				style="text-decoration: none; color: white;">Admin-signup</a>
		</div>
	</nav>
	<form action="admin-dashboard" method="POST">
		<div class="form-group">
			<label for="name">Name:</label> <input type="text" id="name"
				name="name" class="form-control" required>
		</div>
		<div class="form-group">
			<label for="password">Password:</label> <input type="password"
				id="password" name="password" class="form-control" required>
		</div>
		<input type="submit" value="Login" class="btn btn-primary">
	</form>
	<center>
		<h2>
			If you don't have an account then please first do <a
				style="text-decoration: none; color: white;"
				href="<%=request.getContextPath()%>/admin-signup">admin-signup</a>
		</h2>
	</center>
</body>
</html>