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
<title>DreamHome Dashboard</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/app.js"></script>
<!-- change to match your file/naming structure -->
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
          <a class="nav-link active" aria-current="page" href="/homes/new">Add a DreamHome</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/logout">Log Out</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

	<div class="container-fluid mt-2 mx-0 mp-0">
		<div class="row">
			<div class="col d-flex justify-content-center align-items-center p-0">
				<img src="/images/aerialAutumn.jpg" class="img-fluid"
					style="width: 100%; max-height: 300px; object-fit: cover;" Aerialimage">
			</div>
		</div>
	</div>

	<div>
		<h3 class="mt-3 mb-3 ms-5 fs-2">My Dream Homes</h3>
	</div>
	
<%-- 	Not working now since auth taken out of dashboard get mapping route to 
	allow the dashboard to be shared with another user and view the dashboard
	without being logged in
	<div>
    <span class="text-info ms-5 mb-5 fs-2">
        <c:out value="${userName }"></c:out>
    </span>
</div> --%>

<!-- Need to add a Add a DreamHome button or link to go to add dream home form -->
<div class="border border-dark p-3 text-center">
    <a href="/homes/new" class="d-block text-info">
       <i class="bi bi-plus-circle-fill bi-3x mb-3"></i>
        <span class="fs-5">Add a DreamHome</span>
    </a>
</div>



<div class="row mt-5 ms-3">
    <c:forEach var="house" items="${allHouses}">
        <c:if test="${house.dreamHomeCreator.id == loggedInUserId}">
            <div class="col-lg-3 col-md-3 mb-4">
                <div class="card bg-dark text-white">
                    <div class="card-body">
                        <h5 class="card-title">${house.address}</h5>
                        <p class="card-text">Price: $${house.price}</p>
                        <p class="card-text">Type: ${house.houseType}</p>
                        <p class="card-text">Bedrooms: ${house.bedroom}</p>
                        <p class="card-text">Bathrooms: ${house.bathroom}</p>
                        <p class="card-text">Square footage: ${house.squareFoot}</p>
                        <p class="card-text">Status: ${house.marketStatus}</p>
                       <p class="card-text">Notes: ${house.notes}</p>
                        
                        <a href="${house.imageURL}" class="text-info fs-5">View this home</a>
                        <div class="row mt-3 ms-1">
                            <div class="col">
                                <a href="/homes/${house.id}/edit" class="btn btn-info btn-sm shadow-md">Edit</a>
                            </div>
                            <div class="col">
                                <form action="/homes/${house.id}" method="post">
                                    <input type="hidden" name="_method" value="delete" />
                                    <button type="submit" class="btn btn-info btn-sm">Not the One</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>
    </c:forEach>
</div>

<div class="container text-center">
<button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#shareModal">
  Share DreamHomes
</button>
</div>

<div class="modal fade" id="shareModal" tabindex="-1" aria-labelledby="shareModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="shareModalLabel">Share DreamHomes</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <p>Share DreamHomes Link:</p>
        <input type="text" class="form-control" id="shareLink" value="${shareLink}" readonly>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-dark" data-bs-dismiss="modal">Close</button>
        <!-- can add more buttons here if needed -->
      </div>
    </div>
  </div>
</div>





<%-- <div class="row">
    <c:forEach var="house" items="${allHouses}">
        <c:if test="${house.dreamHomeCreator.id == loggedInUserId}">
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">${house.address}</h5>
                        <p class="card-text">${house.price}</p>
                        <a href="${house.imageURL}">View this home</a>
                        <a href="/homes/${house.id}/edit" class="btn btn-primary">Edit</a>
                        <form action="/homes/${house.id}" method="post">
                            <input type="hidden" name="_method" value="delete" />
                            <button type="submit" class="btn btn-danger">Not the One</button>
                        </form>
                    </div>
                </div>
            </div>
        </c:if>
    </c:forEach>
</div> --%>

<%-- 	<c:forEach var="house" items="${allHouses }">
		<c:if test="${house.dreamHomeCreator.id == loggedInUserId }">
			<div>
				<c:out value="${house.address }"></c:out>
			</div>
			<div>
				<c:out value="${house.price }"></c:out>
			</div>
			<a href="${house.imageURL }">View this home</a>

			<a href="/homes/${house.id }/edit" class="btn btn-primary">Edit</a>
			<form action="/homes/${house.id }" method="post">
				<input type="hidden" name="_method" value="delete" />
				<button type="submit" class="btn btn-danger">Not the One</button>
			</form>

		</c:if>
	</c:forEach>
 --%>

<footer class="bg-dark text-white text-center py-4 mt-5">
    <div class="container">
        <p>&copy; 2024 DreamHome. All rights reserved.</p>
    </div>
</footer>

</body>
</html>


