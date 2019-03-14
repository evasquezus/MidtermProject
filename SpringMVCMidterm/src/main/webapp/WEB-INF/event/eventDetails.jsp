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

<div class="container">
      <c:choose>
         
         <c:when test = "${errorEventisNull}">
            <h3>Sorry There is no event available</h3>
         </c:when> 
         <c:otherwise>
		<div class="row">
			<c:if test="${not empty selectedEvent}">
			<div class="container">
		

			<form action="saveKitty.do" method="POST" class="form-card addEditkitty">
				<fieldset class="form-fieldset">
					<legend class="form-legend">Update info about Crypto Kitty ${kitty.name}</legend>
					<div class="form-radio form-radio-inline">
					<input
						type="text" class="form-control" id="name" value="${kitty.id}" name="id"
						placeholder="Kitty name" tabindex="1" hidden>
						<div class="form-radio-legend">For Sale?</div>
						<c:choose>
							<c:when test="${kitty.onSale=='t'}">
      <label class="form-radio-label"> <input name="onSale"
						class="form-radio-field" checked type="radio" required value="t" /> <i
						class="form-radio-button"></i> <span>YES</span>
					</label>
        <br />
                <label class="form-radio-label"> <input name="onSale"
						class="form-radio-field" type="radio" required value="f" /> <i
						class="form-radio-button"></i> <span>No</span>
					</label>
							</c:when>
							<c:otherwise>
      <label class="form-radio-label"> <input  name="onSale"
						class="form-radio-field" type="radio" required value="t" /> <i
						class="form-radio-button"></i> <span>YES</span>
					</label>
        <br />
                <label class="form-radio-label"> <input checked name="onSale"
						class="form-radio-field" type="radio" required value="f" /> <i
						class="form-radio-button"></i> <span>No</span>
					</label>
       
							</c:otherwise>
						</c:choose>
					</div>
			<div class="form-group">
					<label class="form-label" for="name"> Name</label> <input
						type="text" class="form-control" id="name" value="${kitty.name}" name="name"
						placeholder="Kitty name" tabindex="1" required>
				</div>
				<div class="form-group">
					<label class="form-label" for="name"> Generation</label> <input
					value="${kitty.generation}"
						name="generation" class="form-control"
						placeholder="Please fill in generation num" type="number" required />
					
				</div>
				<div class=" form-group">
					<label class="form-label" for="priceEth"> Price(ETH)</label> <input
					value="${kitty.priceEth}"
						name="priceEth" class="form-control"
						placeholder="Please fill in eth price" type="number" required />
			
				</div>
				<div class="form-group">
					<label class="form-label" for="description">Bio</label>
					<textarea rows="2" cols="150" name="description"
					value="${kitty.description}"
						class="form-control" id="description" placeholder="Message..."
						tabindex="0" ></textarea>
				</div>

				<div class="form-group ">
					<label class="form-label" for="dateOfBirth">Date of birth:</label>
					<input 
								value="${kitty.dateOfBirth}"
					type="date" class="form-control dateOfBirth" required
						name="dateOfBirth" placeholder="dateOfBirth" /> 
						
						<label
						class="form-label" for="color">color:</label> 
						<input type="text" value="${kitty.color}"
						class="form-control" name="color" placeholder="color" />
						
						 <label
						class="form-label" for="imgUrl">imgUrl:</label>
						 <input type="text" value="${kitty.imgUrl}"
						class="form-control" name="imgUrl" placeholder="imgUrl" /> 
						
						<label
						class="form-label" for="price">price:</label> 
						<input type="number" value="${kitty.price}"
						class="form-control" name="price" placeholder="price" />
					<h3>Parents</h3>

					<div class="form-group">
						<label class="form-label" for="motherId"> Mother id</label> <input
							value="${kitty.motherId}"
							type="number" class="form-control" name="motherId"
							placeholder="Kitty motherId" tabindex="1" required>
					</div>

					<div class="form-group">
						<label class="form-label" for="name"> Father id</label> <input
							value="${kitty.fatherId}"
							type="text" class="form-control" name="fatherId"
							placeholder="Kitty father id " tabindex="1" required>
					</div>


					<h3>Cattributes</h3>
					<label class="form-label" for="eyeColour">Eyes Color:</label> <input
						value="${kitty.eyeColour}"
						type="text" class="form-control" name="eyeColour"
						placeholder="eyeColour" /> <label class="form-label"
						for="pattern">Pattern:</label> 
						<input type="text"
						value="${kitty.pattern}"
						class="form-control" name="pattern" placeholder="pattern" />
						 <label
						class="form-label" for="mouth">Mouth:</label> 
						<input type="text"
						value="${kitty.mouth}"
						class="form-control" name="mouth" placeholder="mouth" />
						 <label
						class="form-label" for="fur">Fur:</label> 
						<input type="text"
						value="${kitty.fur}"
						class="form-control" name="fur" placeholder="fur" />

				</div>
			</fieldset>
				<div class="form-actions">
					<input type="submit" value="Update
						kitty" name="id" class="submit btn btn-primary">
				</div>
			</form>


	
	</div>
					<%-- <div class="col-lg-4 col-sm-6 col-xs-12 pb-3">
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
					</div> --%>
				
			</c:if>
			</div>
				
		
         </c:otherwise>
      </c:choose>		
	</div>

</body>
</html>