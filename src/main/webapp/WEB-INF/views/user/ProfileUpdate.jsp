<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Profile Management</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${cp }/css/register.css">
<style>
    :root {
        --primary-color: #4e73df;
        --secondary-color: #f8f9fc;
        --accent-color: #2e59d9;
        --text-color: #5a5c69;
        --danger-color: #e74a3b;
    }
    
    body {
        background-color: #f8f9fc;
        color: var(--text-color);
        font-family: 'Nunito', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
    }
    
    .profile-container {
        max-width: 1200px;
        margin: 2rem auto;
        padding: 0 15px;
    }
    
    .form-container {
        display: flex;
        flex-wrap: wrap;
        gap: 30px;
        justify-content: center;
    }
    
    .card {
        width: 100%;
        max-width: 500px;
        border-radius: 0.35rem;
        box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15);
        border: none;
        transition: transform 0.3s ease;
    }
    
    .card:hover {
        transform: translateY(-5px);
    }
    
    .card-header {
        background-color: var(--primary-color);
        color: white;
        font-weight: 600;
        border-radius: 0.35rem 0.35rem 0 0 !important;
        padding: 1rem 1.5rem;
    }
    
    .card-body {
        padding: 2rem;
    }
    
    .form-group {
        margin-bottom: 1.5rem;
    }
    
    .form-control {
        border-radius: 0.35rem;
        padding: 0.75rem 1rem;
        border: 1px solid #d1d3e2;
    }
    
    .form-control:focus {
        border-color: var(--primary-color);
        box-shadow: 0 0 0 0.2rem rgba(78, 115, 223, 0.25);
    }
    
    .button {
        background-color: var(--primary-color);
        color: white;
        border: none;
        padding: 0.75rem 1.5rem;
        border-radius: 0.35rem;
        font-weight: 600;
        width: 100%;
        cursor: pointer;
        transition: background-color 0.3s;
    }
    
    .button:hover {
        background-color: var(--accent-color);
    }
    
    .remove-btn {
        background-color: var(--danger-color);
        color: white;
        border: none;
        padding: 0.75rem 1.5rem;
        border-radius: 0.35rem;
        font-weight: 600;
        width: 100%;
        cursor: pointer;
        transition: background-color 0.3s;
        margin-top: 1rem;
    }
    
    .remove-btn:hover {
        background-color: #c0352a;
    }
    
    .alert {
        border-radius: 0.35rem;
        padding: 1rem;
        margin-bottom: 1rem;
    }
    
    .alert-success {
        background-color: #d4edda;
        color: #155724;
        border-color: #c3e6cb;
    }
    
    .password-container {
        margin-top: 0;
    }
    
    @media (max-width: 768px) {
        .form-container {
            flex-direction: column;
        }
        
        .card {
            max-width: 100%;
        }
    }
    
    /* Navbar adjustments */
    .navbar {
        box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15);
        background: #fff;
        padding: 0.5rem 1rem;
    }
    
    .navbar-brand {
        font-weight: 800;
        color: var(--primary-color);
    }
    
    .nav-link {
        color: var(--text-color);
        font-weight: 600;
        padding: 0.5rem 1rem;
    }
    
    .nav-link:hover {
        color: var(--primary-color);
    }
    
    .navbar-toggler {
        border: none;
    }
    
    .navbar-toggler:focus {
        box-shadow: none;
    }
</style>
</head>

<body>
<%@ include file="navbar.jsp" %>

<div class="profile-container">
    <div class="form-container">
        <!-- Profile Update Form -->
        <div class="card">
            <div class="card-header">
                <h4 class="mb-0"><i class="fas fa-user-edit me-2"></i>Update Profile</h4>
            </div>
            <div class="card-body">
                <form action="${cp }/user/updateProfile" method="post">
                    <input type="hidden" name="${csrf_parameterName }" value="${ _csrf.token}" />
                    
                    <div class="form-group">
                        <input type="hidden" class="form-control" id="name" value="${users.id}" name="id" readonly>
                    </div>

                    <div class="form-group">
                        <label for="name" class="form-label">Name:</label>
                        <input type="text" class="form-control" id="name" value="${users.name}" name="name" required>
                    </div>

                    <div class="form-group">
                        <label for="Email" class="form-label">Email:</label>
                        <input type="email" class="form-control" id="email" value="${users.email }" name="email" required>
                    </div>

                    <div class="form-group">
                        <label for="citizenship_no" class="form-label">Citizenship Number:</label>
                        <input type="number" class="form-control" id="citi_no" value="${users.citi_no}" name="citi_no" required>
                    </div>

                    <div class="form-group">
                        <label for="address" class="form-label">Address:</label>
                        <input type="text" class="form-control" id="address" value="${users.address}" name="address" required>
                    </div>

                    <div class="form-group">
                        <label for="age" class="form-label">Age:</label>
                        <input type="number" class="form-control" id="age" value="${users.age}" name="age" required>
                    </div>

                    <div class="form-group">
                        <label for="username" class="form-label">Username:</label>
                        <input type="text" class="form-control" id="username" value="${users.username}" name="username" required>
                    </div>

                    <div class="form-group mt-4">
                        <button type="submit" class="button">
                            <i class="fas fa-save me-2"></i>Update Profile
                        </button>
                    </div>
                </form>
                
                <form action="${cp}/user/deleteAccount/${users.id}" method="post">
                    <button type="submit" class="remove-btn" onclick="return confirm('Are you sure you want to delete your account? This action cannot be undone.')">
                        <i class="fas fa-trash-alt me-2"></i>Delete Account
                    </button>
                </form>
            </div>
        </div>

        <!-- Password Update Form -->
        <div class="card password-container">
            <div class="card-header">
                <h4 class="mb-0"><i class="fas fa-key me-2"></i>Update Password</h4>
            </div>
            <div class="card-body">
                <form action="${cp }/user/updatePassoword/${users.id}" method="post">
                    <input type="hidden" name="${csrf_parameterName }" value="${ _csrf.token}" />
                    
                    <div class="form-group">
                        <label for="password" class="form-label">Current Password:</label>
                        <input type="password" class="form-control" id="password" placeholder="Enter current password" name="password" required>
                    </div>

                    <div class="form-group">
                        <label for="newpassword" class="form-label">New Password:</label>
                        <input type="password" class="form-control" id="newpassword" placeholder="Enter new password" name="newPass" required>
                    </div>

                    <div class="form-group">
                        <label for="conpassword" class="form-label">Confirm Password:</label>
                        <input type="password" class="form-control" id="conpassword" placeholder="Confirm new password" name="conPass" required>
                    </div>

                    <c:if test="${not empty passwordchange}">
                        <div class="alert alert-success">${passwordchange}</div>
                    </c:if>

                    <c:if test="${not empty successPass}">
                        <div class="alert alert-success">${successPass}</div>
                    </c:if>

                    <c:if test="${not empty noChange}">
                        <div class="alert alert-success">${noChange}</div>
                    </c:if>

                    <div class="form-group mt-4">
                        <button type="submit" class="button">
                            <i class="fas fa-lock me-2"></i>Update Password
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>