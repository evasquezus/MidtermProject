<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Display Events</title>
</head>
<body>

	<div class="jumbotron jumbotron-fluid">
		<div class="container">
			<h1 class="display-4">Displaying Results</h1>
		</div>
	</div>

	<table class="table table-hover table-dark">
		<thead>
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Name</th>
				<th scope="col">Description</th>
				<th scope="col">Start Time</th>
				<th scope="col">Finish Time</th>
				<th scope="col">Image
				<th>
				<th scope="col">Status</th>
				<th scope="col">Max Size</th>
				<th scope="col">Ride Share</th>
				<th scope="col">Date Created</th>
				<th scope="col">Active</th>

			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row">1</th>
				<td>${leader.firstName}</td>
				<td>${leader.lastName}</td>
				<td>${leader.gender}</td>
				<td>${leader.country}</td>
				<td>${leader.dateOfBirth}</td>
				<td>${leader.birthPlace}</td>
			</tr>
		</tbody>
	</table>
	
	
</body>
</html>