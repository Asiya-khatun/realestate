<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Admin Panel - Real Estate System</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
  <link rel="stylesheet" href="${cp}/assets/css/admin.css">
</head>

<body>

<%@ include file="navbar.jsp" %>
<%@ include file="sidebar.jsp" %>

<main class="admin-content">
  <div class="container-fluid">
    <h2 class="mb-4">Dashboard</h2>

    <div class="row g-4">
      <div class="col-md-4">
        <div class="card bg-primary text-white admin-card">
          <div class="card-body">
            <h5 class="card-title"><i class="fas fa-building"></i> Total Properties</h5>
            <h3>150</h3>
          </div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="card bg-success text-white admin-card">
          <div class="card-body">
            <h5 class="card-title"><i class="fas fa-users"></i> Total Users</h5>
            <h3>45</h3>
          </div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="card bg-warning text-white admin-card">
          <div class="card-body">
            <h5 class="card-title"><i class="fas fa-envelope-open-text"></i> Pending Requests</h5>
            <h3>10</h3>
          </div>
        </div>
      </div>
    </div>

    <div class="row mt-5">
      <div class="col-12">
        <div class="card admin-card">
          <div class="card-body">
            <h5 class="card-title">Recent Activities</h5>
            <p>No recent activities yet.</p>
          </div>
        </div>
      </div>
    </div>

  </div>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
