<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register or Log-In</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/app.js"></script>
<!-- change to match your file/naming structure -->
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top mb-5 ">
		<div class="container-fluid">
			<div class="d-flex justify-content-between w-100">
				<a class="navbar-brand" href="/dreamhomehq">My DreamHome HQ</a>
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="/">Log
							In/Register</a></li>
				</ul>
			</div>
		</div>
	</nav>
	
	
	<div class="container-fluid mt-5 pt-3">
    <!-- Header with image background -->
    <div class="row">
        <div class="col p-0">
            <div class="header-image d-flex " style="background-image: url('/images/aerialHomes2.jpg'); background-size: cover; background-position: center; height: 200px; object-fit: cover;">
                <div class="overlay"></div> <!-- Overlay for text -->
                <div class="text-overlay">
                    <h1 class="text-info fw-bold display-4 ms-2">Welcome!</h1>
                    <p class="text-info fw-bold fs-3 ms-2">You are on your way to finding your Dream Home!</p>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- <h1 class="mt-5 mb-5 text-center">Welcome-you are on your way to finding your Dream home!</h1> -->

	<p class="text-danger">
		<c:out value="${notLoggedIn }"></c:out>
	</p>



	<div class="container-sm text-bg-dark border border-info border border-5 rounded-3 mx-auto my-5 pt-2 pb-5">
	<h2 class="mt-4 mb-3">Register-First Time Visiting</h2>

	<form:form action="/register" method="post" modelAttribute="user">
		<div class="form-group mb-3">
			<!-- if want to display errors at top of page <form:errors path="*"></form:errors> -->
			<!-- path needs to be the same as the getter and setter variable name -->
			<form:label path="name">User Name</form:label>
			<form:input path="name" class="form-control"></form:input>
			<form:errors path="name" class="text-danger"></form:errors>
		</div>


		<div class="form-group mb-3">
			<form:label path="email">Email</form:label>
			<form:input path="email" class="form-control"></form:input>
			<form:errors path="email" class="text-danger"></form:errors>
		</div>

		<div class="form-group mb-3">
			<form:label path="password">Password</form:label>
			<form:input path="password" class="form-control"></form:input>
			<form:errors path="password" class="text-danger"></form:errors>
		</div>

		<div class="form-group mb-3">
			<form:label path="confirmPassword">Confirm Password</form:label>
			<form:input path="confirmPassword" class="form-control"></form:input>
			<form:errors path="confirmPassword" class="text-danger"></form:errors>
		</div>

		<div class="form-group text-right">
			<button class="btn btn-info mt-2">Register</button>
		</div>
	</form:form>
	</div>


<div class="container-sm text-bg-dark border border-info border border-5 rounded-3 mx-auto my-5 pt-2 pb-5">
	<h2 class="mt-4 mb-3">Log In-Returning to your DreamHome List</h2>
	<form:form action="/login" method="post" modelAttribute="loginUser">
		
			<div class="form-group mb-3 mt-2">
				<form:label path="email">Email</form:label>
				<form:input path="email" class="form-control"></form:input>
				<form:errors path="email" class="text-danger"></form:errors>
			</div>

			<div class="form-group mb-3">
				<form:label path="password">Password</form:label>
				<form:input path="password" class="form-control"></form:input>
				<form:errors path="password" class="text-danger"></form:errors>
			</div>
			<div class="form-group text-right">
				<button class="btn btn-info mt-2">Log In</button>
			</div>
		
	</form:form>
	</div>
	
	<footer class="bg-dark text-white text-center py-4 mt-5">
    <div class="container">
        <p>&copy; 2024 DreamHome. All rights reserved.</p>
    </div>
</footer>


</body>
</html>