<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tacos</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
</head>
<body>

<nav class="navbar navbar-expand-lg bg-body-tertiary bg-info text-white">
  <div class="container-fluid">
    <a class="navbar-brand" href="/dreamhomehq">DreamHome HQ</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/home">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/logout">Log Out</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<h1 class="mt-4 ms-2">Edit Dream Home</h1>

<div class="container-sm text-bg-dark border border-info border border-5 rounded-3 mx-auto my-5 pt-2 pb-5"> 
   <form:form action="/homes/${house.id }/edit" method="post" modelAttribute="house">
   
   <!-- make sure the path for userId in a relationship matches the variable made in the model -->
   <form:input type="hidden" path="dreamHomeCreator" value="${house.dreamHomeCreator.id }"></form:input>
   <input type="hidden" name="_method" value="put" />
   
   <div class="form-group mb-3 mt-3">
			<!-- path has to match up with model variable -->
			<form:label path="address">Dream Home Address:</form:label>
			<form:input path="address" class="form-control"></form:input>
			<form:errors path="address" class="text-danger"></form:errors>
		</div>

		<div class="form-group mb-3">
			<!-- path has to match up with model variable -->
			<!--Make a drop down menu  -->
			<form:label path="houseType">Dream House Type</form:label>
			<form:select path="houseType" class="form-control">
				<option value="" selected disabled>Pick One</option>
				<form:option value="Ranch">Ranch</form:option>
				<form:option value="Two Story">Two Story</form:option>
			</form:select>
			<form:errors path="houseType" class="text-danger"></form:errors>
		</div>

		<div class="form-group mb-3">
			<!-- path has to match up with model variable -->
			<form:label path="imageURL">Link to Dream Home images:</form:label>
			<form:input path="imageURL" class="form-control"></form:input>
			<form:errors path="imageURL" class="text-danger"></form:errors>
		</div>

		<div class="form-group mb-3">
			<!-- path has to match up with model variable -->
			<form:label path="price">Price:</form:label>
			<form:input path="price" class="form-control"></form:input>
			<form:errors path="price" class="text-danger"></form:errors>
		</div>

		<div class="form-group mb-3">
			<!-- path has to match up with model variable -->
			<form:label path="bedroom">Number of Bedrooms:</form:label>
			<form:input path="bedroom" class="form-control"></form:input>
			<form:errors path="bedroom" class="text-danger"></form:errors>
		</div>

		<div class="form-group mb-3">
			<!-- path has to match up with model variable -->
			<form:label path="bathroom">Number of Bathrooms:</form:label>
			<form:input path="bathroom" class="form-control"></form:input>
			<form:errors path="bathroom" class="text-danger"></form:errors>
		</div>

		<div class="form-group mb-3">
			<!-- path has to match up with model variable -->
			<form:label path="squareFoot">Square Footage of Dream Home:</form:label>
			<form:input path="squareFoot" class="form-control"></form:input>
			<form:errors path="squareFoot" class="text-danger"></form:errors>
		</div>

		<div class="form-group mb-3">
			<!-- path has to match up with model variable -->
			<form:label path="marketStatus">Market Status:</form:label>
			<form:select path="marketStatus" class="form-control">
				<option value="" selected disabled>Pick One</option>
				<form:option value="Active">Active</form:option>
				<form:option value="Contingent">Contingent</form:option>
				<form:option value="Sold">Sold</form:option>
			</form:select>
			<form:errors path="marketStatus" class="text-danger"></form:errors>
		</div>

		<div class="form-group mb-3">
			<!-- path has to match up with model variable -->
			<form:label path="Notes">Dream Home Notes:</form:label>
			<form:textarea path="Notes" class="form-control"></form:textarea>
			<form:errors path="Notes" class="text-danger"></form:errors>
		</div>

		<div class="form-group">
			<button type="submit" class="btn btn-info mt-2">Submit</button>
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