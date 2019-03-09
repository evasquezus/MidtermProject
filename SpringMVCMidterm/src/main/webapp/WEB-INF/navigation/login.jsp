<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	<div id="id01" class="modal">

		<form class="modal-content animate" action="/action_page.php">
			<div class="container">
				<label for="email"><b>Email</b></label> <input type="text"
					placeholder="Enter Username" name="email" required> <br>
				<label for="password"><b>Password</b></label> <input type="password"
					placeholder="Enter Password" name="password" required> <br>

				<button type="submit">Login</button>
			</div>
		</form>
</body>
</html>