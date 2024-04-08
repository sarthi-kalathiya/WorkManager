<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<title>viewtasks</title>
<style>
body {
	font-family: Arial, sans-serif;
	background: black;
	color: white;
}

h2 {
	text-align: center;
	font-size: 36px;
	color: white;
	margin-top: 50px;
}

form {
	display: flex;
	flex-direction: column;
	align-items: center;
	margin-top: 20px;
}

label {
	font-size: 18px;
	color: #333;
	margin-bottom: 10px;
}

input[type="text"], textarea, input[type="date"] {
	padding: 10px;
	font-size: 16px;
	border: 1px solid #ccc;
	border-radius: 4px;
	width: 300px;
	margin-bottom: 20px;
}

input[type="submit"] {
	color: white;
	font-size: 16px;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type="submit"]:hover, button:hover {
	background-color: #3e8e41;
}

table {
	border-collapse: collapse;
	margin-top: 50px;
	background: white;
}

thead {
	background-color: #333;
	color: white;
}

td {
	padding: 10px;
	text-align: left;
	border-bottom: 1px solid #ddd;
	color: black;
}

th {
	background: white;
	padding: 10px;
	text-align: left;
	border-bottom: 1px solid #ddd;
	color: black;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

button:hover {
	background-color: #006B8F;
}

.update {
	background-color: #008CBA;
	color: white;
	font-size: 16px;
	padding: 8px 16px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	margin-right: 10px;
}
</style>

<c:if test="${diff <= 2 && diff!=-10}">
	<script>
		window.onload = function() {
			alert("for " + "${urgent.title} " + "only " + "${diff} "
					+ "days left");
		};
	</script>
</c:if>

<body>
	<nav
		style="display: flex; justify-content: space-between; align-items: center; padding: 10px;">
		<div style="text-align: center; flex-grow: 1;">
			<h1 style="margin: 10;"></h1>
		</div>
		<div>
			<form method="post" action="/addtodo">
				<input type="hidden" name="name" value="${name}">
				<button type="submit" class="update">add todo</button>
			</form>
		</div>
	</nav>
	<c:choose>
		<c:when test="${todos != null}">
			<h2>List of Todos</h2>
			<table cellpadding="5" cellspacing="5" style="margin: 0 auto;">
				<thead>
					<tr style="background-color: black;">
						<th>Title</th>
						<th>Description</th>
						<th>Due Date</th>
						<th>Days Left</th>
						<th>Update</th>
						<th>Delete</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${todos}" var="t" varStatus="loop">
						<c:if test="${differences.get(loop.index) < 1}">
							<tr style="background-color: #b3b3b3;">
						</c:if>
						<c:if
							test="${differences.get(loop.index) == 1 || differences.get(loop.index) == 2}">
							<tr style="background-color: #f60e0e82;">
						</c:if>
						<c:if test="${differences.get(loop.index) > 2}">
							<tr style="background-color: #41c04187;">
						</c:if>
						<td>${t.title}</td>
						<td>${t.description}</td>
						<td>${t.date}</td>
						<td>${differences.get(loop.index)}</td>
						<td>
							<form method="post" action="/updatetodo">
								<input type="hidden" name="id" value="${t.id}"> <input
									type="hidden" name="name" value="${name}">
								<button type="submit" class="update">UpdateTodo</button>
							</form>
						</td>
						<td>
							<form method="post" action="/deletetodo">
								<input type="hidden" name="id" value="${t.id}"> <input
									type="hidden" name="name" value="${name}">
								<button type="submit">
									<img
										src="data:image/png;base64,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"
										alt="Description of the image"
										style="width: 30px; height: 30px;">
								</button>
							</form>
						</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:when>
		<c:otherwise>
			<h2>No todos found.</h2>
		</c:otherwise>
	</c:choose>
</body>
</html>