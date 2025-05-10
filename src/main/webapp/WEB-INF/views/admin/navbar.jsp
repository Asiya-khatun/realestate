<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!-- navbar.jsp -->
<nav class="navbar navbar-expand-lg navbar-dark admin-navbar">
  <div class="container-fluid">
    <a class="navbar-brand" href="${cp }/admin/home">Admin:${user.name }</a>
    <div class="d-flex align-items-center">
      <span class="navbar-text text-white me-3">
        Welcome, <strong>${user.name}</strong>
      </span>
      <a href="${cp }/logout" class="btn btn-outline-light btn-sm">Logout</a>
    </div>
  </div>
</nav>
