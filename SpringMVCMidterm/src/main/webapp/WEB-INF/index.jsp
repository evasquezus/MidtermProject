<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="bootstrap/bootstrapHead.jsp" />
<meta charset="UTF-8">
<title>Events app</title>
</head>
<body>
	<jsp:include page="navigation/navigation.jsp" />

	<div class="container-fluid">

		<div id="carouselExampleSlidesOnly" class="carousel slide"
			data-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img
						src="https://image.freepik.com/free-vector/circle-made-music-instruments_23-2147509304.jpg?2"
						class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img
						src="https://image.freepik.com/free-vector/circle-made-music-instruments_23-2147509304.jpg?2"
						class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img
						src="https://image.freepik.com/free-vector/circle-made-music-instruments_23-2147509304.jpg?2"
						class="d-block w-100" alt="...">
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>

	<h1>Upcoming Concerts</h1>

	<div class="card-group">
		<div class="card">
			<img
				src="https://www.apple.com/v/music/h/images/shared/og_image.png?201902110920"
				class="card-img-top" alt="...">
			<div class="card-body">
				<h5 class="card-title">Card title</h5>
				<p class="card-text">This is a wider card with supporting text
					below as a natural lead-in to additional content. This content is a
					little bit longer.</p>
				<p class="card-text">
					<small class="text-muted">Last updated 3 mins ago</small>
				</p>
			</div>
		</div>
		<div class="card">
			<img
				src="https://www.apple.com/v/music/h/images/shared/og_image.png?201902110920"
				class="card-img-top" alt="...">
			<div class="card-body">
				<h5 class="card-title">Card title</h5>
				<p class="card-text">This card has supporting text below as a
					natural lead-in to additional content.</p>
				<p class="card-text">
					<small class="text-muted">Last updated 3 mins ago</small>
				</p>
			</div>
		</div>
		<div class="card">
			<img
				src="https://www.apple.com/v/music/h/images/shared/og_image.png?201902110920"
				class="card-img-top" alt="...">
			<div class="card-body">
				<h5 class="card-title">Card title</h5>
				<p class="card-text">This is a wider card with supporting text
					below as a natural lead-in to additional content. This card has
					even longer content than the first to show that equal height
					action.</p>
				<p class="card-text">
					<small class="text-muted">Last updated 3 mins ago</small>
				</p>
			</div>
		</div>
	</div>

	<br>
	<br>

	<div class="container">
		<span class="text-muted">Place sticky footer content here.</span>
	</div>

	<jsp:include page="bootstrap/bootstrapFoot.jsp" />
</body>
</html>