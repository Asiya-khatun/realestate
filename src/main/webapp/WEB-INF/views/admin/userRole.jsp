<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User List</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- FontAwesome CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${cp}/assets/css/admin.css">

    <style>
        /* Body Styling */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f7fa;
            margin: 0;
            padding: 0;
            display: flex;
        }

        h1 {
            text-align: center;
            color: #2c3e50;
            margin: 40px 0 20px;
        }

        

        /* Content Styling */
        .content {
            margin-left: 250px;
            margin-top: 80px; /* Space for navbar */
            padding: 20px;
            flex: 1;
        }

        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            padding: 20px;
            max-width: 1400px;
            margin: auto;
        }

        .user-box {
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.08);
            width: 300px;
            margin: 15px;
            padding: 25px 30px;
            transition: transform 0.3s ease;
        }

        .user-box:hover {
            transform: translateY(-5px);
        }

        .user-box h4 {
            margin-bottom: 20px;
            text-align: center;
            font-size: 22px;
            color: #27ae60;
            border-bottom: 1px solid #eee;
            padding-bottom: 10px;
        }

        .user-details {
            list-style-type: none;
            padding: 0;
        }

        .user-details li {
            font-size: 16px;
            margin: 10px 0;
            color: #444;
            display: flex;
            align-items: center;
        }

        .user-details li i {
            color: #27ae60;
            margin-right: 10px;
            width: 20px;
        }

       

            .content {
                margin-left: 200px;
            }

            .user-box {
                width: 100%;
                max-width: 90%;
            }
        }
        /* Sidebar Styling */
.sidebar {
    position: fixed;
    top: 0;
    left: 0;
    height: 100%;
    width: 250px; /* Sidebar width */
    background-color: #007bff;  /* Blue Color for Sidebar */
    color: white;
    padding-top: 20px;
    padding-left: 10px;
}

.navbar {
    position: fixed;
    top: 0;
    left: 250px; /* Start after the sidebar */
    width: calc(100% - 250px); /* Remaining space for navbar */
    background-color: #007bff;  /* Blue Color for Navbar */
    color: white;
    padding: 10px 20px;
}
        
    </style>
</head>
<body>
    <%@ include file="sidebar.jsp" %>

    <%@ include file="navbar.jsp" %>

    <div class="content">
        <h1>User List</h1>

        <div class="container">
            <c:forEach items="${users}" var="user">
                <c:if test="${user.userRole.role != 'ROLE_ADMIN' }">
                    <div class="user-box">
                        <h4>${user.username}</h4>
                        <ul class="user-details">
                            <li><i class="fas fa-envelope"></i>Email: ${user.email}</li>
                            <li><i class="fas fa-map-marker-alt"></i>Address: ${user.address}</li>
                            <li><i class="fas fa-user"></i>Age: ${user.age}</li>
                            <li><i class="fas fa-id-card"></i>Citizenship No: ${user.citi_no}</li>
                        </ul>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </div>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
