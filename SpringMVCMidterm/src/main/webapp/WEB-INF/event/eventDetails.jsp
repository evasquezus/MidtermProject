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
<jsp:include page="../navigation/navigation.jsp" />

<div class="container">
		<div class="row">
			<c:if test="${not empty selectedEvent}">
					<div class="col-lg-4 col-sm-6 col-xs-12 pb-3">
						<div class="card card-custom bg-white border-white border-0">
							<div class="card-custom-img"
								style="background-image: url(${selectedEvent.imageUrl });"></div>

							<div class="card-custom-avatar">

							<c:choose>
								<c:when test="${empty selectedEvent.user.imageUrl}">"
       								<img class="img-fluid" src="resources/user_images/default.png"
										alt="Avatar" />
								</c:when>
								<c:otherwise>
									<img class="img-fluid" src="${selectedEvent.user.imageUrl}"
										alt="Avatar" />
								</c:otherwise>
							</c:choose>

						</div>
							<div class="card-body" style="overflow-y: auto">
								<h4 class="card-title">${selectedEvent.name }</h4>
								<p class="card-text">
								Description:  ${selectedEvent.description }					
								</p>
								<p>${selectedEvent.eventSubject.eventName }</p>
								<p>Start time${selectedEvent.startTime }</p>
								<p>Finish Time${selectedEvent.finishTime }</p>
								
								<p>Maximum people in a group${selectedEvent.maxSize }</p>
								
								<p>Location ${selectedEvent.address.address }</p>
							</div>
							<div class="card-footer"
								style="background: inherit; border-color: inherit;">
								<button href="#" class="btn btn-primary">Edit</bitton>
							</div>
						</div>
					</div>
				
			</c:if>
			</div>
				</div>

</body>
</html>