<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="cp" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Property Visit Requests</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
  <link rel="stylesheet" href="${cp}/assets/css/admin.css">

  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background-color: #f8f9fa;
      margin: 0;
      padding: 0;
    }

    .main-content {
      margin-left: 240px; /* To make sure content is pushed to the right of the sidebar */
      min-height: 100vh;
      display: flex;
      flex-direction: column;
    }

    .content-wrapper {
      padding: 30px;
      background-color: #f5f7fa;
      flex: 1;
      margin-top: 56px; /* Offset for navbar height */
    }

    h2 {
      text-align: center;
      margin-bottom: 30px;
      font-weight: 600;
      color: #333;
    }

    .card {
      border: none;
      border-radius: 12px;
      box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
      transition: all 0.3s ease;
    }

    .card:hover {
      transform: translateY(-5px);
    }

    .user-info {
      background-color: #eef6f9;
      padding: 15px;
      border-radius: 10px;
      margin-bottom: 15px;
    }

    .user-info h5 {
      margin-bottom: 10px;
      color: #007bff;
    }

    .user-info p {
      margin: 5px 0;
      font-size: 14px;
    }

    .property-info li {
      margin-bottom: 8px;
      font-size: 15px;
      color: #444;
    }

    .property-info li i {
      margin-right: 8px;
      color: #0d6efd;
    }

    .status-badge {
      font-size: 14px;
      padding: 5px 10px;
      border-radius: 6px;
      color: white;
      background-color: #28a745;
      display: inline-block;
      margin-top: 15px;
    }

  </style>
</head>

<body>

  <%@ include file="sidebar.jsp" %>

  <div class="main-content">
    <%@ include file="navbar.jsp" %>

    <div class="content-wrapper">
      <h2>My Property Visit Requests</h2>

      <div class="row g-4">
        <c:forEach items="${myrequest}" var="req">
          <div class="col-md-6 col-lg-4">
            <div class="card p-3">
              <!-- User Info -->
              <div class="user-info">
                <h5><i class="fas fa-user"></i> ${req.user.username}</h5>
                <p><i class="fas fa-envelope"></i> ${req.user.email}</p>
                <p><i class="fas fa-map-marker-alt"></i> ${req.user.address}</p>
                <p><i class="fas fa-id-card"></i> Citizenship No: ${req.user.citi_no}</p>
                <p><i class="fas fa-calendar"></i> Age: ${req.user.age}</p>
              </div>

              <!-- Property Info -->
              <ul class="list-unstyled property-info">
                <li><i class="fas fa-home"></i> Location: ${req.property.location}</li>
                <li><i class="fas fa-ruler-combined"></i> Size: ${req.property.area} sq.ft</li>
                <li><i class="fas fa-money-bill-wave"></i> Price: Rs. ${req.property.price}</li>
                <li><i class="fas fa-align-left"></i> ${req.property.description}</li>
                <li><i class="fas fa-tags"></i> Category: ${req.property.category}</li>
              </ul>

              <!-- Status Badge -->
              <span class="status-badge">Status: ${req.status}</span>
            </div>
          </div>
        </c:forEach>
      </div>
    </div> <!-- content-wrapper end -->
  </div> <!-- main-content end -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
