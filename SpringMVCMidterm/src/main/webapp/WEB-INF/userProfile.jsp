<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile</title>
</head>
<body>

	<jsp:include page="navigation/navigation.jsp" />

	<div class="">
		<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
			<form action="editUser.do" method="POST">
				First Name: <input type="text" name="firstName"> <br>
				Last Name: <input type="text" name="lastName"> <br>
				Email: <input type="text" name="email"> <br> 
				<h3>Contact Information:</h3><br>
				Home Address <input type="text" name="homeAddress"> <br> 
				Apt <input type="text" name="apt"><br>
				Phone Number <input type="text" name="phoneNumber"> <br> 
				City <input type="text" name="city"><br>
				Country <input type="text" name="country"> <br> 
				State <input type="text" name="state"><br>
				Zip Code <input type="text" name="zipCode"><br>
				<input type="hidden" name="userID" value="${user.id}" /> <br>
				<input type="submit" value="Edit Leader" /> <br>
			</form>
		</div>
	</div>


	<jsp:include page="bootstrap/bootstrapFoot.jsp" />
</body>
</html>