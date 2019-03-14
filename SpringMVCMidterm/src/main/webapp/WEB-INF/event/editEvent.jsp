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
 <c:if test = "${user != null}"> 
	<div class="container">
		<form action="allUserEvents.do" method="POST"
			class="form-card addEditEvent">
			<fieldset class="form-fieldset">
				<legend class="form-legend">Edit  </legend>
				<div class="form-row">
					<label class="form-radio-label"> 
					<input
						name="chooseDropdown" data-toggle="collapse"
						data-target="#collapseExample1" aria-expanded="false"
						aria-controls="collapseExample" class=" radiocreate1 form-radio-field"
						type="radio"  value="true" /> 
						<i class="form-radio-button"></i>
						<span>Choose Existing event</span>
					</label>
					<div class="form-group text-center col-md-2 col-sm-12">
						<h3>or</h3>
					</div>
					<label class="form-radio-label"> <input
						name="chooseDropdown" data-toggle="collapse"
						data-target="#collapseExample" aria-expanded="false"
						aria-controls="collapseExample" class="form-radio-field radiocreate"
						type="radio"  value="false" /> <i class="form-radio-button"></i>
						<span>Create new one</span>
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
					</div>

					<div class="col-md-6">
						<div class="collapse" id="collapseExample">
							<div class="card card-body">
								<div class="form-group">
									<label class="form-label" for="name"> Type</label>
									 <input
										type="text" class="form-control" name="eventNameNew"
										placeholder="Type of event" tabindex="1"> 
									<label
										class="form-label" for="imgEventSubject"> Image url</label> 
									<input
										type="text" class="form-control" name="imgEventSubject"
										placeholder="Type of event" tabindex="1" />
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="form-group">
					<label class="form-label" for="name"> Name</label> <input
						type="text" class="form-control" id="name" name="name"
						placeholder="Event name" tabindex="1" required>
				</div>
				<div class="form-group">
					<h3>Location</h3>
					<label class="form-label" for="location"> Address</label> <input
						name="location" class="form-control"
						placeholder="Location of your event" type="text" required />
				</div>

				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="inputCity">City</label> <input name="city"
							class="form-control" placeholder="City" type="text" required />
					</div>
					<div class="form-group col-md-4">
						<label for="inputState">State</label> <select id="inputState"
							name="state" class="form-control">
							<option selected>Choose...</option>
							<option>Colorado</option>
							<option>New Jersey</option>
						</select>
					</div>
					<div class="form-group col-md-2">
						<label for="inputZip">Zip</label> <input name="zipcode"
							type="text" class="form-control">
					</div>
				</div>
				<input name="${user.id}" hidden class="form-control"
					value="${user.id}" type="number" />

				<div class="form-row">
					<div class=" form-group col-md-5">
						<label class="form-label" for="maxSize"> Maximum people
							can attend your event</label> 
							<input name="maxSize" min="1"
							class="form-control" placeholder="number of people" type="number"
							required />
					</div>
				</div>
				<div class="form-group">
					<label class="form-label" for="description">Describe your
						event:</label>
					<textarea rows="2" cols="150" name="description"
						class="form-control" id="description" placeholder="Message..."
						tabindex="0"></textarea>
				</div>

				<div class="form-row">
					<div class="col-md-6 col-sm-12">
						<label class="form-label" for="startTime">Start Day and
							time</label> <input class="form-control dateForm" type="datetime-local"
							name="startTime2" value="2018-06-07T00:00" >
					</div>
					<div class="form-group col-md-6 col-sm-12">
						<label class="form-label" for="finishTime">End Day and
							time</label> <input class="form-control dateForm" type="datetime-local"
							name="finishTime2" min="2018-06-07T00:00" value="2020-06-14T00:00">
					</div>
				</div>

				<div class="form-group ">
					<label class="form-label" for="imageUrl">Image url:</label> <input
						type="text" class="form-control" name="imageUrl"
						placeholder="image Url" />
				</div>
				<div class="form-radio form-radio-inline">
					<div class="form-radio-legend">Car Pool?</div>
					<label class="form-radio-label"> <input name="rideShare"
						class="form-radio-field" type="checkbox"  value="true" />
						<i class="form-radio-button"></i> <span>YES</span>
					</label> <label class="form-radio-label"> <input name="rideShare"
						class="form-radio-field" type="checkbox"  value="false" />
						<i class="form-radio-button"></i> <span>No</span><br />
					</label>
				</div>
			</fieldset>
			<div class="text-center">
				<button type="submit" class="submit btn btn-primary">Create
					event</button>

			</div>
		</form>

	</div>
</c:if>
	<c:if test = "${user == null}"> You must be logged in to create event</c:if>
</body>
</html>