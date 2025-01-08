<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<main class="mains blk-pro-cat sty-none">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="d-pro-head">
                            <h1>${titleContent}</h1>
                            <select onchange="window.location.href = this.value" class="form-control d-none d-xl-block">
                                <option selected value="2?">Mới nhất</option>
                                <option value="/product?show=priceAsc">Giá tăng dần</option>
                                <option value="/product?show=priceDesc">Giá giảm dần</option>
                            </select>
                        </div>
                        <div class="clearfix"></div>
                        <div class="js-open-filter">
                            <i class="fa fa-filter d-block"></i>
                            Filter
                        </div>
                        <div class="product-list">
	                        <c:if test="${empty listProduct }">
	                            	<div class="d-flex justify-content-center align-items-center flex-column" style="height: 50vh;">
		                                <h2 class="text-center">Không có sản phẩm</h2>
		                                <p class="text-center">Vui lòng quay lại sau hoặc thêm sản phẩm vào giỏ hàng của bạn!</p>
		                                <a href="/ProjectWeb/product" class="btn btn-primary">Quay lại trang chủ</a>
	                            	</div>
	                            
	                        </c:if>
                            <div id="rs-js-product" class="row">
                            
                            <c:forEach items="${listProduct}" var="product">
                             	<div class="product-item item${product.maSP} col-xl-3 col-md-4 col-6 col-xxs-12" data-psid="${product.maSP}">
                                    <div class="image">
                                        <span class="flag">New</span>
                                        <a href="/ProjectWeb/product?q=${product.maSP}&c=${product.loaiSanPham}" title="${product.ten}">
                                            <img data-sizes="auto" class="lazyload" src="https://web.nvnstatic.net/img/lazyLoading.gif?v=3" data-src="${pageContext.request.contextPath}${product.hinhAnh}" alt="${product.ten}">
                                        </a>
                                        <div class="product-action d-flex align-center justify-content-center">
                                            <div class="wish" data-psId="${product.maSP}"></div>
                                            <div class="js-add-cart" data-psId="${product.maSP}" data-root="-2"></div>
                                        </div>
                                    </div>
                                    <h3 class="name">
                                        <a href="/ProjectWeb/product?q=${product.maSP}&c=${product.loaiSanPham}" title="${product.ten}">${product.ten}                                        </a>
                                    </h3>
                                    <div class="product-price">
                                        <span class="price">	<fmt:formatNumber value="${product.gia}" pattern="#,###" />đ</span>
                                    </div>
                                </div>
                            </c:forEach>
                               
                                
                            </div>
                        </div>
                        <!-- Phân trang -->
					    <div class="d-block full text-center">
					        <ul class="pagination justify-content-center">
					            <c:forEach begin="1" end="${totalPages}" var="i">
					                <li class="page-item ${i == currentPage ? 'active' : ''}">
					                    <a class="page-link" href="/ProjectWeb/product?c=${category != null ? category : 'tat-ca'}&page=${i}">${i}</a>
					                </li>
					            </c:forEach>
					
					            <!-- Nút Next -->
					            <c:if test="${currentPage < totalPages}">
					                <li class="page-item">
					                    <a class="page-link" href="/ProjectWeb/product?c=${category != null ? category : 'tat-ca'}&page=${currentPage+1}">Next</a>
					                </li>
					            </c:if>
					        </ul>
					    </div>
                    </div>
                </div>
            </div>
        </main>
        
        
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/productUserJS.js">


</script>