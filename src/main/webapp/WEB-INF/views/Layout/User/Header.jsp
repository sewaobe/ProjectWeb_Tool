<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<header class="header sty-none">
            <div class="header-top">
                <div class="container">
                    <div class="row">
                        <div class="col text-right">
                            <p>
                                <span style="font-size:14px;">
                                    <a href="#">HỆ THỐNG CỬA HÀNG</a>
                                </span>
                            </p>
                            <p>
                                <span style="font-size:14px;">
                                    <a href="#" style="font-size:14px;">VỀ TAURUSSHOP</a>
                                </span>
                            </p>
                            <p>
                                <span style="font-size:14px;">
                                    <a href="#" style="font-size:14px;">TUYỂN DỤNG</a>
                                </span>
                            </p>
                            <p></p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="header-content top">
                <div class="container">
                    <div class="row align-center">
                        <div class="head-col-left col-lg-3 col-12">
                            <div class="js-menu-svg d-inline-flex align-items-center  justify-content-center d-lg-none">
                                <img src="https://web.nvnstatic.net/tp/T0299/img/svg/menu-trans.svg?v=3" alt="Open navagation">
                            </div>
                            <a href="/ProjectWeb/user" class="logo">
                                <img src="https://dynamic.design.com/preview/logodraft/3e36c2a0-a761-4dcc-a46c-218d888caf57/image/large.png" alt="Logo">
                            </a>
                        </div>
                        <div class="head-col-center col-lg-6 d-none d-lg-block">
                            <form class="form-search" action="/ProjectWeb/user/search" method="get">
                                <div class="input-group">
                                    <input type="text" class="form-control" name="q" placeholder="Tìm kiếm sản phẩm">
                                    <span class="input-group-btn">
                                        <button class="btn btn-pink" type="submit">
                                            <i class="fa fa-search"></i>
                                        </button>
                                    </span>
                                </div>
                            </form>
                            
                        </div>
                        <div class="head-col-right col-lg-3 col-12">
                            <div class="header-right d-flex align-items-start">
                                <ul class="header-user d-none d-md-block">
                                    <li>
                                        <a href="/ProjectWeb/user/profile">Tài khoản | </a>
                                    </li>
                                    <li>
                                        <a href="/ProjectWeb/user/signout">Thoát</a>
                                    </li>
                                </ul>
                                <a href="/ProjectWeb/user/profile" class="js-open-user d-md-none">
                                    <img src="https://web.nvnstatic.net/tp/T0299/img/svg/user.svg?v=3" alt="">
                                </a>
                                <div class="count-cart" title="Giỏ hàng">
                                    <div class="count-cart-icon">
                                        <span class="count d-flex align-items-center justify-content-center">${sessionScope.productsCart.size()}</span>
                                    </div>
                                    <div id="js-rs-mini-cart" class="mini-shopping-cart">
                                        <ul class="mini-list-product">
										    <c:set var="totalAmount" value="0" /> 
                                        	<c:forEach items="${productsCart}" var="productCart">
                                        	
                                        		<li class="shopping-cart-item d-inline-flex">
                                                <figure class="item-image">
                                                    <a href="/ProjectWeb/product?q=${productCart.maSP}" title="${productCart.ten}">
                                                        <img class="img-responsive" src="${pageContext.request.contextPath}${productCart.hinhAnh}" alt="${productCart.ten}">
                                                    </a>
                                                </figure>
                                                <div class="item-content">
                                                    <h4 class="item-title">
                                                        <a href="/ProjectWeb/product?q=${productCart.maSP}" title="${productCart.ten}" title="${productCart.ten}">${productCart.ten}                                                      </a>
                                                    </h4>
                                                    <span class="item-price">Đơn giá:
                                                         <fmt:formatNumber value="${productCart.gia}" pattern="#,###" />đ                                                  </span>
                                                </div>
                                                <div class="item-action">
                                                    <span class="item-quantity">x${productCart.soLuongGioHang}</span>
                                                    <div class="js-remove-item" data-psId="${productCart.maSP}">
                                                        <i class="fa fa-trash"></i>
                                                    </div>
                                                </div>
                                            </li>
                                                    <c:set var="totalAmount" value="${totalAmount + productCart.gia * productCart.soLuongGioHang}" />
                                            
                                        	</c:forEach>
										                                        
                                        
                                            
                                          
                                        </ul>
                                        <div class="mini-shopping-cart__bottom">
                                            <div class="shopping-cart__bottom-total d-flex justify-content-between">
                                                <span>Thành tiền</span>
                                                <span class="shopping-cart-total-amount"><fmt:formatNumber value="${totalAmount}" pattern="#,###" />đ</span>
                                            </div>
                                            <a class="btn btn-lg btn-pink full" href="/ProjectWeb/cart">Xem giỏ hàng</a>
                                        </div>
                                    </div>
                                    <!----- end mini-cart ---->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="fr-mobile container d-block d-lg-none">
                    <form class="form-search xs" action="/ProjectWeb/user/search" method="get">
                        <div class="input-group">
                            <input list="nameProduct" type="text" class="form-control" name="q" placeholder="Tìm kiếm sản phẩm">
                            <datalist id="nameProduct">
                            	<c:forEach items="${productNames}" var="productName">
        							<option value="${productName}">
                            	</c:forEach>
					       </datalist>
                            <span class="input-group-btn">
                                <button class="btn btn-pink" type="submit">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                        </div>
                    </form>
                    
                </div>
            </div>
            <div class="navagation">
                <div class="js-menu-close d-flex align-items-center justify-content-between d-lg-none">
                    <span>
                        <img src="https://web.nvnstatic.net/tp/T0299/img/svg/menu.svg?v=3" alt="Close navagation">Menu
                    </span>
                    <img src="https://web.nvnstatic.net/tp/T0299/img/svg/close.svg?v=3" alt="Close navagation">
                </div>
                <div class="container js-container">
                    <div class="row">
                        <ul class="col flex justify-content-between">
                            <li class="header-item">
                                <a href="/ProjectWeb/product?c=tat-ca&page=1">Tất cả sản phẩm</a>
                             </li>
                             <li class="header-item">
                                <a href="/ProjectWeb/product?c=trang-suc&page=1">Trang sức </a>
                             </li>
                             <li class="header-item">
                                 <a href="/ProjectWeb/product?c=khan&page=1">Khăn </a>
                             </li>
                             <li class="header-item">
                                 <a href="/ProjectWeb/product?c=mu&page=1">Mũ nón/mũ len </a>
                             </li>
                             <li class="header-item">
                                 <a href="/ProjectWeb/product?c=gang-tay&page=1">Găng tay </a>
                             </li>
                             <li class="header-item">
                                 <a href="/ProjectWeb/product?c=bit-tai-len&page=1">Bịt tai len </a>
                             </li>
                             <li class="header-item">
                                 <a href="/ProjectWeb/product?c=dep&page=1">Dép </a>
                             </li>
                             <li class="header-item">
                                 <a href="/ProjectWeb/product?c=phu-kien-toc-bang-do&page=1">Phụ kiện tóc, băng đô </a>
                             </li>
                             <li class="header-item">
                                 <a href="/ProjectWeb/product?c=kinh&page=1">Kính mát, gọng kính </a>
                             </li>
                             <li class="header-item">
                                 <a href="/ProjectWeb/product?c=tat&page=1">Tất vớ </a>
                             </li>
                           
                             
                             <li class="header-item">
                                 <a href="/ProjectWeb/product?c=giay-that-lung&page=1">Giày/thắt lưng </a>
                             </li>
                            
                           
                        </ul>
                    </div>
                </div>
                <div class="nava-mask d-lg-none"></div>
            </div>
        </header>
		        
		<div class="toast-container position-fixed top-0 end-0 p-3" style="z-index: 10000;">
		    
		</div>



        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/headerUserJS.js"></script>
        