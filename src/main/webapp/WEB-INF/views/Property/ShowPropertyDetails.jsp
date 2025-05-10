<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Property Details</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600&family=Poppins:wght@400;500&display=swap');

        body {
            background-color: #f4f4f4;
            font-family: 'Poppins', sans-serif;
        }
        .property-container {
            max-width: 700px;
            max-height:700px;
            margin: 0.5px auto;
           padding-top:120px;
            display: flex;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        .property-image {
            flex: 1;
            max-width: 50%;
            height: auto;
        }
        .property-info {
            flex: 1;
            padding: 30px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .property-title {
            font-family: 'Playfair Display', serif;
            font-size: 26px;
            font-weight: 600;
            color: #2c3e50;
            margin-top: 15px;
            text-align: top;
        }
        .detail-item {
            font-size: 18px;
            font-weight: 500;
            color: #34495e;
            padding: 8px 0;
            display: flex;
            align-items: center;
            border-bottom: 1px solid #ddd;
        }
        .detail-item span {
            margin-right: 10px;
            font-size: 20px;
            color: #2980b9;
        }
        .price-tag {
            font-size: 24px;
            font-weight: bold;
            color: #e74c3c;
            text-align: center;
            margin: 20px 0;
        }
        .contact-btn {
            background: #2980b9;
            color: white;
            padding: 12px 18px;
            text-decoration: none;
            border-radius: 6px;
            font-size: 18px;
            font-weight: bold;
            display: block;
            text-align: center;
            transition: 0.3s;
        }
        .contact-btn:hover {
            background: #1f618d;
        }
    </style>
</head>
<%@ include file="../user/navbar.jsp" %>
<body>
    <div class="property-container">
        <img class="property-image" src="${cp}/${pro.imageName}" alt="Property Image">
        <div class="property-info">
            <div class="property-title">Luxury Real Estate Listing</div>
            <div class="detail-item"><span>📍</span> ${pro.location}</div>
            <div class="detail-item"><span>📏</span> ${pro.area} sq.ft</div>
            <div class="detail-item"><span>🏠</span> Category: ${pro.category}</div>
            <div class="detail-item"><span>📝</span> ${pro.description}</div>
            <div class="price-tag">💰 Rs. ${pro.price}</div>
            <a href="${cp}/user/allProperties" class="contact-btn">Back</a>
        </div>
    </div>
</body>
</html>
