<html>
<head>
<jsp:include page="bootstrap/bootstrapHead.jsp" />
</head>

<body>
	<jsp:include page="navigation/navigation.jsp" />
	<div>
	${user.id}<br>
	${user.firstName}<br>
	${user.lastName}<br>
<%-- 	${user.address}<br>
	${user.roleId}<br>
	${user.password}<br>
	${user.email}<br>
	${user.phone}<br>
	${user.imageUrl}<br>
	${user.active}<br>
	${user.dateCreated}<br> --%>
	</div>


	<jsp:include page="bootstrap/bootstrapFoot.jsp" />
</body>
</html>