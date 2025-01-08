<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>	

<div class="col-md-9 col-sm-12">
    <div class="blk-user-right blk-user-bor full d-block">
        <header>
            <h1>Sản Phẩm Yêu Thích</h1>
            <div class="content">
                Hãy <i class="fa fa-heart pink"></i>
                sản phẩm bạn yêu thích để xem thuận tiện hơn
            </div>
        </header>
        <div class="product-list">
            <div class="row">
            	<c:forEach items="${productList}" var="product">
            		<div class="product-item item${product.maSP} col-lg-3 col-md-4 col-6 col-xxs-12" data-psId="${product.maSP}">
	                    <div class="image">
	                        <span class="flag">New</span>
	                        <a href="/ProjectWeb/product?q=${product.maSP}&c=${product.loaiSanPham}" title="${product.ten}">
	                            <img data-sizes="auto" class="lazyload" src="https://web.nvnstatic.net/img/lazyLoading.gif?v=3" data-src="${pageContext.request.contextPath}${product.hinhAnh}" alt="${product.ten}">
	                        </a>
	                        <div class="product-action d-flex align-center justify-content-center">
	                            <div class="wish active" data-psId="${product.maSP}"></div>
	                            <div class="js-add-cart" data-psId="${product.maSP}" data-root="-2"></div>
	                        </div>
	                    </div>
	                    <h3 class="name">
	                        <a href="/ProjectWeb/product?q=${product.maSP}&c=${product.loaiSanPham}" title="${product.ten}">${product.ten}                                               </a>
	                    </h3>
	                    <div class="product-price">
	                        <span class="price"><fmt:formatNumber value="${product.gia}" pattern="#,###" />đ</span>
	                    </div>
                	</div>
            	</c:forEach>
                
                
            </div>
        </div>
        <div class="col text-center">
            <a href="/ProjectWeb/product?page=1" class="btn btn-pink">Tiếp tục mua sắm</a>
        </div>
    </div>
</div>