<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Admin Sign Up</title>
<style>
body {
	background-color: black;
	color: white;
}

.my-form {
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
			<h1 style="margin: 10;">Admin-signup</h1>
		</div>
	</nav>

	<form action="adminlogin" method="POST" class="my-form">
		<div class="form-group">
			<label for="name">Name:</label> <input type="text"
				class="form-control" id="name" name="name" required>
		</div>
		<div class="form-group">
			<label for="password">Password:</label> <input type="password"
				class="form-control" id="password" name="password" required>
		</div>
		<button type="submit" class="btn btn-primary">Sign Up</button>
	</form>


</body>
</html>