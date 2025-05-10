<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <c:set var="cp" value="${pageContext.request.contextPath}" />
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Form</title>
</head>
<link rel="stylesheet" href="${cp }/css/register.css" >

<body>

<div class="container-sm" >
<div class="card">
<form  class="user" action="${cp }/login" method="post">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

<c:if test="${not empty register }">
<div class="alert alert-success" > ${register }</div>
</c:if>

<h2 align="center" bgcolor="red">Login Form</h2>
<div class="form-group">
<div class="form-group-row">
<label class="control-label col-sm-2" for="username" > Username:</label>
<div class="col-sm-10">
<input type="text" class="form-control" id="username" placeholder="Enter the username"  name="username" >
</div>
</div>
<div class="form-form-group">
<label class="control-label col-sm-2" for="password"> Password:</label>
<div class="col-sm-10">
<input type="password" class="form-control" id="password" placeholder="Enter password" name="password" >
</div>
</div>
<div class="form-group-row">
<input type="submit"  class="button" value="login" >
</div>
<div class="form-form-group">
<h5 align="center"> Create an Account!!<a href="${cp }/registerUser">Register Here</a> </h3>
</div>

</div>

 </form>
</div>
</div>

</body>
</html>