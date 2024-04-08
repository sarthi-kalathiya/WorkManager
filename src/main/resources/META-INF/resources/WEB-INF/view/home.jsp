<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<style>
body {
	background: linear-gradient(to bottom right, #5965c2b0, #e6b0cc);
	font-family: Arial, sans-serif;
	color: #333;
	margin: 0;
	padding: 0;
	background-image:
		url('data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBwgHBgkIBwgKCgkLDRYPDQwMDRsUFRAWIB0iIiAdHx8kKDQsJCYxJx8fLT0tMTU3Ojo6Iys/RD84QzQ5OjcBCgoKDQwNGg8PGjclHyU3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3N//AABEIAH8AvgMBIgACEQEDEQH/xAAZAAADAQEBAAAAAAAAAAAAAAAAAQIEAwf/xAAhEAEBAAICAwEBAQEBAAAAAAAAAQIRAyESMUETYVFxIv/EABgBAQEBAQEAAAAAAAAAAAAAAAABAgME/8QAGBEBAQEBAQAAAAAAAAAAAAAAAAERAhL/2gAMAwEAAhEDEQA/APQccOnTHAYR2mL1WvBI5zj+q8HbDHa/zZtaxn/NWPG7+Ha/FNaxnuCLjdtdxT4yfDSxnmFP8599tHjD8OzTyzXjOcbTMTkTVxly40/n9arifh0up5ZPAfnpq8JsXAlPLHONf5tMwPxNXyy3Arh01+Ec88ejTGbwpXFo0jLHa6zjJljquWUauTFws7ajnY7cTTjJYz8XTRizW+XTCSOmv8c46S7iOkOQa0WzjOqNdFo5dno1Sk0fQENBegKQg+mWt+z9AWgfZAW+zlSN6UNN0tNBOk5OqbFZxl5MfbNlJvu2f8m2zlZc7q9NRiq42nH1/Wfi004JV5X8Vj6I5NI2rE9lPZ2MqIZHOgK7JV7AEUpkCoaYYpoXE0C0NKxGhMTCqi0qCUqNC+gcOadsnJLvps5GXL23HPocXTVhembijVhEq8r9qkEhstwQ9lBoU1fC+FEDgogopASGIIDkPUFIuv8ADpS9gcOwdjdBFHw8v9IiEV9KLJRw5OvbHnf/AE18zHn7bjl068TVj6ZOK6asL0lXl1ns0nP6y2IopoxTGkmgZ62UAo0N9g5oAD3C0BUaABXzoqWxewKkYnSoScrJ7XYiwSs/Lkycntr5mTknpuOXTpxtWDNxxow6StR2xp2o9n8RpUo2Xo5doo2cTvVVCqYHwIHDiVSinpNPe00AC2YgAAEZQ4A9Fl6PLtzzWJXDmntkz9teevTNnJvpqOXTtxenbFw467Y0rUdJDTKrcRqHoevXotqxqKJJVyaTP4qZbKp30VFpWooETs5d0QypkoR7ICH9NPkNgextGz2GnUZU7U53oHLksZs7q9O3JfjPnZK3HLo8MtO+OX9Y/LTpjmtjMrbMj8maZneRnHTWiZKmW2T9D/TRhrZMv6rc+Mk5FTkTGtaLkLk4foV5A12t0Jk4+ZfoYmtPkVycZmLmYa7eRbcLnovOmGtG4m5f1wuZXNcNd7kV5HDzqfK0xNapntPJlJ6cLy+HztFzt7PKel5ZRwyvYyy2lqRi1//Z');
	background-size: cover;
}

h1 {
	font-size: 32px;
	margin-top: 40px;
	margin-bottom: 20px;
	color: white;
	text-align: center;
}

form {
	text-align: center;
	margin-bottom: 20px;
}

button {
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

button:hover {
	background-color: #0062cc;
}

.container {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.box {
}

.logoutform {
        position: absolute;
        margin-top: 30px;
		margin-left: 1400px;
    }
</style>


</head>
<body>
   <form method="post" action="/logout"  class="logoutform">
				<input type="hidden" name="name" value="${name}">
				<button type="submit">logout</button>
   </form>

	<div class="container">
	
		<div class="box">
			<h1 style="color: #111111;">Welcome ${name}</h1>
			<form method="post" action="/addtodo">
				<input type="hidden" name="name" value="${name}">
				<button type="submit">Add Todo</button>
			</form>
			<form method="post" action="/viewtodo">
				<input type="hidden" name="name" value="${name}">
				<button type="submit">View Todo</button>
			</form>
						
		</div>
	</div>
</body>
</html>
