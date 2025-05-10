<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Profile Management</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<style>
    :root {
        --primary: #4361ee;
        --secondary: #3f37c9;
        --accent: #4895ef;
        --light: #f8f9fa;
        --dark: #212529;
        --danger: #f72585;
        --success: #4cc9f0;
        --border-radius: 12px;
        --box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
    }
    
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    
    body {
        font-family: 'Poppins', sans-serif;
        background-color: #f5f7ff;
        color: var(--dark);
        line-height: 1.6;
        padding-top: 80px; /* Space for fixed navbar */
    }
    
    /* Navbar Styles */
    .navbar {
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        background: white;
        box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
        z-index: 1000;
        padding: 1rem 2rem;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    
    .navbar-brand {
        font-size: 1.5rem;
        font-weight: 700;
        color: var(--primary);
        text-decoration: none;
        display: flex;
        align-items: center;
    }
    
    .navbar-brand i {
        margin-right: 10px;
    }
    
    .nav-links {
        display: flex;
        gap: 1.5rem;
    }
    
    .nav-link {
        color: var(--dark);
        text-decoration: none;
        font-weight: 500;
        transition: all 0.3s ease;
        padding: 0.5rem 1rem;
        border-radius: var(--border-radius);
    }
    
    .nav-link:hover {
        color: var(--primary);
        background-color: rgba(67, 97, 238, 0.1);
    }
    
    /* Main Content */
    .profile-container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 2rem;
    }
    
    .page-header {
        text-align: center;
        margin-bottom: 3rem;
    }
    
    .page-header h1 {
        font-size: 2.5rem;
        color: var(--primary);
        margin-bottom: 1rem;
    }
    
    .page-header p {
        color: #6c757d;
        font-size: 1.1rem;
    }
    
    /* Profile Cards */
    .profile-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
        gap: 2rem;
    }
    
    .profile-card {
        background: white;
        border-radius: var(--border-radius);
        box-shadow: var(--box-shadow);
        overflow: hidden;
        transition: transform 0.3s ease;
    }
    
    .profile-card:hover {
        transform: translateY(-5px);
    }
    
    .card-header {
        background: linear-gradient(135deg, var(--primary), var(--secondary));
        color: white;
        padding: 1.5rem;
        text-align: center;
    }
    
    .card-header h2 {
        font-size: 1.5rem;
        margin-bottom: 0.5rem;
    }
    
    .card-header i {
        font-size: 2rem;
        margin-bottom: 1rem;
        display: block;
    }
    
    .card-body {
        padding: 2rem;
    }
    
    /* Form Elements */
    .form-group {
        margin-bottom: 1.5rem;
    }
    
    .form-group label {
        display: block;
        margin-bottom: 0.5rem;
        font-weight: 500;
        color: var(--dark);
    }
    
    .form-control {
        width: 100%;
        padding: 0.75rem 1rem;
        border: 1px solid #ddd;
        border-radius: var(--border-radius);
        font-family: inherit;
        font-size: 1rem;
        transition: all 0.3s ease;
    }
    
    .form-control:focus {
        outline: none;
        border-color: var(--primary);
        box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.2);
    }
    
    .btn {
        display: inline-block;
        padding: 0.75rem 1.5rem;
        border-radius: var(--border-radius);
        font-weight: 600;
        text-align: center;
        cursor: pointer;
        transition: all 0.3s ease;
        border: none;
        font-family: inherit;
        font-size: 1rem;
    }
    
    .btn-primary {
        background-color: var(--primary);
        color: white;
    }
    
    .btn-primary:hover {
        background-color: var(--secondary);
    }
    
    .btn-danger {
        background-color: var(--danger);
        color: white;
    }
    
    .btn-danger:hover {
        background-color: #e5176e;
    }
    
    .btn-block {
        display: block;
        width: 100%;
    }
    
    .mt-3 {
        margin-top: 1rem;
    }
    
    .mt-4 {
        margin-top: 1.5rem;
    }
    
    /* Alert Messages */
    .alert {
        padding: 1rem;
        border-radius: var(--border-radius);
        margin-bottom: 1.5rem;
    }
    
    .alert-success {
        background-color: rgba(76, 201, 240, 0.2);
        color: #0e7c86;
        border-left: 4px solid var(--success);
    }
    
    /* Responsive Adjustments */
    @media (max-width: 768px) {
        .navbar {
            flex-direction: column;
            padding: 1rem;
        }
        
        .nav-links {
            margin-top: 1rem;
            width: 100%;
            justify-content: space-around;
        }
        
        .profile-grid {
            grid-template-columns: 1fr;
        }
        
        .page-header h1 {
            font-size: 2rem;
        }
    }
</style>
</head>

<body>
<!-- Custom Navbar -->
<nav class="navbar">
    <a href="${cp}" class="navbar-brand">
        <i class="fas fa-user-circle"></i> ProfileManager
    </a>
    <div class="nav-links">
        <a href="${cp}" class="nav-link"><i class="fas fa-home"></i> Home</a>
        <a href="${cp}/user/profile" class="nav-link"><i class="fas fa-user"></i> Profile</a>
        <a href="${cp}/logout" class="nav-link"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>
</nav>

<div class="profile-container">
    <div class="page-header">
        <h1>Manage Your Profile</h1>
        <p>Update your personal information and password securely</p>
    </div>
    
    <div class="profile-grid">
        <!-- Profile Update Card -->
        <div class="profile-card">
            <div class="card-header">
                <i class="fas fa-user-edit"></i>
                <h2>Personal Information</h2>
            </div>
            <div class="card-body">
                <form action="${cp}/user/updateProfile" method="post">
                    <input type="hidden" name="${csrf_parameterName}" value="${_csrf.token}" />
                    <input type="hidden" class="form-control" value="${users.id}" name="id" readonly>
                    
                    <div class="form-group">
                        <label for="name">Full Name</label>
                        <input type="text" class="form-control" id="name" value="${users.name}" name="name" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="email">Email Address</label>
                        <input type="email" class="form-control" id="email" value="${users.email}" name="email" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="citi_no">Citizenship Number</label>
                        <input type="number" class="form-control" id="citi_no" value="${users.citi_no}" name="citi_no" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="address">Address</label>
                        <input type="text" class="form-control" id="address" value="${users.address}" name="address" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="age">Age</label>
                        <input type="number" class="form-control" id="age" value="${users.age}" name="age" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" class="form-control" id="username" value="${users.username}" name="username" required>
                    </div>
                    
                    <button type="submit" class="btn btn-primary btn-block mt-4">
                        <i class="fas fa-save"></i> Update Profile
                    </button>
                </form>
            </div>
        </div>
        
        <!-- Password Update Card -->
        <div class="profile-card">
            <div class="card-header">
                <i class="fas fa-key"></i>
                <h2>Password Settings</h2>
            </div>
            <div class="card-body">
                <form action="${cp}/user/updatePassoword/${users.id}" method="post">
                    <input type="hidden" name="${csrf_parameterName}" value="${_csrf.token}" />
                    
                    <c:if test="${not empty passwordchange}">
                        <div class="alert alert-success">${passwordchange}</div>
                    </c:if>
                    
                    <c:if test="${not empty successPass}">
                        <div class="alert alert-success">${successPass}</div>
                    </c:if>
                    
                    <c:if test="${not empty noChange}">
                        <div class="alert alert-success">${noChange}</div>
                    </c:if>
                    
                    <div class="form-group">
                        <label for="currentPassword">Current Password</label>
                        <input type="password" class="form-control" id="currentPassword" 
                               placeholder="Enter current password" name="password" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="newPassword">New Password</label>
                        <input type="password" class="form-control" id="newPassword" 
                               placeholder="Enter new password" name="newPass" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="confirmPassword">Confirm Password</label>
                        <input type="password" class="form-control" id="confirmPassword" 
                               placeholder="Confirm new password" name="conPass" required>
                    </div>
                    
                    <button type="submit" class="btn btn-primary btn-block mt-3">
                        <i class="fas fa-lock"></i> Change Password
                    </button>
                </form>
                
                <form action="${cp}/user/deleteAccount/${users.id}" method="post" class="mt-4">
                    <button type="submit" class="btn btn-danger btn-block" 
                            onclick="return confirm('⚠️ Warning: This will permanently delete your account. Are you sure?')">
                        <i class="fas fa-trash-alt"></i> Delete My Account
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    // Simple animation for card entrance
    document.addEventListener('DOMContentLoaded', function() {
        const cards = document.querySelectorAll('.profile-card');
        cards.forEach((card, index) => {
            card.style.opacity = '0';
            card.style.transform = 'translateY(20px)';
            card.style.transition = 'all 0.5s ease ' + (index * 0.1) + 's';
            
            setTimeout(() => {
                card.style.opacity = '1';
                card.style.transform = 'translateY(0)';
            }, 100);
        });
    });
</script>
</body>
</html>