<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Favorite Properties</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Montserrat:wght@400;500;700&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
            padding-top: 80px;
            color: #333;
        }

        .header-title {
            font-family: 'Montserrat', sans-serif;
            font-size: 2.5rem;
            text-align: center;
            color: #2c3e50;
            font-weight: 700;
            margin-bottom: 2rem;
            position: relative;
            padding-bottom: 1rem;
        }

        .header-title:after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 4px;
            background: linear-gradient(90deg, #3498db, #9b59b6);
            border-radius: 2px;
        }

        .favorites-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        .accordion {
            --bs-accordion-border-color: rgba(0,0,0,0.08);
            --bs-accordion-btn-focus-box-shadow: 0 0 0 0.25rem rgba(52, 152, 219, 0.25);
        }

        .accordion-button {
            font-family: 'Montserrat', sans-serif;
            font-weight: 500;
            background-color: #f8f9fa;
            padding: 1.25rem 1.5rem;
            transition: all 0.3s ease;
        }

        .accordion-button:not(.collapsed) {
            background-color: rgba(52, 152, 219, 0.1);
            color: #2c3e50;
            box-shadow: none;
        }

        .accordion-button:after {
            background-size: 1.2rem;
        }

        .property-card {
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            background: white;
            margin: 1rem 0;
        }

        .property-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.12);
        }

        .property-header {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .property-thumbnail {
            width: 80px;
            height: 80px;
            border-radius: 8px;
            object-fit: cover;
            border: 2px solid white;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            cursor: pointer;
            transition: transform 0.3s ease;
        }

        .property-thumbnail:hover {
            transform: scale(1.05);
        }

        .property-title {
            font-weight: 600;
            font-size: 1.1rem;
            color: #2c3e50;
            margin-bottom: 0.25rem;
        }

        .property-price {
            font-weight: 700;
            color: #3498db;
            font-size: 1.2rem;
        }

        .property-details {
            padding: 1.5rem;
        }

        .detail-row {
            display: flex;
            margin-bottom: 0.75rem;
            align-items: center;
        }

        .detail-icon {
            width: 24px;
            text-align: center;
            margin-right: 0.75rem;
            color: #7f8c8d;
        }

        .detail-label {
            font-weight: 500;
            color: #7f8c8d;
            min-width: 100px;
        }

        .detail-value {
            font-weight: 400;
            color: #2c3e50;
        }

        .property-description {
            margin: 1.5rem 0;
            padding: 1rem;
            background-color: #f8f9fa;
            border-radius: 8px;
            font-size: 0.95rem;
            line-height: 1.6;
        }

        .action-buttons {
            display: flex;
            gap: 1rem;
            margin-top: 1.5rem;
        }

        .btn-visit {
            background: linear-gradient(135deg, #3498db, #2980b9);
            border: none;
            flex: 1;
            padding: 0.75rem;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .btn-visit:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 10px rgba(52, 152, 219, 0.3);
        }

        .btn-remove {
            background: linear-gradient(135deg, #e74c3c, #c0392b);
            border: none;
            flex: 1;
            padding: 0.75rem;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .btn-remove:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 10px rgba(231, 76, 60, 0.3);
        }

        .badge-category {
            background: linear-gradient(135deg, #9b59b6, #8e44ad);
            font-size: 0.8rem;
            padding: 0.5rem 0.75rem;
            border-radius: 50px;
            font-weight: 500;
            margin-left: auto;
        }

        .no-favorites {
            text-align: center;
            padding: 4rem 2rem;
            background: white;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            max-width: 600px;
            margin: 2rem auto;
        }

        .no-favorites-icon {
            font-size: 4rem;
            color: #e74c3c;
            margin-bottom: 1.5rem;
        }

        .no-favorites h3 {
            font-family: 'Montserrat', sans-serif;
            font-weight: 700;
            color: #2c3e50;
            margin-bottom: 1rem;
        }

        .no-favorites p {
            color: #7f8c8d;
            margin-bottom: 2rem;
            font-size: 1.1rem;
        }

        .btn-explore {
            background: linear-gradient(135deg, #3498db, #2980b9);
            padding: 0.75rem 2rem;
            font-weight: 500;
            border-radius: 50px;
            transition: all 0.3s ease;
        }

        .btn-explore:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 15px rgba(52, 152, 219, 0.3);
        }

        .modal-content {
            border-radius: 12px;
            overflow: hidden;
        }

        .modal-header {
            background: linear-gradient(135deg, #3498db, #2980b9);
            color: white;
            border-bottom: none;
        }

        .modal-body img {
            width: 100%;
            height: auto;
            border-radius: 8px;
        }

        .status-badge {
            padding: 0.5rem 1rem;
            border-radius: 50px;
            font-weight: 500;
            font-size: 0.9rem;
        }

        .status-pending {
            background-color: #f39c12;
            color: white;
        }

        .status-approved {
            background-color: #2ecc71;
            color: white;
        }

        .status-rejected {
            background-color: #e74c3c;
            color: white;
        }

        @media (max-width: 768px) {
            .header-title {
                font-size: 2rem;
            }
            
            .property-header {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .action-buttons {
                flex-direction: column;
            }
        }
    </style>
</head>

<body>

<%@ include file="../user/navbar.jsp"%>

<div class="favorites-container">
    <h1 class="header-title">My Favorite Properties</h1>

    <div class="accordion" id="favoritesAccordion">
        <c:choose>
            <c:when test="${not empty favourite}">
                <c:forEach items="${favourite}" var="fav">
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="heading${fav.property.id}">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" 
                                    data-bs-target="#collapse${fav.property.id}" aria-expanded="false" 
                                    aria-controls="collapse${fav.property.id}">
                                <div class="property-header">
                                    <img src="${cp}/${fav.property.imageName}" alt="Property" 
                                         class="property-thumbnail" 
                                         data-bs-toggle="modal" 
                                         data-bs-target="#imageModal${fav.property.id}">
                                    <div>
                                        <div class="property-title">${fav.property.location}</div>
                                        <div class="property-price">Rs. ${fav.property.price}</div>
                                    </div>
                                    <span class="badge badge-category">${fav.property.category}</span>
                                </div>
                            </button>
                        </h2>
                        <div id="collapse${fav.property.id}" class="accordion-collapse collapse" 
                             aria-labelledby="heading${fav.property.id}" 
                             data-bs-parent="#favoritesAccordion">
                            <div class="accordion-body p-0">
                                <div class="property-card">
                                    <div class="property-details">
                                        <div class="detail-row">
                                            <span class="detail-icon"><i class="bi bi-geo-alt-fill"></i></span>
                                            <span class="detail-label">Location:</span>
                                            <span class="detail-value">${fav.property.location}</span>
                                        </div>
                                        <div class="detail-row">
                                            <span class="detail-icon"><i class="bi bi-rulers"></i></span>
                                            <span class="detail-label">Area:</span>
                                            <span class="detail-value">${fav.property.area} sq.ft.</span>
                                        </div>
                                        <div class="detail-row">
                                            <span class="detail-icon"><i class="bi bi-cash-stack"></i></span>
                                            <span class="detail-label">Price:</span>
                                            <span class="detail-value">Rs. ${fav.property.price}</span>
                                        </div>
                                        <div class="detail-row">
                                            <span class="detail-icon"><i class="bi bi-tags-fill"></i></span>
                                            <span class="detail-label">Category:</span>
                                            <span class="detail-value">${fav.property.category}</span>
                                        </div>
                                        
                                        <div class="property-description">
                                            <i class="bi bi-info-circle-fill"></i> ${fav.property.description}
                                        </div>
                                        
                                        <div class="action-buttons">
                                            <c:set var="isRequested" value="false" />
                                            <c:forEach items="${prop}" var="request">
                                                <c:if test="${request.property.id == fav.property.id}">
                                                    <c:set var="isRequested" value="true" />
                                                    <c:set var="requestStatus" value="${request.status}" />
                                                </c:if>
                                            </c:forEach>
                                            
                                            <c:choose>
                                            <c:when test="${isRequested}">
    <button class="btn btn-secondary btn-visit" disabled>
        <i class="bi bi-check-circle-fill"></i> Request Sent
    </button>
    <span class="status-badge status-${requestStatus.name().toLowerCase()}">
        ${requestStatus}
    </span>
</c:when>
                                                <c:otherwise>
                                                    <form action="${cp}/user/sendrequest/${fav.property.id}" method="post" class="w-100">
                                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                        <button type="submit" class="btn btn-primary btn-visit">
                                                            <i class="bi bi-calendar-check"></i> Request Visit
                                                        </button>
                                                    </form>
                                                </c:otherwise>
                                            </c:choose>
                                            
                                            <form action="${cp}/user/delete/${fav.fav_id}" method="post" class="w-100">
                                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                <button type="submit" class="btn btn-danger btn-remove" 
                                                        onclick="return confirm('Are you sure you want to remove this property from your favorites?')">
                                                    <i class="bi bi-heartbreak-fill"></i> Remove
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Modal for displaying large photo -->
                    <div class="modal fade" id="imageModal${fav.property.id}" tabindex="-1" 
                         aria-labelledby="imageModalLabel${fav.property.id}" aria-hidden="true">
                        <div class="modal-dialog modal-lg modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="imageModalLabel${fav.property.id}">
                                        ${fav.property.location}
                                    </h5>
                                    <button type="button" class="btn-close btn-close-white" 
                                            data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <img src="${cp}/${fav.property.imageName}" alt="Property Image" 
                                         class="img-fluid">
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:when>

            <c:otherwise>
                <div class="no-favorites">
                    <div class="no-favorites-icon">
                        <i class="bi bi-heartbreak"></i>
                    </div>
                    <h3>No Favorite Properties Yet</h3>
                    <p>You haven't added any properties to your favorites. Start exploring and save your favorite properties for easy access!</p>
                    <a href="${cp}/user/properties" class="btn btn-primary btn-explore">
                        <i class="bi bi-search"></i> Browse Properties
                    </a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <c:if test="${not empty added}">
        <div class="alert alert-success alert-dismissible fade show mt-4" role="alert">
            <i class="bi bi-check-circle-fill"></i> ${added}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>
    <c:if test="${not empty request}">
        <div class="alert alert-info alert-dismissible fade show mt-4" role="alert">
            <i class="bi bi-info-circle-fill"></i> ${request}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Smooth scroll to alerts if they exist
    document.addEventListener('DOMContentLoaded', function() {
        const alerts = document.querySelectorAll('.alert');
        if (alerts.length > 0) {
            alerts[0].scrollIntoView({ behavior: 'smooth' });
        }
    });
</script>
</body>
</html>