<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!-- sidebar.jsp -->
<nav class="admin-sidebar">
  <a href="${cp }/admin/home" class="active"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
  <a href="${cp }/admin/addProperty"><i class="fas fa-building"></i> Properties</a>
  <div class="submenu">
    <a href="${cp }/admin/showProperty"><i class="fas fa-eye"></i> Show Properties</a>
  </div>
  <a href="${cp }/admin/newUser"><i class="fas fa-users"></i> Users</a>
  <a href="#"><i class="fas fa-envelope"></i> Requests</a>
  <div class="submenu">
    <a href="${cp }/admin/requests"><i class="fas fa-plus"></i> New Requests</a>
    <a href="${cp }/admin/responded"><i class="fas fa-check"></i> Responded Requests</a>
  </div>
</nav>

