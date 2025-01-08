<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="col-md-9 col-sm-12">
    <div class="blk-user-right blk-user-bor full d-block">
		<header>
	        <h1>Lịch sử hóa đơn</h1>
	    </header>
		<div class="table-wrapper table table-hover mt-4">
			<div class="table-responsive d-none d-md-block">
			    <table class="table table-hover">
			        <thead>
			            <tr>
			            	<c:forEach items="${colsHeader}" var="colHeader">
		      		<th>${colHeader}</th>
		      	</c:forEach>
		          <th>Actions</th>
		      </tr>
		  </thead>
		  <tbody>
		  	<c:forEach items="${listOrderModels}" var="orderModel">
		   	<tr>
		           <td>HD<fmt:formatNumber value="${orderModel.maHD}" pattern="0000" /></td>
		           <td>${orderModel.tongTien}</td>
		           <td>${orderModel.ngayDatHang}</td>
		           <td>${orderModel.diaChiGiaoHang}</td>
		           <td>${orderModel.phuongThuc}</td>
		           <td>${orderModel.nguoiNhan}</td>
		           <td>${orderModel.trangThai}</td>
		           <td>
		         	   <button class="btn btn-sm btn-info btn-detail-order" data-id-order="${orderModel.maHD}">Detail</button>
		           </td>
		       </tr>
		  	</c:forEach>
		      
		      <!-- More rows -->
			        </tbody>
			    </table>
			</div>
			<!-- Responsive Cards -->
	            <div class="d-block d-md-none">
	                   	<c:forEach items="${listOrderModels}" var="orderModel">
	                   		<div class="card mb-3">
			                    <div class="card-body">
			                        <h5 class="card-title">Order ID: HD<fmt:formatNumber value="${orderModel.maHD}" pattern="0000" /></h5>
			                        <p class="card-text">
			                            <strong>Tổng tiền:</strong> ${orderModel.tongTien}<br>
			                            <strong>Ngày đặt hàng:</strong> ${orderModel.ngayDatHang}<br>
			                            <strong>Trạng thái:</strong> ${orderModel.trangThai} <br>
				                        <strong>Địa chỉ giao hàng:</strong> ${orderModel.diaChiGiaoHang}<br>
				                        <strong>Phương thức:</strong> ${orderModel.phuongThuc} <br>
				                        <strong>Người nhận:</strong> ${orderModel.nguoiNhan}<br>
			                        </p>
			                        <div>
	                                    <button class="btn btn-sm btn-info btn-detail-order" data-id-order="${orderModel.maHD}">Detail</button>
			                            
		                        	</div>
		                    	</div>
	                		</div>
	                   	</c:forEach>
	                <!-- More cards -->
	            </div>
		</div>
	</div>
</div>
   <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/orderHistoryJS.js"></script>