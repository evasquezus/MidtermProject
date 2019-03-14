<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="bootstrap/bootstrapHead.jsp" />
<meta charset="UTF-8">
<title>Events App</title>
<link rel="stylesheet" type="text/css" href="css/carousel.css" />
<link rel="stylesheet" type="text/css" href="css/main.css" />
<link rel="stylesheet" type="text/css" href="css/eventCard.css" />

</head>
<body>
	<jsp:include page="navigation/navigation.jsp" />
	<section id="cover"></section>
	<div class="container mt-5">
		<section>
			<c:if
				test="${userevents.size() > 0 && not empty currentUser && currentUser.id != 1}">
				<h3>Your latest events</h3>
				<div class="container">
					<div class="row">
						<c:forEach var="newCreatedEvent" items="${userevents}">
							<c:if test="${ newCreatedEvent.active}">

								<div class="col-lg-4 col-sm-6 col-xs-12 pb-3">
									<div class="card card-custom bg-white border-white border-0">
										<div class="card-custom-img"
											style="background-image: url(${newCreatedEvent.imageUrl });"></div>

										<div class="card-custom-avatar">

											<c:choose>
												<c:when test="${empty newCreatedEvent.user.imageUrl}">"
       								<img class="img-fluid"
														src="../resources/user_images/default.png" alt="Avatar" />
												</c:when>
												<c:otherwise>
													<img class="img-fluid"
														src="${newCreatedEvent.user.imageUrl}" alt="Avatar" />
												</c:otherwise>
											</c:choose>

										</div>
										<div class="card-body" style="overflow-y: auto">
											<h4 class="card-title">${newCreatedEvent.name }</h4>
											<p class="card-text">Description:
												${newCreatedEvent.description }</p>
											<p>${newCreatedEvent.eventSubject.eventName }</p>
											<p>Start time${newCreatedEvent.startTime }</p>
											<p>Finish Time${newCreatedEvent.finishTime }</p>

											<p>Maximum people in a group${newCreatedEvent.maxSize }</p>

											<p>Location ${newCreatedEvent.address.address }</p>
											<div class="row  card-back-footer">
												<div class="col-6 ">
													<form action="eventDetails.do" method="GET">
														<input type="hidden" name="id" value="${newCreatedEvent.id}" /> <input
															class=" col btn btnResult btn-primary btn-main-color"
															type="submit" value="DETAILS" />
													</form>
												</div>
											</div>
										</div>
										<div class="card-footer">
											<div class="row  card-back-footer">
												<div class="col-6 ">
													<form action="editEvent.do" method="POST" name="id">
														<input type="hidden" name="id" value="${event.id}" /> <input
															type="submit"
															class="col btnResult btn btn-outline-primary"
															value="EDIT" />
													</form>
												</div>
												<div class="col-6">
													<form action="deleteEvent.do" method="POST" name="id">
														<input type="hidden" name="id" value="${event.id}" /> <input
															type="submit"
															class="col btnResult btn btn-outline-primary"
															value="DELETE" />
													</form>
												</div>
											</div>
										</div>
									</div>


								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>


			</c:if>
			<c:if test="${empty userevents && not empty currentUser }">
	 You don't have any events, Go ahead and create one!!</c:if>
		</section>

	</div>

	<div class="container mt-5">
		<c:if test="${empty indexEvents && not empty currentUser }">
			<h3>Currently there is No upcoming events.New ones coming soon!</h3>
		</c:if>
		<c:if test="${!empty indexEvents && not empty currentUser }">
			<h3>All Upcoming events</h3>
		</c:if>
		<div class="row">
			<c:forEach var="event" items="${indexEvents}">
				<c:if test="${ event.active}">
					<div class="col-lg-4 col-sm-6 col-xs-12 pb-3">
						<div class="card card-custom bg-white border-white border-0">
							<div class="card-custom-img"
								style="background-image: url(${event.imageUrl });"></div>

							<div class="card-custom-avatar">

								<c:choose>
									<c:when test="${empty event.user.imageUrl}">"
       								<img class="img-fluid"
											src="resources/user_images/default.png" alt="Avatar" />
									</c:when>
									<c:otherwise>
										<img class="img-fluid" src="resources/user_images/default.png"
											<%-- src="${event.user.imageUrl}" --%>
										alt="Avatar" />
									</c:otherwise>
								</c:choose>

							</div>
							<div class="card-body" style="overflow-y: auto">
								<h4 class="card-title">${event.name }</h4>
								<p class="card-text">Description: ${event.description }</p>
								<p>${event.eventSubject.eventName }</p>
								<p>Start time${event.startTime }</p>
								<p>Finish Time${event.finishTime }</p>

								<p>Maximum people in a group${event.maxSize }</p>

								<p>Location ${event.address.address }</p>
								<p>How many people already joined :
									${event.userevents.size()}</p>


								<div class="row  card-back-footer">
									<div class="col-6 ">

										<form action="eventDetails.do" method="GET">
											<input type="hidden" name="id" value="${event.id}" /> <input
												class=" col btn btnResult btn-primary btn-main-color"
												type="submit" value="DETAILS" />
										</form>
									</div>
									<c:if
										test="${not empty event && not empty currentUser 
									&& currentUser.id != 1 && event.user.id != currentUser.id}">
										<div class="col-6 ">
											<c:set var="contains" value="false" />
											<c:forEach var="item" items="${event.userevents}">
												<c:if test="${item.user.id eq currentUser.id}">
													<c:set var="contains" value="true" />
												</c:if>
											</c:forEach>
											<c:if test="${!contains}">
												<form action="joinEvent.do" method="POST" name="eventId">
													<input type="hidden" name="eventId" value="${event.id}" />
													<input type="submit"
														class="col btnResult btn btn-outline-primary" value="JOIN" />
												</form>
											</c:if>
											<c:if test="${contains}">Joined <i
													class="far fa-check-circle"></i>
											</c:if>
										</div>
									</c:if>
								</div>
							</div>
							<c:if
								test="${not empty event && not empty currentUser 
									&& (currentUser.id == 1 || event.user.id == currentUser.id)}">
								<div class="card-footer">
									<div class="row  card-back-footer">
										<div class="col-6 ">
											<form action="editEvent.do" method="GET" name="id">
												<input type="hidden" name="id" value="${event.id}" /> <input
													type="submit" class="col btnResult btn btn-outline-primary"
													value="EDIT" />
											</form>
										</div>
										<div class="col-6">
											<form action="deleteEvent.do" method="POST" name="id">
												<input type="hidden" name="id" value="${event.id}" /> <input
													type="hidden" name="indexpage" value="true" /> <input
													type="submit" class="col btnResult btn btn-outline-primary"
													value="DELETE" />
											</form>
										</div>
									</div>
								</div>
							</c:if>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</div>
	<jsp:include page="bootstrap/bootstrapFoot.jsp" />
</body>
</html>