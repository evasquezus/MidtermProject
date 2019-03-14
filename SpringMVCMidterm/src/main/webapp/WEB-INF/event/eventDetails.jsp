<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../bootstrap/bootstrapHead.jsp" />
<link rel="stylesheet" type="text/css" href="css/formCard.css" />
<link rel="stylesheet" type="text/css" href="css/eventCard.css" />
<link rel="stylesheet" type="text/css" href="css/main.css" />
</head>
<body>
	<jsp:include page="../navigation/navigation.jsp" />

	<div class="container">
		<c:choose>
			<c:when test="${errorEventisNull}">
				<h3>Sorry There is no event available</h3>
			</c:when>
			<c:otherwise>
				<div class="row">
					<c:if test="${not empty selectedEvent}">
						<div class="container">
							<a class="backArrow mb-5" href="home.do"> <i
								class="fas fa-arrow-left"></i> Go Back
							</a>
							<div class="col-md-10  offset-md-1">
								<div class="card card-custom bg-white border-white border-0">
									<div class="card-custom-img"
										style="background-image: url(${selectedEvent.imageUrl });"></div>


									<div class="card-body" style="overflow-y: auto">

										<h4 class="card-title">${selectedEvent.name }</h4>

										<div class="card-custom-avatar">

											<c:choose>
												<c:when test="${empty selectedEvent.user.imageUrl}">"
       								<img class="img-fluid"
														src="resources/user_images/default.png" alt="Avatar" />
												</c:when>
												<c:otherwise>
													<img class="img-fluid" src="${selectedEvent.user.imageUrl}"
														alt="Avatar" />
												</c:otherwise>
											</c:choose>

										</div>
										<p class="card-text">Description:
											${selectedEvent.description }</p>
										<p>Event type: ${selectedEvent.eventSubject.eventName }</p>
										<p>Start time ${selectedEvent.startTime }</p>
										<p>Finish Time ${selectedEvent.finishTime }</p>

										<p>Max people in a group ${selectedEvent.maxSize }</p>

										<p>Location ${selectedEvent.address.address }</p>

										<p>Hosted by : ${selectedEvent.user.firstName}
											${selectedEvent.user.lastName}</p>

									</div>


									<c:choose>
									<c:when test="${empty currentUser}">

										</c:when> 
										<c:when
											test="${currentUser.id == 1 || currentUser.id == selectedEvent.user.id}">
											<div class="col-6">
											<form action="editEvent.do" method="GET">
													<input type="hidden" name="id" value="${selectedEvent.id}" />
													<input
														class=" col btn btnResult btn-primary btn-main-color"
														type="submit" value="EDIT" />
												</form>
												</div>
										</c:when>
										<c:otherwise>

										</c:otherwise>
									</c:choose>

								</div>
							</div>
						</div>
					</c:if>
				</div>
			</c:otherwise>
		</c:choose>
	</div>

</body>
</html>