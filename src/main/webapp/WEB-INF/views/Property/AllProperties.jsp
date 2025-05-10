<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    <!-- Favicon  -->

<!-- Style CSS -->
    <title>Properties</title>

    <style>
        /* General Styling */
        /* General Styling */
body {
    font-family: 'Nunito', sans-serif;
    background-color: #f5f7fa;
    text-align: center;
    color: #333;
    margin: 0;
    padding: 0; /* change padding from 1px to 0 */
}

h1 {
    margin-top: 100px;
    font-size: 2rem;
    font-weight: 700;
    text-transform: uppercase;
    background: linear-gradient(90deg, #ff6b6b, #ff8e53);
    -webkit-background-clip: text;
    color: transparent;
}

.properties-container {
    max-width: 1000px;
    min-width: 320px;
    margin: 30px auto;
        margin-top: 80px; /* shift properties below navbar */
    
    padding: 0 15px;
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 20px;
}


/* Property Card */
.property-card {
    background: #ffffff;
    border-radius: 15px;
    box-shadow: 0px 10px 20px rgba(255, 107, 107, 0.15);
    overflow: hidden;
    transition: transform 0.3s ease-in-out, box-shadow 0.3s ease;
    padding: 15px;
    text-align: left;
    border: 1px solid #ffe0e0;
}

.property-card:hover {
    transform: translateY(-8px);
    box-shadow: 0px 15px 30px rgba(255, 107, 107, 0.25);
}

/* Image Section */
.property-card img {
    width: 100%;
    height: 250px;
    object-fit: cover;
    border-radius: 10px;
    transition: transform 0.3s ease-in-out;
}

.property-card:hover img {
    transform: scale(1.05);
}

/* Information Section */
.property-info {
    padding-top: 15px;
}

.property-card h2 {
    font-size: 1.5rem;
    color: #2c3e50;
    font-weight: 700;
    margin-bottom: 10px;
}

.property-card h5,
.property-card p {
    font-size: 1rem;
    color: #555;
    margin-bottom: 8px;
    font-weight: 500;
}

/* Price Styling */
.price {
    font-size: 1.5rem;
    color: #e74c3c;
    font-weight: 600;
    margin-top: 10px;
}

/* Favorite Button */
.fav-btn {
    background-color: transparent;
    border: none;
    cursor: pointer;
    font-size: 28px;
    color: #ff6b6b;
    transition: transform 0.2s ease-in-out, color 0.2s ease;
}

.fav-btn:hover {
    color: #ff3b3b;
    transform: scale(1.2);
}

/* Favorite Status */
.text-warning {
    color: #f39c12 !important;
}

.text-danger {
    color: #e74c3c !important;
}

.text-dark {
    color: #2c3e50 !important;
}

/* No Properties Message */
.no-properties {
    color: #e74c3c;
    font-size: 1.6rem;
    font-weight: 700;
    margin-top: 50px;
    text-transform: uppercase;
}

/* Responsive Design */
@media (max-width: 768px) {
    .container {
        grid-template-columns: 1fr;
    }

    h1 {
        font-size: 1.8rem;
    }

    .property-card img {
        height: 200px;
    }
}

    </style>
</head>

<%@ include file="../user/navbar.jsp"%>

<body>
<div class="properties-container">
        <c:if test="${not empty properties}">
            <c:forEach items="${properties}" var="property">
                <div class="property-card">
                    <!-- Image Section -->
                    
                    <img class="property-image" src="${cp}/${property.imageName}" 
                         alt="Property Image" class="bi bi-star-fill" data-bs-toggle="modal" data-bs-target="#imageModal" 
                         onclick="openImageModal('${cp}/${property.imageName}')" >
                         

                    <!-- Information Section -->
                    <div class="property-info">
                    <a href="${cp}/user/propertiesdetails/${property.id}">
                        <h2><i class="bi bi-geo-alt"></i> ${property.location}</h2>
                        <h5><i class="bi bi-diagram-2"></i> ${property.area} sq.ft</h5>
                        <h5><i class="fas fa-store"></i> ${property.category}</h5>
                        <h5 class="price"><i class="bi bi-cash-coin"></i> Rs: ${property.price}</h5>
                        <p class="description"><i class="bi bi-ticket-detailed-fill"></i> ${property.description}</p>
</a>
                        <!-- Favorite Button -->
                     <!-- Add Bootstrap Icons -->

<!-- Initialize Default States -->
<c:set var="isFavorite" value="false" />
<c:set var="isRequested" value="false" />

<!-- Check if Property is Favorited -->
<c:if test="${not empty fav}">
    <c:forEach items="${fav}" var="favorite">
        <c:if test="${favorite.property.id == property.id}">
            <c:set var="isFavorite" value="true" />
        </c:if>
    </c:forEach>
</c:if>

<!-- Check if Property Visit is Requested -->
<c:if test="${not empty req}">
    <c:forEach items="${req}" var="request">
        <c:if test="${request.property.id == property.id}">
            <c:set var="isRequested" value="true" />
        </c:if>
    </c:forEach>
</c:if>

<!-- Display Favorite or Requested Status -->
<c:choose>
    <c:when test="${isRequested}">
        <!-- Requested Property -->
        <span class="text-danger">
            <i class="bi bi-heart-fill"></i> Requested
        </span>
    </c:when>
    
    <c:when test="${isFavorite}">
        <!-- Favorited Property -->
        <span class="text-warning">
            <i class="bi bi-star-fill"></i> Favorite
        </span>
    </c:when>
    
    <c:otherwise>
        <!-- Add to Favorites Link -->
        <a href="${cp}/user/my-fav/${property.id}" class="text-decoration-none text-dark">
            <i class="bi bi-star"></i> Add to Favorites
        </a>
    </c:otherwise>
</c:choose>


                    </div>
                </div>
            </c:forEach>
        </c:if>

        <c:if test="${empty properties}">
            <p class="no-properties">🚨 No properties found. Check back later!</p>
        </c:if>
    </div>

    <!-- Success Messages -->
  
    <c:if test="${not empty sent}">
        <div class="alert alert-info">${sent}</div>
    </c:if>

    <div class="text-center mt-4">
        <a href="${cp}/user/homePage" class="btn btn-primary">Back</a>
    </div>

    <!-- Modal for Fullscreen Image -->
    <div class="modal fade" id="imageModal" tabindex="-1" aria-labelledby="imageModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-body text-center">
                    <img id="modalImage" class="img-fluid" src="" alt="Full Image">
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->

    <!-- JavaScript for Image Modal -->
    <script>
        function openImageModal(imageSrc) {
            document.getElementById('modalImage').src = imageSrc;
        }
    </script>
    <%@include file="../user/footer.jsp" %>
</body>
</html>
