<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<title>viewusers</title>
<style>
body {
	font-family: Arial, sans-serif;
	color: #333;
	margin: 0;
	padding: 0;
	background-image:
		url('data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBwgHBgkIBwgKCgkLDRYPDQwMDRsUFRAWIB0iIiAdHx8kKDQsJCYxJx8fLT0tMTU3Ojo6Iys/RD84QzQ5OjcBCgoKDQwNGg8PGjclHyU3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3N//AABEIAH8AvgMBIgACEQEDEQH/xAAZAAADAQEBAAAAAAAAAAAAAAAAAQIEAwf/xAAhEAEBAAICAwEBAQEBAAAAAAAAAQIRAyESMUETYVFxIv/EABgBAQEBAQEAAAAAAAAAAAAAAAABAgME/8QAGBEBAQEBAQAAAAAAAAAAAAAAAAERAhL/2gAMAwEAAhEDEQA/APQccOnTHAYR2mL1WvBI5zj+q8HbDHa/zZtaxn/NWPG7+Ha/FNaxnuCLjdtdxT4yfDSxnmFP8599tHjD8OzTyzXjOcbTMTkTVxly40/n9arifh0up5ZPAfnpq8JsXAlPLHONf5tMwPxNXyy3Arh01+Ec88ejTGbwpXFo0jLHa6zjJljquWUauTFws7ajnY7cTTjJYz8XTRizW+XTCSOmv8c46S7iOkOQa0WzjOqNdFo5dno1Sk0fQENBegKQg+mWt+z9AWgfZAW+zlSN6UNN0tNBOk5OqbFZxl5MfbNlJvu2f8m2zlZc7q9NRiq42nH1/Wfi004JV5X8Vj6I5NI2rE9lPZ2MqIZHOgK7JV7AEUpkCoaYYpoXE0C0NKxGhMTCqi0qCUqNC+gcOadsnJLvps5GXL23HPocXTVhembijVhEq8r9qkEhstwQ9lBoU1fC+FEDgogopASGIIDkPUFIuv8ADpS9gcOwdjdBFHw8v9IiEV9KLJRw5OvbHnf/AE18zHn7bjl068TVj6ZOK6asL0lXl1ns0nP6y2IopoxTGkmgZ62UAo0N9g5oAD3C0BUaABXzoqWxewKkYnSoScrJ7XYiwSs/Lkycntr5mTknpuOXTpxtWDNxxow6StR2xp2o9n8RpUo2Xo5doo2cTvVVCqYHwIHDiVSinpNPe00AC2YgAAEZQ4A9Fl6PLtzzWJXDmntkz9teevTNnJvpqOXTtxenbFw467Y0rUdJDTKrcRqHoevXotqxqKJJVyaTP4qZbKp30VFpWooETs5d0QypkoR7ICH9NPkNgextGz2GnUZU7U53oHLksZs7q9O3JfjPnZK3HLo8MtO+OX9Y/LTpjmtjMrbMj8maZneRnHTWiZKmW2T9D/TRhrZMv6rc+Mk5FTkTGtaLkLk4foV5A12t0Jk4+ZfoYmtPkVycZmLmYa7eRbcLnovOmGtG4m5f1wuZXNcNd7kV5HDzqfK0xNapntPJlJ6cLy+HztFzt7PKel5ZRwyvYyy2lqRi1//Z');
	background-size: cover;
}

h2 {
	text-align: center;
	font-size: 36px;
	color: #333;
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

input[type="submit"]:hover, button:hover {
	background-color: #3e8e41;
}

table {
	border-collapse: collapse;
	margin-top: 50px;
	border: 1px solid black;
}

thead {
	background-color: #333;
	color: white;
}

th, td {
	padding: 10px;
	text-align: left;
	border-bottom: 1px solid black;
}

td {
	background-color: white;
	color: black;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

button:hover {
	background-color: #006B8F;
}


.logoutform {
        position: absolute;
        margin-top: 0px;
		margin-left: 1350px;
		background-color: #008CBA;
		color: white;
		font-size: 16px;
		padding: 8px 16px;
		border: none;
		border-radius: 4px;
		cursor: pointer;
    }
</style>



<body>
 <form method="post" action="/admin-logout" >
				<input type="hidden" name="name" value="${name}">
				<button type="submit" class="logoutform">logout</button>
   </form>
	<c:choose>
		<c:when test="${users != null}">
			<h2>List of Users</h2>
			<table cellpadding="5" cellspacing="5" style="margin: 0 auto;">
				<thead>
					<tr style="background-color: black;">
						<th>Name</th>
						<th>Password</th>
						<th>Delete</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${users}" var="t" varStatus="loop">
						<td>${t.name}</td>
						<td>${t.password}</td>
						<td>
							<form method="post" action="/deleteuser">
								<input type="hidden" name="name" value="${t.name}">
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
	</c:choose>

</body>

</html>