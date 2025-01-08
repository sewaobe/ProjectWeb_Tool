<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<style>
        @media (max-height: 767px) {
            .table-cart thead th:first-child {
                width: 10% !important;
            }
            .cart-item .cart-img img {
                width: 100%;
            }
        }
</style>
<div class="container">
        <div class="row">
            <div class="cart-page col-12">
                <table class="table table-cart">
                    <thead>
                        <th width="20%">
                            <i class="d-none fa fa-pink fa-1x5 fa-check-square"></i> Sản phẩm
                        </th>
                        <th width="25%" class="text-center">Mô tả</th>
                        <th width="15%" class="text-center d-none d-md-table-cell">Đơn giá</th>
                        <th width="15%" class="text-center d-none d-md-table-cell">Số lượng</th>
                        <th width="15%" class="text-center d-none d-md-table-cell">Tổng</th>
                        <th width="10%" class="text-center d-none d-md-table-cell">Thao tác</th>
                    </thead>
                    <tbody>
		                   
           				<c:set var="totalAmount" value="0" /> 
                        <c:forEach items="${productsCart}" var="productCart">
                        	<tr class="cart-item" data-psId="${productCart.maSP}">
                            <td class="cart-img">
                                <div class="d-flex align-items-center">
                                    <i class="d-none fa fa-pink fa-1x5 fa-check-square"></i>
                                    <a href="/ProjectWeb/product?q=${productCart.maSP}" title="${productCart.ten}">
                                        <img data-sizes="auto" class="lazyload" src="https://web.nvnstatic.net/img/lazyLoading.gif?v=3" data-src="${pageContext.request.contextPath}${productCart.hinhAnh}" alt="${productCart.ten}">
                                    </a>
                                </div>
                            </td>
                            <td class="text-center">
                                <a href="/ProjectWeb/product?q=${productCart.maSP}" title="${productCart.ten}">${productCart.ten}                              </a>
                            </td>
                            <td class="text-center d-none d-md-table-cell">
                                <strong class="price d-block"><fmt:formatNumber value="${productCart.gia}" pattern="#,###" />đ     </strong>
                            </td>
                            <td class="text-center d-none d-md-table-cell">
                                <div class="blk-qty d-flex justify-content-center align-items-center">
                                            <div data-label="cart" class="blk-qty-btn minus d-flex justify-content-center align-items-center">-</div>
                                            <input class="updateCart blk-qty-input d-flex justify-content-center align-items-center" type="text" data-psId="${productCart.maSP}" max="${productCart.soLuongTonKho}" min="1" value="${productCart.soLuongGioHang}">
                                            <div data-label="cart" class="blk-qty-btn plus d-flex justify-content-center align-items-center">+</div>
                                </div>
                            </td>
                            <td class="text-center d-none d-md-table-cell">
                                <strong class="totalPriceProduct"><fmt:formatNumber value="${productCart.gia * productCart.soLuongGioHang}" pattern="#,###" />đ</strong>
                            </td>
                            <td class="text-center d-none d-md-table-cell">
                                <a class="remove-cart" href="javascript:void(0)" data-psId="${productCart.maSP}">Xóa</a>
                            </td>
                        </tr>
                          <c:set var="totalAmount" value="${totalAmount + productCart.gia * productCart.soLuongGioHang}" />
                        
                        </c:forEach>
                    </tbody>
                </table>
                <c:if test="${empty productsCart }">
	               	<div class="d-flex justify-content-center align-items-center flex-column" style="height: 50vh;">
	                    <h2 class="text-center">Không có sản phẩm</h2>
	                    <p class="text-center">Vui lòng quay lại sau hoặc thêm sản phẩm vào giỏ hàng của bạn!</p>
	                    <a href="/ProjectWeb/product?c=tat-ca&page=1" class="btn btn-primary">Quay lại trang chủ</a>
	               	</div>
                </c:if>
                <div class="note">
                    <p>Lưu ý:</p>
                    <p>Đơn hàng trên website được xử lý trong giờ hành chính</p>
                    <p>Đơn hàng TAURUSSHOP không đồng kiểm khi giao hàng. Khách hàng vui lòng quay video khi bóc hàng để được hỗ trợ tốt nhất nếu xảy ra vấn đề  </p>
                </div>
                <div class="cart-total text-right">
                    <div class="d-block">
                        Tổng: <strong class="total"><fmt:formatNumber value="${totalAmount}" pattern="#,###" />đ</strong>
                    </div>
                    <div class="clearfix"></div>
                    <a class="btn btn-lg btn-pink btn-radius" href="product?c=tat-ca&page=1">Tiếp tục mua sắm</a>
                    <c:if test="${not empty productsCart }">
                    	<a class="btn btn-lg btn-outline-pink btn-radius" href="cart/checkout">Thanh toán</a>
                    </c:if>
                    	
                </div>
            </div>
            <jsp:include page="../Fragments/ProductSeen.jsp"></jsp:include>
        </div>
    </div>
    
 <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/cartUserJS.js">
 
 </script>