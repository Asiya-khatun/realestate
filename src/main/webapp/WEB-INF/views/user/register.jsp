<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RealEstate</title>
</head>
<link rel="stylesheet" href="${cp }/css/register.css">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<body>
	<div class="container-sm">
		<div class="card">
			<form action="${cp }/register" method="post" enctype="multipart/form-data">
				<input type="hidden" name="${csrf_parameterName }"
					value="${ _csrf.token}" />

				<h2 align="center">
					Create an Account<br> Registration Form
				</h2>
				<div class="form-group">
				<div class="form-group row">
    <label class="control-label col-sm-2" for="name">Name:</label>
    <div class="col-sm-10">
        <input type="text" class="form-control" id="name" placeholder="Enter Name" name="name">
        <!-- Display field-specific error for 'name' -->
        <c:if test="${not empty valid_errors['name']}">
            <div class="text-danger">
                ${valid_1errors['name']}
            </div>
        </c:if>
    </div>
</div>


					<div class="form-group-row">
						<label class="control-label col-sm-2" for="Email"> Email:</label>
						<div class="col-sm-10">
							<input type="email" class="form-control" id="email"
								placeholder="Enter the email" name="email">
						</div>
						<c:if test="${not empty valid_errors }">
							<ul class="text-danger">
								<c:forEach var="error" items="${valid_errors }">
									<c:if test="${error.key=='email' }">
										<li>${error.defaultMessage }</li>
									</c:if>
								</c:forEach>
							</ul>
						</c:if>
					</div>

					<div class="form-group-row">
						<label class="control-label col-sm-2" for="citizenship_no">
							Citizenship_no:</label>
						<div class="col-sm-10">
							<input type="number" class="form-control" id="citi_no"
								placeholder="Enter the ciizenship no" name="citi_no">
						</div>
						<c:if test="${not empty valid_errors }">
							<ul class="text-danger">
								<c:forEach var="error" items="${valid_errors }">
									<c:if test="${error.key=='citi_no' }">
										<li>${error.defaultMessage }</li>
									</c:if>
								</c:forEach>
							</ul>
						</c:if>
					</div>

					<div class="form-group-row">
						<label class="control-label col-sm-2" for="address">
							Address:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="address"
								placeholder="Enter the address" name="address">
							<c:if test="${not empty valid_errors }">
								<ul class="text-danger">
									<c:forEach var="error" items="${valid_errors }">
										<c:if test="${error.key=='address' }">
											<li>${error.defaultMessage }</li>
										</c:if>
									</c:forEach>
								</ul>
							</c:if>
						</div>
					</div>

					<div class="form-group-row">
						<label class="control-label col-sm-2" for="age"> Age:</label>
						<div class="col-sm-10">
							<input type="number" class="form-control" id="age"
								placeholder="Enter the age" name="age">
						</div>
						<c:if test="${not empty valid_errors }">
							<ul class="text-danger">
								<c:forEach var="error" items="${valid_errors }">
									<c:if test="${error.key=='age' }">
										<li>${error.defaultMessage }</li>
									</c:if>
								</c:forEach>
							</ul>
						</c:if>
					</div>
					
				<!-- 	<div class="form-group-row">
						<label class="control-label col-sm-2" for="age"> Image</label>
						<div class="col-sm-10">
							<input type="file" class="form-control" id="imageName"
								 name="imagefile">
						</div>
						<c:if test="${not empty valid_errors }">
							<ul class="text-danger">
								<c:forEach var="error" items="${valid_errors }">
									<c:if test="${error.key=='age' }">
										<li>${error.defaultMessage }</li>
									</c:if>
								</c:forEach>
							</ul>
						</c:if>
					</div>   -->

					<div class="form-group-row">
						<label class="control-label col-sm-2" for="username">
							Username:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="username"
								placeholder="Enter the username" name="username">
						</div>
						<c:if test="${not empty valid_errors }">
							<ul class="text-danger">
								<c:forEach var="error" items="${valid_errors }">
									<c:if test="${error.key=='username' }">
										<li>${error.defaultMessage }</li>
									</c:if>
								</c:forEach>
							</ul>
						</c:if>
					</div>



					<div class="form-form-group">
						<label class="control-label col-sm-2" for="password">
							Password:</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" id="password"
								placeholder="Enter password" name="password">
						</div>
						<c:if test="${not empty valid_errors }">
							<ul class="text-danger">
								<c:forEach var="error" items="${valid_errors }">
									<c:if test="${error.key=='password' }">
										<li>${error.defaultMessage }</li>
									</c:if>
								</c:forEach>
							</ul>
						</c:if>
					</div>

					<div class="form-form-group">
						<label class="control-label col-sm-2" for="password">
							Confirm Password:</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" id="cofirm_password"
								placeholder="Confirm password" name="cpassword">
						</div>
					</div>
<br>
					<div class="form-group-row">
						<input type="submit" class="button" value="Register">
					</div>


					<div class="form-form-group">
						<h5 align="center">
							Already have an account!!<a href="${cp }/login"> Login Here</a>
							</h3>
					</div>
				</div>

			</form>
		</div>
	</div>

</body>
</html>