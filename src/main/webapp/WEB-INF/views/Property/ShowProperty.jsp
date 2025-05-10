<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Property List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${cp}/assets/css/admin.css">

    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #eef5f9; 
            color: #333;
            margin: 0;
            padding: 0;
        }

        h2 {
            font-size: 28px;
            color: #2c3e50;
            text-align: center;
            margin-bottom: 30px;
            font-weight: 700;
        }

        /* Sidebar Styling */
        .sidebar {
            position: fixed;
            top: 0;
            left: 0;
            width: 250px;
            height: 100%;
            background-color: #333;
            padding-top: 20px;
        }

        .sidebar a {
            color: white;
            padding: 15px;
            text-decoration: none;
            display: block;
        }

        .sidebar a:hover {
            background-color: #575757;
        }

        /* Main Content Styling */
        .main-content {
            margin-left: 250px; /* Sidebar width */
            padding: 30px;
            margin-top: 60px; /* Space for navbar */
            overflow-y: auto; /* Allows scrolling within the content */
        }

        /* Table Container */
        .table-container {
            display: flex;
            justify-content: right;
            align-items: right;
            margin-top: 20px;
        }

        table {
            width: 82%;
            border-collapse: collapse;
            background: #ffffff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.15);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        table:hover {
            transform: translateY(-3px);
            box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.2);
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background: #4CAF50;
            color: #fff;
            font-size: 16px;
            text-transform: uppercase;
        }

        td {
            font-size: 14px;
        }

        tr:hover {
            background-color: #f5f5f5;
        }

        button, .btn {
            padding: 10px 15px;
            font-size: 14px;
            border-radius: 5px;
            border: none;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
        }

        .btn-success {
            background: #28a745;
            color: white;
        }

        .btn-success:hover {
            background: #218838;
            transform: scale(1.05);
        }

        .btn-danger {
            background: #dc3545;
            color: white;
        }

        .btn-danger:hover {
            background: #c82333;
            transform: scale(1.05);
        }

        img {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 6px;
            border: 2px solid #ddd;
            transition: transform 0.3s ease;
        }

        img:hover {
            transform: scale(1.1);
        }

        @media (max-width: 768px) {
            table {
                width: 100%;
            }

            th, td {
                font-size: 12px;
                padding: 10px;
            }

            h2 {
                font-size: 24px;
            }

            button {
                padding: 8px 12px;
                font-size: 12px;
            }

            .sidebar {
                width: 200px;
            }

            .main-content {
                margin-left: 200px;
            }
        }
    </style>
</head>
<body>
    <%@ include file="../admin/navbar.jsp"%>
    <%@ include file="../admin/sidebar.jsp" %>

    <div class="main-content">
        <h2 align="center">List of Properties</h2>

        <div class="table-container">
            <table>
                <tr>
                    <th>Location</th>
                    <th>Total Area</th>
                    <th>Category</th>
                    <th>Description</th>
                    <th>Images</th>
                    <th>Total Price</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>

                <c:forEach items="${properties}" var="pro">
                    <tr>
                        <td>${pro.location}</td>
                        <td>${pro.area} sq.ft</td>
                        <td>${pro.category}</td>
                        <td>${pro.description}</td>
                        <td>
                            <img src="${cp}/${pro.imageName}" alt="${pro.imageName}" width="100" height="100" />
                        </td>
                        <td>RS: ${pro.price}</td>
                        <td>
                            <a href="${cp}/admin/edit/${pro.id}" class="btn btn-success">Edit</a>
                        </td>
                        <td>
                            <form action="${cp}/admin/deleteProperty/${pro.id}" method="post">
                            <button type="submit" class="remove-btn" onclick="return confirm('Are you sure you want to remove this item?')">Delete</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
