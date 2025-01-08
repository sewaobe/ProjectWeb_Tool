<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix = "frm" %>

 <!-- Content -->
    <div class="content">
        <div class="d-flex justify-content-between align-items-center mb-3">
	        <h3 id="content-title">${titleTable}</h3>
    	</div>
        <div class="tab-content">
		<c:forEach items="${statusList}" var="status">
		    <a class="btn 
		        ${status == 'Chờ xác nhận' ? 'btn-outline-warning' : 
		          status == 'Đã xác nhận' ? 'btn-outline-info' : 
		          status == 'Đang vận chuyển' ? 'btn-outline-primary' : 
		          status == 'Đã vận chuyển' ? 'btn-outline-success' : 
		          status == 'Đã hủy' ? 'btn-outline-danger' : 'btn-outline-danger'}" 
		        href="?status=${status}">
		        ${status}
		    </a>
		</c:forEach>

            
        </div>
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
	                            <td>${orderModel.maNguoiDung}</td>
	                            <td>${orderModel.tongTien}</td>
	                            <td>${orderModel.ngayDatHang}</td>
	                            <td>${orderModel.trangThai}</td>
  	                            <td>${orderModel.diaChiGiaoHang}</td>
  	                            <td>${orderModel.phuongThuc}</td>
  	                            <td>${orderModel.nguoiNhan}</td>
   	                            <td>${orderModel.ghiChu}</td>
	                            <td>
	                                <button class="btn btn-sm btn-success btn-view-order">View</button>
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
		                            <strong>Người gửi:</strong> ${orderModel.maNguoiDung}<br>
		                            <strong>Tổng tiền:</strong> ${orderModel.tongTien}<br>
		                            <strong>Ngày đặt hàng:</strong> ${orderModel.ngayDatHang}<br>
		                            <strong>Trạng thái:</strong> ${orderModel.trangThai} <br>
			                        <strong>Địa chỉ giao hàng:</strong> ${orderModel.diaChiGiaoHang}<br>
			                        <strong>Phương thức:</strong> ${orderModel.phuongThuc} <br>
			                        <strong>Người nhận:</strong> ${orderModel.nguoiNhan}<br>
			                        <strong>Ghi chú:</strong> ${orderModel.ghiChu}<br>
		                        </p>
		                        <div>
		                            <button class="btn btn-sm btn-success btn-view-order">View</button>
                                    <button class="btn btn-sm btn-info btn-detail-order" data-id-order="${orderModel.maHD}">Detail</button>
		                            
	                        	</div>
	                    	</div>
                		</div>
                   	</c:forEach>
                <!-- More cards -->
            </div>
        </div>

		<!-- Modal Template -->
		<div class="modal fade" id="orderModal" tabindex="-1" aria-labelledby="orderModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="orderModalLabel">Thông tin chi tiết đơn hàng</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <!-- Form using Spring Form Tag -->
		        <frm:form id="orderForm" method="post" action="staff/updateOrder" modelAttribute="orderModel">
		            <div id="modalOrderContent">Loading order details...</div>
		            
		            <!-- Các input ẩn để gửi dữ liệu tới controller -->
		            <frm:hidden path="maHD" id="orderMaHD" />
		            <frm:hidden path="maNguoiDung" id="orderMaNguoiDung" />
		            <frm:hidden path="tongTien" id="orderTongTien" />
		            <frm:hidden path="ngayDatHang" id="orderNgayDatHang" />
		            <frm:hidden path="diaChiGiaoHang" id="orderDiaChiGiaoHang" />
		            <frm:hidden path="phuongThuc" id="orderPhuongThuc" />
		            <frm:hidden path="nguoiNhan" id="orderNguoiNhan" />
		            <frm:hidden path="ghiChu" id="orderGhiChu" />
		            
		            <div class="form-group">
		                <label for="orderStatus" style="display: none;"></label>
		                <frm:select path="trangThai" id="orderStatus" class="form-select" style="display: none;">
		                    <frm:option value="Chờ xác nhận" label="Chờ xác nhận" />
		                    <frm:option value="Đã xác nhận" label="Đã xác nhận" />
		                    <frm:option value="Đang vận chuyển" label="Đang vận chuyển" />
		                    <frm:option value="Đã vận chuyển" label="Đã vận chuyển" />
		                    <frm:option value="Đã hủy" label="Đã hủy" />
		                </frm:select>
		            </div>
		        </frm:form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-success btn-save" id="saveOrderBtn">Save</button>
		      </div>
		    </div>
		  </div>
		</div>


		        
    </div>
   <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/orderJS.js"></script>