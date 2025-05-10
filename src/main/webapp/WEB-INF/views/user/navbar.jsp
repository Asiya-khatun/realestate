<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">

    <!-- Favicon -->
    <link rel="icon" href="${cp}/asset/img/core-img/favicon.ico">

    <!-- Bootstrap 4 CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- Your Custom CSS -->
    <link rel="stylesheet" href="${cp}/asset/style.css">

    <title>Navbar</title>
</head>

<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="${cp}/user/homePage">Real Estate</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse"
            data-target="#navbarNav" aria-controls="navbarNav"
            aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="${cp}/user/homePage">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${cp}/user/allProperties">Properties</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${cp}/user/showFav/${user.id}">${user.id} WishList</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${cp}/user/my-response">My Requests</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${cp}/user/MyProfile">Profile</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${cp}/logout">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- jQuery (Necessary for All JavaScript Plugins) -->
<script src="${cp}/asset/js/jquery/jquery-2.2.4.min.js"></script>

<!-- Popper JS -->
<script src="${cp}/asset/js/popper.min.js"></script>

<!-- Bootstrap JS -->
<script src="${cp}/asset/js/bootstrap.min.js"></script>

<!-- Swiper JS -->
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<!-- Active JS -->

</body>
</html>
