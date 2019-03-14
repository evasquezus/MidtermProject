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

</head>
<body>
	<jsp:include page="../navigation/navigation.jsp" />
	<c:if test="${user != null}">
		<div class="container">
			<form action="saveEvent.do" method="POST"
				class="form-card addEditEvent">
				<fieldset class="form-fieldset">
					<legend class="form-legend">Edit </legend>
					<div class="form-row">
						<%-- 						<label class="form-radio-label"> <input
							name="chooseDropdown" data-toggle="collapse"
							data-target="#collapseExample1" aria-expanded="false"
							aria-controls="collapseExample"
							class=" radiocreate1 form-radio-field" type="radio" value="true" />
							<i class="form-radio-button"></i> <span>Choose Existing
								event</span>
						</label>
						<div class="form-group text-center col-md-2 col-sm-12">
							<h3>or</h3>
						</div>
						<label class="form-radio-label"> <input
							name="chooseDropdown" data-toggle="collapse"
							data-target="#collapseExample" aria-expanded="false"
							aria-controls="collapseExample"
							class="form-radio-field radiocreate" type="radio" value="false" />
							<i class="form-radio-button"></i> <span>Create new one</span>
						</label>

					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="collapse" id="collapseExample1">
								<div class="card card-body">
									<div class=" form-group col-md-12 col-sm-12">
										<select name="eventNameDropDown" class="form-control">
											<option value="" selected>Choose event type</option>
											<c:if test="${not empty eventsubjects  }">
												<c:forEach var="k" items="${eventsubjects}">
													<option name="${k.eventName}" value="${k.eventName}">${k.eventName}</option>
												</c:forEach>
											</c:if>
										</select>
									</div>
								</div>
							</div>
						</div> --%>

<!-- 						<div class="col-md-6">
							<div class="collapse" id="collapseExample">
								<div class="card card-body">
									<div class="form-group">
										<label class="form-label" for="name"> Type</label>
										 <input
											type="text" class="form-control" name="eventNameNew"
											placeholder="Type of event" tabindex="1"> <label
											class="form-label" for="imgEventSubject"> Image url</label> <input
											type="text" class="form-control" name="imgEventSubject"
											placeholder="Type of event" tabindex="1" />
									</div>
								</div>
							</div>
						</div> -->
					</div>

					<div class="form-group">
						<label class="form-label" for="name"> Name</label> <input
							type="text" class="form-control" id="name"
							value="${selectedEvent.name }" name="name"
							placeholder="Event name" tabindex="1" >
					</div>
										<div class="form-group">
						<label class="form-label" for="name"> Description</label> <input
							type="text" class="form-control" 
							value="${selectedEvent.description }" name="description"
							placeholder="Event name" tabindex="1" >
					</div>
					<div class="form-group">
						<label class="form-label" for="name"> imageUrl</label> <input
							type="text" class="form-control" id="name"
							value="${selectedEvent.imageUrl }" name="imageUrl"
							placeholder="Event name" tabindex="1" >
					</div>
					 <div class="form-group">
						<h3>Location</h3>
						<label class="form-label" for="location"> Address</label> <input
							value="${selectedEvent.address.address }" name="address"
							class="form-control" placeholder="Location of your event"
							type="text" required />
					</div>

					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="inputCity">City</label> <input name="city"
								value="${selectedEvent.address.city }" class="form-control"
								placeholder="City" type="text" required />
						</div>
						<div class="form-group col-md-4">
							<label for="inputState">State</label> <select id="inputState"
								name="state" class="form-control">
								<option selected>${selectedEvent.address.state }</option>
								<option>Alabama</option>
								<option>Alaska</option>
								<option>Arizona</option>
								<option>Arkansas</option>
								<option>California</option>
								<option>Colorado</option>
								<option>Connecticut</option>
								<option>Delaware</option>
								<option>District of Columbia</option>
								<option>Florida</option>
								<option>Georgia</option>
								<option>Hawaii</option>
								<option>Idaho</option>
								<option>Illinois</option>
								<option>Indiana</option>
								<option>Iowa</option>
								<option>Kansas</option>
								<option>Kentucky</option>
								<option>Louisiana</option>
								<option>Maine</option>
								<option>Montana</option>
								<option>Nebraska</option>
								<option>Nevada</option>
								<option>New Hampshire</option>
								<option>New Jersey</option>
								<option>New Mexico</option>
								<option>New York</option>
								<option>North Carolina</option>
								<option>North Dakota</option>
								<option>Ohio</option>
								<option>Oklahoma</option>
								<option>Oregon</option>
								<option>Maryland</option>
								<option>Massachusetts</option>
								<option>Michigan</option>
								<option>Minnesota</option>
								<option>Mississippi</option>
								<option>Missouri</option>
								<option>Pennsylvania</option>
								<option>Rhode Island</option>
								<option>South Carolina</option>
								<option>South Dakota</option>
								<option>Tennessee</option>
								<option>Texas</option>
								<option>Utah</option>
								<option>Vermont</option>
								<option>Virginia</option>
								<option>Washington</option>
								<option>West Virginia</option>
								<option>Wisconsin</option>
								<option>Wyoming</option>
							</select>
						</div>
						<div class="form-group col-md-2">
							<label for="inputZip">Zip</label>
							 <input  value="${selectedEvent.address.zipcode}"
							  name="zipcode"
								type="text" class="form-control">
						</div>
					</div> 
					<input name="id" hidden class="form-control"
						value="${selectedEvent.id}" type="number" />

					<div class="form-row">
						<div class="col-md-6 col-sm-12">
							<label class="form-label" for="startTime">Start Day and
								time</label>
								 <input class="form-control dateForm" type="datetime-local"
								name="startTime" value="${selectedEvent.startTime}">
						</div>
						<div class="form-group col-md-6 col-sm-12">
							<label class="form-label" for="finishTime">End Day and
								time</label> 
								<input class="form-control dateForm" type="datetime-local"
								name="finishTime"
								value="${selectedEvent.finishTime}">
						</div>
					</div>
				</fieldset>
				<div class="form-actions">
					<input type="submit" value="Update" name="id" class="submit btn btn-primary">

				</div>
			</form>

		</div>
	</c:if>
	<c:if test="${user == null}"> You must be logged in to create event</c:if>
</body>
</html>