<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="css/eventCard.css" />
<jsp:include page="../bootstrap/bootstrapHead.jsp" />
</head>
<body>
<jsp:include page="../navigation/navigation.jsp" />
	<div class="container">
		<c:if test="${not empty currentUser}">
			<h3>All events created by ${currentUser.firstName}</h3>
			<div class="row">
				<c:forEach var="newCreatedEvent" items="${userevents}">

					<div class="col-lg-4 col-sm-6 col-xs-12 pb-3">
						<div class="card card-custom bg-white border-white border-0">
							<div class="card-custom-img"
								style="background-image: url(${newCreatedEvent.imageUrl });"></div>

							<div class="card-custom-avatar">

								<c:choose>
									<c:when test="${empty newCreatedEvent.user.imageUrl}">"
       								<img class="img-fluid"
											src="resources/user_images/default.png" alt="Avatar" />
									</c:when>
									<c:otherwise>
										<img class="img-fluid" src="${newCreatedEvent.user.imageUrl}"
											alt="Avatar" />
									</c:otherwise>
								</c:choose>

							</div>
							<div class="card-body" style="overflow-y: auto">
								<h4 class="card-title">${newCreatedEvent.name }</h4>
								<p class="card-text">
								Description:
									${newCreatedEvent.description }</p>
								<p>${newCreatedEvent.eventSubject.eventName }</p>
								<p>Start time${newCreatedEvent.startTime }</p>
								<p>Finish Time${newCreatedEvent.finishTime }</p>

								<p>Maximum people in a group${newCreatedEvent.maxSize }</p>

								<p>Location ${newCreatedEvent.address.address }</p>
								<div class="row  card-back-footer">
											<div class="col-6 ">
												<form action="eventDetails.do" method="GET">
													<input type="hidden" name="id" value="${event.id}" /> <input
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
														class="col btnResult btn btn-outline-primary" value="EDIT" />
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

				</c:forEach>
			</div>
		</c:if>
	</div>

	<%-- 	<c:choose>
		<c:when test="${ not empty newCreatedEvent}">
			<div class="container">
				<div class="row">
					<div class="col-md-3 col-lg-3 pb-3">
						<div class="card card-custom bg-white border-white border-0">
							<div class="card-custom-img"
								style="background-image: url(${newCreatedEvent.imageUrl });"></div>

							<div class="card-custom-avatar">
							
							<c:choose>
    <c:when test="${empty newCreatedEvent.user.imageUrl}">
       <img class="img-fluid" src="${newCreatedEvent.user.imageUrl}"
									alt="Avatar" />
    </c:when>
    <c:otherwise>
       <img class="img-fluid" src="${newCreatedEvent.user.imageUrl}"
									alt="Avatar" />
    </c:otherwise>
</c:choose>
								
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
       There is no events created by user
        <br />
		</c:otherwise>
	</c:choose>
 --%>
</body>
</html>