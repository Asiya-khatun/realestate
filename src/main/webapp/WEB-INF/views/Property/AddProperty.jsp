<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Add Property</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no">

 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
  <link rel="stylesheet" href="${cp}/assets/css/admin.css">
<style>
/* General Body and Layout */
body {
    font-family: "Poppins", sans-serif;
    margin: 0;
    padding: 0;
    background: linear-gradient(to right, #f3f6fb, #dce3f0);
}

/* Navbar Style */
.navbar {
    position: fixed;
    width: 100%;
    top: 0;
    left: 0;
    background-color: #007bff;
    color: white;
    z-index: 1000;
    padding: 15px 20px;
}

/* Sidebar Style */
.sidebar {
    position: fixed;
    top: 60px; /* Adjust for the navbar height */
    left: 0;
    width: 250px;
    height: calc(100% - 60px); /* To fit the full height minus the navbar */
    background-color: #34495e;
    color: white;
    padding: 20px;
    box-shadow: 2px 0 6px rgba(0, 0, 0, 0.1);
    z-index: 999;
    overflow-y: auto; /* Make the sidebar scrollable */
}

/* Main Content Styling */
.main-content {
    margin-left: 250px; /* Offset for the sidebar */
    margin-top: 60px; /* Offset for the navbar */
    padding: 30px;
    max-width: calc(100% - 250px); /* Adjust the content width */
}

/* Card Style */
.card {
    background: #ffffff;
    border-radius: 12px;
    padding: 30px;
    box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.1);
}

/* Form Styling */
.form-control, .form-select {
    border-radius: 8px;
    border: 1px solid #ccd1d9;
    padding: 12px;
    transition: all 0.3s ease-in-out;
}

.form-control:focus, .form-select:focus {
    border-color: #007bff;
    box-shadow: 0px 0px 10px rgba(0, 123, 255, 0.2);
}

/* Button Styling */
.btn-primary {
    background: #007bff;
    border: none;
    padding: 12px 20px;
    border-radius: 8px;
    font-size: 18px;
    font-weight: 600;
    text-transform: uppercase;
    transition: 0.3s ease-in-out;
    width: 100%;
}

.btn-primary:hover {
    background: #0056b3;
}

/* Image Upload Styling */
.form-control-file {
    border: 2px dashed #007bff;
    padding: 10px;
    text-align: center;
    cursor: pointer;
    background: #f8f9fa;
    transition: 0.3s ease-in-out;
}

.form-control-file:hover {
    background: #e9ecef;
    border-color: #0056b3;
}
</style>
</head>

<body>
	    <%@ include file="../admin/navbar.jsp" %>
    
        <%@ include file="../admin/sidebar.jsp" %>

	<!-- Main Content -->
	<div class="main-content">
		<div class="container d-flex justify-content-center align-items-center">
			<div class="card shadow-lg p-4">
				<c:choose>
					<c:when test="${edit ne true}">
						<h3 class="text-center mb-4">Add Property</h3>
						<form action="${cp }/admin/addProperty" method="POST"
							enctype="multipart/form-data">
							<input type="hidden" name="${_csrf.parameterName }"
								value="${_csrf.token }">
							<div class="col-md-6 mb-3">
								<label for="location" class="form-label">Location</label> <input
									type="text" id="location" name="location" class="form-control"
									placeholder="Enter Property Location"
									value="${property.location}" required>
								<c:if test="${not empty errors.getFieldError('location')}">
									<small class="text-danger">${errors.getFieldError('location').defaultMessage}</small>
								</c:if>
							</div>

							<div class="row">
								<div class="col-md-6 mb-3">
									<label for="price" class="form-label">Targeted Price</label> <input
										type="number" id="price" name="price" class="form-control"
										placeholder="Enter Price" required>
								</div>
								<div class="col-md-6 mb-3">
									<label for="category" class="form-label">Category</label> <select
										id="category" name="category" class="form-select" required>
										<option value="" disabled selected>Select Category</option>
										<option value="RESIDENTAL">Residential</option>
										<option value="COMMERCIAL">Commercial</option>
										<option value="INDUSTRIAL">Industrial</option>
										<option value="AGRICULTURE">Agriculture</option>
										<option value="SPECIAL_PURPOSE">Special Purpose</option>
									</select>
								</div>
							</div>

							<div class="mb-3">
								<label for="description" class="form-label">Description</label>
								<textarea id="description" name="description"
									class="form-control" rows="3"
									placeholder="Enter Property Description" required></textarea>
							</div>

							<div class="row">
								<div class="col-md-6 mb-3">
									<label for="image" class="form-label">Upload Property
										Image</label> <input type="file" id="image" name="iFile"
										class="form-control-file" accept="image/*" required> <small
										class="text-muted">Allowed: JPG, PNG</small>
								</div>

							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-primary btn-lg">Submit
								</button>
							</div>
						</form>
					</c:when>

					<c:otherwise>

						<h3 class="text-center mb-4">Edit Property</h3>
						<form action="${cp }/admin/editProperty" method="POST"
							enctype="multipart/form-data">
							<input type="hidden" name="${_csrf.parameterName }"
								value="${_csrf.token }">

							<div class="row">
								<div class="col-md-6 mb-3">
									<label for="location" class="form-label">Id</label> <input
										type="text" id="location" name="id" class="form-control"
										value="${property.id}" readonly>
								</div>
								<div class="col-md-6 mb-3">
									<label for="location" class="form-label">Location</label> <input
										type="text" id="location" name="location" class="form-control"
										value="${property.location}">
								</div>
								<div class="col-md-6 mb-3">
									<label for="area" class="form-label">Total Area (sq ft)</label>
									<input type="number" id="area" name="area" class="form-control"
										value="${property.area }" required>
								</div>
							</div>

							<div class="row">
								<div class="col-md-6 mb-3">
									<label for="price" class="form-label">Targeted Price</label> <input
										type="number" id="price" name="price" class="form-control"
										value="${property.price}" required>
								</div>
								<div class="col-md-6 mb-3">
									<label for="category" class="form-label">Category</label> <select
										id="category" name="category" class="form-select" required>
										<option value="" disabled>Select Category</option>
										<option value="COMMERCIAL"
											${property.category == 'COMMERCIAL' ? 'selected' : ''}>Commercial</option>
										<option value="INDUSTRIAL"
											${property.category == 'INDUSTRIAL' ? 'selected' : ''}>Industrial</option>
										<option value="AGRICULTURE"
											${property.category == 'AGRICULTURE' ? 'selected' : ''}>Agriculture</option>
										<option value="SPECIAL_PURPOSE"
											${property.category == 'SPECIAL_PURPOSE' ? 'selected' : ''}>Special
											Purpose</option>
										<option value="RESIDENTAL"
											${property.category == 'RESIDENTAL' ? 'selected' : ''}>Residental</option>
									</select>
								</div>
							</div>

							<div class="mb-3">
								<label for="description" class="form-label">Description</label>
								<textarea id="description" name="description"
									class="form-control" rows="3">${property.description}</textarea>
							</div>

							<div class="row">
								<div class="col-md-6 mb-3">
									<input type="hidden" name="pevImage"
										value="${property.imageName}"> <label for="image"
										class="form-label">Upload Property Image</label> <input
										type="file" id="iFile" name="iFile" class="form-control-file"
										accept="image/*" src="${cp }/${property.imageName }">
								</div>

							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-primary btn-lg"
									value="Update">Edit</button>
							</div>
						</form>
					</c:otherwise>
				</c:choose>

			</div>
		</div>
	</div>

	<!-- Scripts -->
	<script src="${cp }/assets/js/core/jquery.3.2.1.min.js"></script>
	<script src="${cp }/assets/js/core/popper.min.js"></script>
	<script src="${cp }/assets/js/core/bootstrap.min.js"></script>
</body>
</html>
