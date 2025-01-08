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
		<%-- <c:forEach items="${statusList}" var="status">
		    <a class="btn 
		        ${status == 'Chờ xác nhận' ? 'btn-outline-warning' : 
		          status == 'Đã xác nhận' ? 'btn-outline-info' : 
		          status == 'Đang vận chuyển' ? 'btn-outline-primary' : 
		          status == 'Đã vận chuyển' ? 'btn-outline-success' : 
		          status == 'Đã hủy' ? 'btn-outline-danger' : 'btn-outline-danger'}" 
		        href="?status=${status}">
		        ${status}
		    </a>
		</c:forEach> --%>

            
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
                    	<c:forEach items="${listCustomerModel}" var="customerModel">
	                    	<tr>
	                            <td>CS<fmt:formatNumber value="${customerModel.maNguoiDung}" pattern="0000" /></td>
	                            <td>${customerModel.hoTen}</td>
	                            <td>${customerModel.email}</td>
	                            <td>${customerModel.sdt}</td>
  	                            <td>${customerModel.ngaySinh}</td>
  	                            <td>${customerModel.diaChi}</td>
	                            <td>
                					<button class="btn btn-sm btn-danger btn-delete" data-customer-id="${customerModel.maNguoiDung}" data-customer-name = "${customerModel.hoTen}">Delete</button>
	                            </td>
	                        </tr>
                    	</c:forEach>
                        
                        <!-- More rows -->
                    </tbody>
                </table>
            </div>
        
            <!-- Responsive Cards -->
            <div class="d-block d-md-none">
                   	<c:forEach items="${listCustomerModel}" var="customerModel">
                   		<div class="card mb-3">
		                    <div class="card-body">
		                        <h5 class="card-title">Customer ID: HD<fmt:formatNumber value="${customerModel.maNguoiDung}" pattern="0000" /></h5>
		                        <p class="card-text">
		                            <strong>Họ tên khách hàng:</strong> ${customerModel.hoTen}<br>
		                            <strong>Email:</strong> ${customerModel.email}<br>
		                            <strong>SDT:</strong> ${customerModel.sdt}<br>
		                            <strong>Ngày sinh:</strong> ${customerModel.ngaySinh} <br>
			                        <strong>Địa chỉ:</strong> ${customerModel.diaChi}<br>
			                        
		                        </p>
		                        <div>
                					<button class="btn btn-sm btn-danger btn-delete" data-customer-id="${customerModel.maNguoiDung}" data-customer-name = "${customerModel.hoTen}">Delete</button>
	                        	</div>
	                    	</div>
                		</div>
                   	</c:forEach>
                <!-- More cards -->
            </div>
        </div>

		<!-- Modal Confirm Delete -->
		<div class="modal fade" id="confirmDeleteModal" tabindex="-1" aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="confirmDeleteModalLabel">Xác nhận xóa khách hàng</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-danger" id="confirmDeleteBtn">Confirm</button>
		      </div>
		    </div>
		  </div>
		</div>



		        
    </div>
   <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/customerJS.js"></script>