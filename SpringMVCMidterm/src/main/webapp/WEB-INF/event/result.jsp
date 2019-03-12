<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../bootstrap/bootstrapHead.jsp" />
<link rel="stylesheet" type="text/css" href="css/eventCard.css" />
</head>
<body>
	<c:choose>
		<c:when test="${ not empty newCreatedEvent}">
			<div class="container">
				<div class="row">
					<div class="col-md-3 col-lg-3 pb-3">
						<div class="card card-custom bg-white border-white border-0">
							<div class="card-custom-img"
								style="background-image: url(${newCreatedEvent.imageUrl });"></div>

							<div class="card-custom-avatar">
								<img class="img-fluid" src="${newCreatedEvent.user.imageUrl}"
									alt="Avatar" />
									https://cdn5.vectorstock.com/i/1000x1000/72/74/female-avatar-profile-icon-round-woman-face-vector-18307274.jpg
							</div>
							<div class="card-body" style="overflow-y: auto">
								<h4 class="card-title">${newCreatedEvent.name }</h4>
								<p class="card-text">
								Description:  ${newCreatedEvent.description }					
								</p>
								<p>${newCreatedEvent.eventSubject.eventName }</p>
								<p>Start time${newCreatedEvent.startTime }</p>
								<p>Finish Time${newCreatedEvent.finishTime }</p>
								
								<p>Maximum people in a group${newCreatedEvent.maxSize }</p>
								
								<p>Location ${newCreatedEvent.address.address }</p>
							</div>
							<div class="card-footer"
								style="background: inherit; border-color: inherit;">
								<button href="#" class="btn btn-primary">Details</bitton>
							</div>
						</div>


					</div>
				</div>
			</div>
			<br />
		</c:when>
		<c:otherwise>
       Show siomething Else
        <br />
		</c:otherwise>
	</c:choose>

</body>
</html>