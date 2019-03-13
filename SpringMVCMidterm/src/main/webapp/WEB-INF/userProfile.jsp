<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile</title>
<jsp:include page="bootstrap/bootstrapHead.jsp" />
<link href="css/main.css" rel="stylesheet" type="text/css">
</head>
<body>


	<br>
	<c:if test="${user.active == false}">
		<!-- Button trigger modal -->
		<div style="text-align: center;">

			<button type="button" class="btn btn-primary" data-toggle="modal"
				data-target="#exampleModal">User No Longer Active Please
				Click</button>

			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Please Click
								User no longer active</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">If you would like to recover your
							account please contact an Admin</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${user.active == true}">
		<jsp:include page="navigation/navigation.jsp" />
		<!--our content goes here-->
		<div class="container content">
			<div class="row profile">
				<div class="col-md-3">
					<div class="profile-sidebar position-fixed">
						<div class="profile-userpic">
						
							<c:choose>
								<c:when test="${empty user.imageUrl}">
									<img
										src="resources/user_images/default.png"
										class="img-responsive" alt="">
								</c:when>
								<c:otherwise>
									<img src="${user.imageUrl}" class="img-responsive" alt="">
								</c:otherwise>
							</c:choose>

						</div>
						<div class="profile-usertitle">
							<div class="profile-usertitle-name">${user.firstName} ${user.lastName}</div>
						</div>
						<div class="profile-userbuttons">
							<button type="button" class="btn btn-success btn-sm">Follow</button>
							<button type="button" class="btn btn-danger btn-sm">Message</button>
						</div>
					</div>
				</div>
				<div class="col-md-9">
					<div class="profile-content">
						<div class="col-xs-12 col-sm-9">
							<h4 class="blue">
								<span class="middle"><h1>Welcome ${user.firstName}</h1></span>
							</h4>
							<c:if test="${user.id == 1}">
								<p>
									<span class="middle"><h1>Admin</h1></span> <br> Delete
									User: <br>
								<div class="card">
									<div class="card-body">
										<div class="dropdown">
											<button class="btn btn-danger dropdown-toggle" type="button"
												id="dropdownMenuButton" data-toggle="dropdown"
												aria-haspopup="true" aria-expanded="false">Delete
												User</button>
											<div class="dropdown-menu"
												aria-labelledby="dropdownMenuButton">
												<form action="deleteUser.do" method="POST" name="userID">
													<input type="text" name="id" value="${user.id}" /> <br>
													<input type="submit" class="btn btn-danger btn-sm"
														value="Edit User" name="id" />
												</form>
											</div>
										</div>
									</div>
								</div>
								<br>
								
								
								Delete event:
								<br>
								<div class="card">
									<div class="card-body">
										<div class="dropdown">
											<button class="btn btn-danger dropdown-toggle" type="button"
												id="dropdownMenuButton" data-toggle="dropdown"
												aria-haspopup="true" aria-expanded="false">Delete
												event</button>
											<div class="dropdown-menu"
												aria-labelledby="dropdownMenuButton">
												<form action="deleteEvent.do" method="POST" name="eventID">
													<input type="text" name="id" value="${event.id}" /> <br>
													<input type="submit" class="btn btn-danger btn-sm"
														value="Delete Event" />
												</form>
											</div>
										</div>
									</div>
								</div>
								<br>

								<br>
							
							</c:if>
							<br> <br>
								<form action="editUser.do" method="POST" name="userID">
								First Name: <input type="text" name="firstName"
									value=${user.firstName}> <br> Last Name: <input
									type="text" value=${user.lastName } name="lastName"> <br>
								<h3>Contact Information:</h3>
								<br> Home Address <input type="text" name="homeAddress">
								<br> Phone Number <input type="text"
									value=${user.phone
									} name="phone">
								Email: <input type="text" value=${user.email } name="email">
								<br> <input type="hidden" name="active" value="1" />
								<br> <input type="hidden" name="id" value="${user.id}" />
								<br> <input type="submit" class="btn btn-danger btn-sm"
									value="Edit User" /> <br>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	<jsp:include page="bootstrap/bootstrapFoot.jsp" />
</body>
</html>