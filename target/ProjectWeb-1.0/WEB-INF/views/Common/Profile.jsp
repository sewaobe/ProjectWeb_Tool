<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="frm" %>

<main class="mains main-user sty-none">
    <div class="container">
        <div class="row">
            <div class="col-breadcrumb col-md-12">
                <ul class="breadcrumb">
                    <li class="breadcrumb-item">
                        <a href="/ProjectWeb/user">Trang chủ</a>
                    </li>
                    <li class="breadcrumb-item">
                        <a href="/ProjectWeb/user/profile">Thông tin tài khoản</a>
                    </li>
                    <li class="breadcrumb-item active">Hồ sơ</li>
                </ul>
            </div>
            <div class="blk-user col-md-12">
                <div class="row">
                    <div class="col-md-3 col-sm-12">
                        <div class="blk-user-left blk-user-bor full d-block text-center">
                            <div class="blk-user-avatar">
                                <img src="https://web.nvnstatic.net/tp/T0299/img/avatar.png?v=3" alt="avatar">
                                <h2>Tài khoản</h2>
                            </div>
                            <div class="blk-user-nav">
                                <ul class="text-left">
                                    <li><a href="/ProjectWeb/user/profile" class="menu-item active">Thông tin tài khoản</a></li>
                                    <li><a href="/ProjectWeb/user/profile/changepassword" class="menu-item">Đổi mật khẩu</a></li>
                                    <li><a href="/ProjectWeb/user/order" class="menu-item">Lịch sử đơn hàng</a></li>
                                    <li><a href="/ProjectWeb/user/wishlist" class="menu-item">Sản phẩm yêu thích</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <jsp:include page="../${contextProfile}"></jsp:include>
                </div>
            </div>
        </div>
    </div>
</main>
   <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/profileJS.js"></script>