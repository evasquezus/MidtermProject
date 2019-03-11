<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="bootstrap/bootstrapHead.jsp" />
<meta charset="UTF-8">
<title>Events App</title>
</head>
<body>
	<jsp:include page="navigation/navigation.jsp" />
	<div class="card-group">
		<div class="card">
			<div class="card-body">
				<div class="dropdown">
					<button class="btn btn-secondary" type="button" id="homeButton"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Home</button>
				</div>

				<h5 class="card-title">Login</h5>
				<div class="dropdown">
					<button class="btn btn-secondary dropdown-toggle" type="button"
						id="dropdownMenuButtonForLogin" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">Login</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						<form action="login.do" method="POST">
							Email: <input type="text" name="email"> <br>
							Password: <input type="text" name="lastName"> <br> <br>
							<input type="submit" value="Login" />
						</form>
					</div>

					<h5 class="card-title">Register</h5>
					<div class="dropdown">
						<button class="btn btn-secondary dropdown-toggle" type="button"
							id="dropdownMenuButtonForRegister" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false">Register</button>
						<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
							<form action="registerUser.do" method="POST">
								First Name: <input type="text" name="firstName"> <br>
								Last Name: <input type="text" name="lastName"> <br>
								Email: <input type="text" name="email"> <br>
								Password: <input type="text" name="password"> <br>
								Confirm Password: <input type="text" name="confirmPassword"><br>
								<input type="submit" name="userID" value="Register User" />
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="bootstrap/bootstrapFoot.jsp" />
</body>
</html>