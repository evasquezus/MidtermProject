<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	
	<div class="collapse navbar-collapse" id="navbarSupportedContent">

		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="\">Home<span class="sr-only">(current)</span></a></li>
			<c:if test = "${user != null}">
				<li class="nav-item"><a class="nav-link" href="createEvent.do">Create Event</a></li>
      		</c:if>
		</ul>
		<c:if test = "${user == null}">
	        <form class="form-inline my-2 my-lg-0" action="login.do" method="POST">
				<input type="text" class="form-control" placeholder="email@email.com" aria-label="Email" aria-describedby="login" name="email"> 
				<input type="password" class="form-control" placeholder="password" aria-label="Password" aria-describedby="login" name="password">
				<button class="btn btn-primary my-2 my-sm-0" type="submit">Login</button>
			</form>
			<a class="nav-link disabled" href="#"> or </a>
			<div class="dropdown">
						<button class="btn btn-primary" type="button"
							id="dropdownMenuButtonForRegister" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false">Register</button>
						<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
							<form action="registerUser.do" method="POST">
								First Name: <input type="text" name="firstName"> <br>
								Last Name: <input type="text" name="lastName"> <br>
								Email: <input type="email" name="email"> <br>
								Password: <input type="password" name="password"> <br>
								Confirm Password: <input type="password" name="confirmPassword">
								Zip Code (optional): <input type="text" name="zipcode"> <br>
								<br> 
								<input type="submit" name="userID"
									value="Register User" />
							</form>
						</div>
					</div>
      	</c:if>
      	<c:if test = "${user != null}">
	    	<a class="nav-link" href="userProfile.do">Hello, ${user.firstName}</a>
	        <a class="nav-link" href="logout.do">logout</a>
      	</c:if>
	</div>
</nav>
