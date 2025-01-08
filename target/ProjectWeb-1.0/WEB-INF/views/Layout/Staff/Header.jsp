<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
    
<!-- Header -->
    <div class="header">
        <div class="logo">Quản lý cửa hàng phụ kiện thời trang</div>
        <div class="user-profile">
            <span><c:out value="${sessionScope.user.hoTen}" default="Staff"/></span>
            <img src="https://www.w3schools.com/w3images/avatar2.png" alt="User Profile">
        </div>
        <i class="fas fa-bars menu-toggle"></i>
    </div>