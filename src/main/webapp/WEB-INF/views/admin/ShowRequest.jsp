<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>All Requests</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${cp}/assets/css/admin.css">

    <style>
      body {
    font-family: 'Roboto', sans-serif;
    background-color: white; /* Set to white instead of gray */
    margin: 0;
    padding: 0;
    display: flex;
    min-height: 100vh;
    flex-direction: column;
}

.sidebar {
    width: 350px; 
    background-color: #34495e; /* Keep sidebar color */
    color: white;
    position: fixed;
    height: 100%;
    top: 60px; /* Offset for the navbar */
    left: 0;
    padding: 20px;
    box-shadow: 2px 0 6px rgba(0, 0, 0, 0.1);
}

.main-content {
    margin-left: 350px; /* Sidebar width */
    margin-top: 60px; /* Adjusted for navbar height */
    padding: 20px;
    display: flex;
    flex-direction: column;
    flex: 1;
    max-width: calc(100% - 350px); /* Adjust for sidebar width */
    background-color: white;
    /* No more large gap between the content and sidebar */
}

h2 {
    text-align: center;
    color: #34495e;
    font-family: 'Lora', serif;
    font-size: 32px;
    margin-bottom: 30px;
    text-transform: uppercase;
    letter-spacing: 1.5px;
}

.requests-container {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
    gap: 30px;
    max-width: 1200px;
    margin: 0 auto;
}


        .card {
            background: #ffffff;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.12);
            transition: all 0.3s ease-in-out;
            position: relative;
            border-left: 5px solid #3498db;
        }

        .card:hover {
            transform: translateY(-4px);
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.18);
        }

        .card-header {
            font-size: 22px;
            font-weight: bold;
            color: #2c3e50;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .card-header i {
            font-size: 24px;
            color: #3498db;
        }

        .card-body {
            padding-top: 10px;
            font-size: 16px;
            color: #444;
            margin-top: 10px;
        }

        .card-body p {
            margin: 8px 0;
        }

        .property-details {
            background: #ecf0f1;
            border-radius: 8px;
            padding: 15px;
            margin: 15px 0;
            font-size: 14px;
            color: #333;
        }

        .actions {
            display: flex;
            justify-content: space-between;
            margin-top: 15px;
        }

        .btn {
            padding: 10px 16px;
            border-radius: 8px;
            font-size: 15px;
            cursor: pointer;
            text-decoration: none;
            transition: all 0.3s ease;
            flex: 1;
            text-align: center;
            font-weight: bold;
        }

        .btn i {
            margin-right: 6px;
        }

        .accept-btn {
            background: #2ecc71;
            color: white;
            border: none;
        }

        .accept-btn:hover {
            background: #27ae60;
            transform: scale(1.05);
        }

        .decline-btn {
            background: #e74c3c;
            color: white;
            border: none;
        }

        .decline-btn:hover {
            background: #c0392b;
            transform: scale(1.05);
        }

        .status {
            position: absolute;
            top: 10px;
            right: 15px;
            padding: 6px 14px;
            font-size: 13px;
            font-weight: bold;
            border-radius: 20px;
            color: white;
        }

        .status.pending {
            background: #f1c40f;
            color: #333;
        }

        .status.approved {
            background: #2ecc71;
        }

        .status.declined {
            background: #e74c3c;
        }
    </style>
</head>
<body>
    <%@ include file="navbar.jsp" %>
    
        <%@ include file="sidebar.jsp" %>

    <div class="main-content">
        <h2>All Visit Requests</h2>
        
        <div class="requests-container">
            <c:forEach items="${request}" var="req">
                <div class="card">
                    <!-- Status Badge and Request Details -->
                    <c:choose>
                        <c:when test="${req.status == 'PENDING'}">
                            <span class="status pending">Pending</span>
                        </c:when>
                        <c:when test="${req.status == 'APPROVED'}">
                            <span class="status approved">Approved</span>
                        </c:when>
                        <c:when test="${req.status == 'DECLINED'}">
                            <span class="status declined">Declined</span>
                        </c:when>
                    </c:choose>
                    
                    <div class="card-header">
                        <i class="la la-user"></i> ${req.user.username}
                    </div>

                    <div class="card-body">
                        <p><strong>Email:</strong> ${req.user.email}</p>
                        <p><strong>Citizenship No:</strong> ${req.user.citi_no}</p>
                        <div class="property-details">
                            <p><strong>Property ID:</strong> ${req.property.id}</p>
                            <p><strong>Location:</strong> ${req.property.location}</p>
                            <p><strong>Price:</strong> Rs: ${req.property.price}</p>
                        </div>
                    </div>

                    <div class="actions">
                        <form action="${cp}/admin/accept/${req.req_id}" method="post">
                            <button type="submit" class="btn accept-btn"><i class="la la-check"></i>Approve</button>
                        </form>

                        <form action="${cp}/admin/decline/${req.req_id}" method="post">
                            <button type="submit" class="btn decline-btn"><i class="la la-times"></i>Decline</button>
                        </form>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
