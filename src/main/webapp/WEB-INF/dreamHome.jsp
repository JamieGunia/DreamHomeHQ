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
<title>DreamHome HQ-an application for Buyer Collaboration</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/app.js"></script>
<!-- change to match your file/naming structure -->
</head>
<body>


	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top ">
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


	<div id="carouselExampleSlidesOnly" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="/images/redDoor.jpg" class="d-block w-100" style="height: 700px; object-fit: cover;"
					alt="first slide">
			</div>
			<div class="carousel-item">
				<img src="/images/livingRoom2.jpg" class="d-block w-100" style="height: 700px; object-fit: cover;"
					alt="second slide">
			</div>
			<div class="carousel-item">
				<img src="/images/livingRoom3.jpg" class="d-block w-100" style="height: 700px; object-fit: cover;"
					alt="third slide">
			</div>
			<div class="carousel-item">
				<img src="/images/kitchen4.jpg" class="d-block w-100" style="height: 700px; object-fit: cover;"
					alt="fourth slide">
			</div>
			<div class="carousel-item">
				<img src="/images/kitchen2.jpg" class="d-block w-100" style="height: 700px; object-fit: cover;"
					alt="fifth slide">
			</div>
			<div class="carousel-item">
				<img src="/images/dine.jpg" class="d-block w-100" style="height: 700px; object-fit: cover;" 
				alt="sixth slide">
			</div>
			<div class="carousel-item">
				<img src="/images/bath2.jpg" class="d-block w-100" style="height: 700px; object-fit: cover;"
					alt="seveneth slide">
			</div>
		</div>
	</div>


	<div>
		<h1 class="display-4 mt-5 ms-3 mb-3">Welcome to My DreamHome HQ</h1>
		<p class="lead ms-3 fs-2">Are you looking to buy a house?</p>
		<p class="lead ms-3 fs-2">DreamHome HQ is a site that allows you to
			build, keep, and share a list of your Dream Homes in one app!</p>
		<hr class="my-4 ms-2">
		<p class="ms-3 fs-5">Log In to start building your list of Dream Homes!</p>
	</div>



	<footer class="bg-dark text-white text-center py-4 mt-5">
		<div class="container">
			<p>&copy; 2024 DreamHome HQ. All rights reserved.</p>
		</div>
	</footer>


</body>
</html>