<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Sidebar -->
    <div class="sidebar">
        <a href="/ProjectWeb/staff" class="menu-item " data-category="orders">Đơn hàng</a>
        <a href="/ProjectWeb/staff/products" class="menu-item" data-category="products">Sản phẩm</a>
        <a href="/ProjectWeb/staff/customers" class="menu-item" data-category="customers">Khách hàng</a>
        <a href="/ProjectWeb/user" class="menu-item" data-category="user">Chuyển sang khách hàng</a>
        <a href="/ProjectWeb/user/signout" class="menu-item" data-category="user">Đăng xuất</a>
        
    </div>
    
    
    <script type="text/javascript">
    
	    document.addEventListener("DOMContentLoaded", function () {
	        // Lấy tất cả các phần tử có lớp menu-item
	        const menuItems = document.querySelectorAll(".menu-item");
	
	        // Lấy URL hiện tại
	        const currentUrl = window.location.pathname;
	
	        // Xác định mục nào nên active dựa trên URL
	        menuItems.forEach(item => {
	            const href = item.getAttribute("href");
	            if (currentUrl === href) {
	                item.classList.add("active");
	            } else {
	                item.classList.remove("active");
	            }
	        });
	    });


    </script>