<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix = "frm" %>

 <!-- Content -->
 
<div class="col-md-9 col-sm-12">
	<div class="blk-user-right blk-user-bor full d-block">
	<header>
        <h1>Lịch sử chi tiết hóa đơn</h1>
    </header>
	     <div class="table-wrapper table table-hover mt-4">
	         <div class="table-responsive d-none d-md-block">
	             <table class="table table-hover">
	                 <thead>
	                     <tr>
	                     	<c:forEach items="${colsHeader}" var="colHeader">
	                     		<th>${colHeader}</th>
	                     	</c:forEach>
	                     </tr>
	                 </thead>
	                 <tbody>
	                 	<c:forEach items="${listProductModels}" var="productModel">
	                  	<tr>
	                          <td>SP<fmt:formatNumber value="${productModel.maSP}" pattern="0000" /></td>
	                   			<td><img src="${pageContext.request.contextPath}${productModel.hinhAnh}" alt="${productModel.ten}" style="max-width: 100px; max-height: 100px; object-fit: cover;" /></td>
	                          <td>${productModel.ten}</td>
	                          <td>${productModel.gia}</td>
	                          <td>${productModel.soLuongTonKho}</td>
	                          <td>${productModel.loaiSanPham}</td>
	                          <td>${productModel.createdAt}</td>
	                          <td>${productModel.updatedAt}</td>
	                          
	                      </tr>
	                 	</c:forEach>
	                     
	                     <!-- More rows -->
	                 </tbody>
	             </table>
	         </div>
	     
	         <!-- Responsive Cards -->
	         <div class="d-block d-md-none">
	                	<c:forEach items="${listProductModels}" var="productModel">
	                		<div class="card mb-3">
	                   <div class="card-body">
	                       <h5 class="card-title">Product ID: SP<fmt:formatNumber value="${productModel.maSP}" pattern="0000" /></h5>
	                       <p class="card-text">
	                  			    <strong>Hình ảnh:</strong> <img src="${pageContext.request.contextPath}${productModel.hinhAnh}" alt="${productModel.ten}" style="max-width: 100px; max-height: 100px; object-fit: cover;" /><br>
	                           <strong>Tên sản phẩm:</strong> ${productModel.ten}<br>
	                           <strong>Giá:</strong> ${productModel.gia}<br>
	                           <strong>Số lượng tồn kho:</strong> ${productModel.soLuongTonKho} <br>
	                        <strong>Loại sản phẩm:</strong> ${productModel.loaiSanPham} <br>
	                        <strong>Thời gian tạo:</strong> ${productModel.createdAt}<br>
	                        <strong>Thời gian chỉnh sửa:</strong> ${productModel.updatedAt}<br>
	                       </p>
	                       
	                  	</div>
	             		</div>
	                	</c:forEach>
	             <!-- More cards -->
	         </div>
	     </div>
	</div>
</div>