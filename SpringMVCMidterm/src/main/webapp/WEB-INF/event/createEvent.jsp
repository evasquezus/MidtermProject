<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	
	<div class="container">
		<form action="saveEvent.do" method="POST" class="form-card addEditEvent">
			<fieldset class="form-fieldset">
				<legend class="form-legend">Create New Event </legend>
				<div class="form-radio form-radio-inline">
					<div class="form-radio-legend">Car Pool?</div>
					<label class="form-radio-label"> <input name="rideShare"
						class="form-radio-field" type="radio" required value="true" /> 
						<i class="form-radio-button"></i> <span>YES</span>
					</label> 
					<label class="form-radio-label"> <input name="rideShare"
						class="form-radio-field" type="radio" required value="false" />
						 <i class="form-radio-button"></i> <span>No</span><br/>
					</label> 
					<small class="form-element-hint">Choose one</small>
				</div>

				<div class="form-group">
					<label class="form-label" for="name"> Name</label> <input
						type="text" class="form-control" id="name" name="name"
						placeholder="Event name" tabindex="1" required>
				</div>
<!-- 				<div class="form-group">
					<label class="form-label" for="name"> Generation</label> <input
						name="generation" class="form-control"
						placeholder="Please fill in generation num" type="number" required />
					
				</div>
				<div class=" form-group">
					<label class="form-label" for="priceEth"> Price(ETH)</label> <input
						name="priceEth" class="form-control"
						placeholder="Please fill in eth price" type="number" required />
			
				</div> -->
				<div class=" form-group">
					<label class="form-label" for="userId"> user id</label> <input
						name="priceEth" class="form-control"
						placeholder="user Id" type="number" required />
			
				</div>
				<div class="form-group">
					<label class="form-label" for="description">Describe your event:</label>
					<textarea rows="2" cols="150" name="description"
						class="form-control" id="description" placeholder="Message..."
						tabindex="0" ></textarea>
				</div>

				<div class="form-group ">
					<label class="form-label" for="dateOfBirth">Date created</label>
					<input type="date" class="form-control dateOfBirth" required
						name="dateOfBirth" placeholder="dateOfBirth" /> 
				</div>
				
				<div class="form-group ">
						 <label
						class="form-label" for="imgUrl">imgUrl:</label>
						 <input type="text"
						class="form-control" name="imgUrl" placeholder="imgUrl" /> 
				</div>
			</fieldset>
			<div class="text-center">
				<button type="submit" class="submit btn btn-primary">Create
					kitty</button>

			</div>
	</form>

	</div>
	<jsp:include page="../bootstrap/bootstrapFoot.jsp" />
</body>
</html>