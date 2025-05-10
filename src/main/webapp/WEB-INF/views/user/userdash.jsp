<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Real Estate</title>

<link rel="stylesheet" href="${cp }/asset/css/userdash.css">


<!-- Swiper CSS -->
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css">

<!-- Additional Styles -->

</head>

<body>
<%@ include file="navbar.jsp" %>
	<!-- Preloader -->



	<!-- Main Content -->
	<div class="main-content">
		<section class="property-area">
			<div class="container">
				<!-- Swiper Container -->
				<div class="swiper-container">
					<div class="swiper-wrapper">
						<!-- Property Images -->
						<div class="swiper-slide">
							<img src="/asset/img/bg-img/hero4.jpg" alt="Property Image">
						</div>
						<div class="swiper-slide">
							<img src="/asset/img/bg-img/hero5.jpg" alt="Property Image">
						</div>

						<div class="swiper-slide">
							<img src="/asset/img/bg-img/hero1.jpg" alt="Property Image">
						</div>
						<!-- Add more images as necessary -->
					</div>
					<!-- Add Pagination (Optional) -->
					<div class="swiper-pagination"></div>
					<!-- Add Navigation (Optional) -->
					<div class="swiper-button-next"></div>
					<div class="swiper-button-prev"></div>
				</div>
			</div>
		</section>
	</div>



	<script>
        // Initialize Swiper
        var swiper = new Swiper('.swiper-container', {
            loop: true,
            spaceBetween: 10,
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
            pagination: {
                el: '.swiper-pagination',
                clickable: true,
            },
        });
    </script>

</body>

</html>
