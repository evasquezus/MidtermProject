<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile</title>
<jsp:include page="bootstrap/bootstrapHead.jsp" />
<link href="css/main.css" rel="stylesheet" type="text/css">
</head>
<body>

	<jsp:include page="navigation/navigation.jsp" />
	<br>


<!--our content goes here-->
<div class="container content">
    <div class="row profile">
      <div class="col-md-3">
        <div class="profile-sidebar position-fixed">
          <!-- SIDEBAR USERPIC -->
          <div class="profile-userpic">
            <img src="https://media.rockstargames.com/chinatownwars/global/downloads/avatars/zhou_256x256.jpg" class="img-responsive" alt="">
          </div>
          <!-- END SIDEBAR USERPIC -->
          <!-- SIDEBAR USER TITLE -->
          <div class="profile-usertitle">
            <div class="profile-usertitle-name">
              Tango Ricky
            </div>
            <div class="profile-usertitle-job">
              Developer
            </div>
          </div>
          <!-- END SIDEBAR USER TITLE -->
          <!-- SIDEBAR BUTTONS -->
          <div class="profile-userbuttons">
            <button type="button" class="btn btn-success btn-sm">Follow</button>
            <button type="button" class="btn btn-danger btn-sm">Message</button>
          </div>
          <!-- END MENU -->
        </div>
      </div>
      <div class="col-md-9">
        <div class="profile-content">
         	<div class="col-xs-12 col-sm-9">
		<h4 class="blue">
			<span class="middle"><h1>Welcome ${user.firstName}</h1></span>
		</h4>
		<form action="editUser.do" method="POST" name="userID">
			First Name: <input type="text" name="firstName" value=${user.firstName}> <br> 
			Last Name: <input type="text" value=${user.lastName} name="lastName"> <br>
			<h3>Contact Information:</h3>
			<br> 
			Home Address <input type="text" name="homeAddress">
			<br> 
			Phone Number <input type="text" value=${user.phone} name="phoneNumber">
			Email: <input type="text" value=${user.email} name="email">
			 <br> 
			<input type="hidden" name="id" value="${user.id}" /> <br> 
			<input type="submit" class="btn btn-danger btn-sm" value="Edit User" /> <br>
		</form>
	</div>
 
        </div>
      </div>
    </div>
  </div>

	<jsp:include page="bootstrap/bootstrapFoot.jsp" />
</body>
</html>