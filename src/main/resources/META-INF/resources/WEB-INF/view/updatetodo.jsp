<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Todo</title>
<style>
body {
	background: black;
	font-family: Arial, sans-serif;
	color: #333;
	margin: 0;
	padding: 0;
}

h1 {
	font-size: 32px;
	margin-top: 40px;
	margin-bottom: 20px;
	color: white;
	text-align: center;
}

form {
	margin: 0 auto;
	width: 60%;
	padding: 2%;
	background-color: #fff;
	border: 1px solid #dcdcdc;
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
}

label {
	display: block;
	font-size: 18px;
	margin-bottom: 10px;
	color: #007bff;
}

input[type="text"], textarea, input[type="date"] {
	width: 96%;
	padding: 10px;
	margin-bottom: 20px;
	border-radius: 5px;
	border: 1px solid #dcdcdc;
	font-size: 18px;
	box-shadow: inset 0 2px 5px rgba(0, 0, 0, 0.1);
}

input[type="submit"] {
	background-color: #007bff;
	color: #fff;
	border: none;
	border-radius: 4px;
	font-size: 18px;
	padding: 10px 20px;
	cursor: pointer;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
	transition: all 0.2s ease-in-out;
}

input[type="submit"]:hover {
	background-color: #0062cc;
}
</style>
</head>
<body>
	<div class="container">
		<h1>Update your Todo ${name}</h1>
		<form action="form4" method="post">
			<input type="hidden" name="id" value=${id}> <label
				for="title">Todo:</label> <input type="text" id="title" name="title"
				value=${title}> <label for="description">Description:</label>
			<textarea id="description" name="description">${desc}</textarea>
			<label for="date">Date:</label> <input type="date" id="todoDate"
				name="todoDate" min="<%=java.time.LocalDate.now()%>"
				value=${dateoftodo}> <br> <br> <br> <input
				type="hidden" name="name" value=${name}>
			<div style="text-align: center;">
				<input type="submit" value="Update Todo">
			</div>
		</form>
	</div>
</body>
</html>