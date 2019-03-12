<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="bootstrap/bootstrapHead.jsp" />
<meta charset="UTF-8">
<title>Events App</title>
</head>
<body>
	<jsp:include page="navigation/navigation.jsp" />
	<p style="background-color: rgb(64, 146, 214);">

	<br> <br> <br> <br> <br>
	
	<div class="container-fluid">
		<div class="card-deck" style="background-color: rgb(252, 210, 42);">
			<c:forEach var="event" items="${indexEvents}">
				<div class="card">
					<img class="card-img-top" src="/resources/event_images/default.jpg" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">${event.name}</h5>
						<p class="card-text">${event.description}</p>
						<p class="card-text">
							<small class="text-muted" >Hosted by: ${event.user.firstName}</small>
						</p>
					</div>
				</div>
			</c:forEach>

		</div>
	</div>
	
	<p style="background-color: rgb(64, 146, 214);">

	<jsp:include page="bootstrap/bootstrapFoot.jsp" />
</body>
</html>