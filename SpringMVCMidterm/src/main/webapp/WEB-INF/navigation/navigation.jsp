<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand-lg navbar-light navbar-custom">
	<a class="navbar-brand" href="home.do"> <img alt="" width="40px"
		src="https://cdn3.vectorstock.com/i/1000x1000/72/82/cats-in-love-logo-icon-vector-21297282.jpg" />
	</a>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="#">Navbar</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#">Home
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
				<form action="getLogin.do" method="GET">
					<input class="btn btn-primary" type="submit" value="Login">
				</form>
				<form action="getSignUp.do" method="GET">
					<input class="btn btn-primary" type="submit" value="SignUp">
				</form>
			</ul>

		</div>
	</nav>
	</div>
</nav>