<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix = "frm" %>
<c:set var="categoryMap" value="${{'Trang sức' : 'trang-suc', 'Khăn' : 'khan', 'Mũ' : 'mu', 'Găng tay' : 'gang-tay', 'Bịt tai len' : 'bit-tai-len', 'Dép' : 'dep', 'Phụ kiện tóc' : 'phu-kien-toc', 'Kính' : 'kinh', 'Tất' : 'tat', 'Giày thắt lưng' : 'giay-that-lung'}}" />
<style>
    /* Tùy chỉnh các kiểu gạch chân */
    .underline-style-1 {
        text-decoration: underline solid #ff5733; /* Gạch chân kiểu sóng, màu cam */
    }
    .underline-style-2 {
        text-decoration: underline solid #28a745; /* Gạch chân kiểu chấm, màu xanh lá */
    }
    .underline-style-3 {
        text-decoration: underline solid #007bff; /* Gạch chân kiểu đôi, màu xanh dương */
    }
    .underline-style-4 {
        text-decoration: underline solid #ffc107; /* Gạch chân kiểu gạch đứt, màu vàng */
    }
    .underline-style-5 {
        text-decoration: underline solid #dc3545; /* Gạch chân nét liền, màu đỏ */
    }
    .category-btn {
        width: auto; /* Kích thước động theo nội dung */
        margin-right: 10px; /* Khoảng cách giữa các nút */
        font-size: 14px; /* Kích thước văn bản */
    }
</style>
 <!-- Content -->
    <div class="content">
        <div class="d-flex justify-content-between align-items-center mb-3">
	        <h3 id="content-title">${titleTable}</h3>
	        <button id="createNewInvoice" class="btn btn-primary">Tạo mới sản phẩm</button>
    	</div>
        <div class="tab-content">	
		<c:forEach var="category" items="${categoryList}" varStatus="status">
            <a href="?category=${categoryMap[category]}" 
               class="btn btn-light category-btn underline-style-${status.index % 5 + 1}">
                ${category}
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
	                            <td>
									<button class="btn btn-sm btn-success btn-view-product" 
									        data-product-id="${productModel.maSP}" 
									        data-product-name="${productModel.ten}" 
									        data-product-description="${productModel.moTa}" 
									        data-product-price="${productModel.gia}" 
									        data-product-stock="${productModel.soLuongTonKho}" 
									        data-product-image="${pageContext.request.contextPath}${productModel.hinhAnh}" 
									        data-product-category="${productModel.loaiSanPham}">
									    View
									</button>
									<button class="btn btn-sm btn-danger btn-delete btn-delete-product" 
									        data-product-id="${productModel.maSP}" 
									        data-product-name="${productModel.ten}" 
									        data-product-description="${productModel.moTa}" 
									        data-product-price="${productModel.gia}" 
									        data-product-stock="${productModel.soLuongTonKho}" 
									        data-product-image="${pageContext.request.contextPath}${productModel.hinhAnh}" 
									        data-product-category="${productModel.loaiSanPham}">
									    Delete
									</button>
	                            </td>
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
		                        <div>
									<button class="btn btn-sm btn-success btn-view-product" 
									        data-product-id="${productModel.maSP}" 
									        data-product-name="${productModel.ten}" 
									        data-product-description="${productModel.moTa}" 
									        data-product-price="${productModel.gia}" 
									        data-product-stock="${productModel.soLuongTonKho}" 
									        data-product-image="${pageContext.request.contextPath}${productModel.hinhAnh}" 
									        data-product-category="${productModel.loaiSanPham}">
									    View
									</button>
									<button class="btn btn-sm btn-danger btn-delete btn-delete-product" 
									        data-product-id="${productModel.maSP}" 
									        data-product-name="${productModel.ten}" 
									        data-product-description="${productModel.moTa}" 
									        data-product-price="${productModel.gia}" 
									        data-product-stock="${productModel.soLuongTonKho}" 
									        data-product-image="${pageContext.request.contextPath}${productModel.hinhAnh}" 
									        data-product-category="${productModel.loaiSanPham}">
									    Delete
									</button>
	                        	</div>
	                    	</div>
                		</div>
                   	</c:forEach>
                <!-- More cards -->
            </div>
        </div>

		<!-- Modal Template -->
		<div class="modal fade" id="productModal" tabindex="-1" aria-labelledby="productModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <h5 class="modal-title" id="productModalLabel">Thông tin chi tiết sản phẩm</h5>
		                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		            </div>
		            <div class="modal-body">
		                <!-- Form using Spring Form Tag -->
		                <frm:form id="productForm" method="POST" action="/ProjectWeb/staff/updateProduct" enctype="multipart/form-data" modelAttribute="productModel">
		                    <!-- Mã sản phẩm -->
		                    <div class="form-group">
		                        <label for="productId">Mã sản phẩm</label>
		                        <frm:input path="maSP" id="productId" class="form-control" readonly="true" />
		                    </div>
		
		                    <div class="form-group">
		                        <label for="productName">Tên sản phẩm</label>
		                        <frm:input path="ten" id="productName" class="form-control" />
		                    </div>
		                    <div class="form-group">
		                        <label for="productDescription">Mô tả</label>
		                        <frm:textarea path="moTa" id="productDescription" class="form-control"></frm:textarea>
		                    </div>
		                    <div class="form-group">
		                        <label for="productPrice">Giá</label>
		                        <frm:input path="gia" id="productPrice" class="form-control" />
		                    </div>
		                    <div class="form-group">
		                        <label for="productStock">Số lượng tồn kho</label>
		                        <frm:input path="soLuongTonKho" id="productStock" class="form-control" />
		                    </div>
		
		                    <!-- Thêm input file cho hình ảnh -->
		                    <div class="form-group">
							    <label for="productImage">Hình ảnh</label>
							    <input name="file" id="productImage" type="file" class="form-control" />
							    <frm:input type="hidden" id="hiddenProductImage" path="hinhAnh" value="${pageContext.request.contextPath}${productModel.hinhAnh}" />
							    
							    <!-- Thêm thẻ img để hiển thị hình ảnh đã chọn -->
							    <img id="imagePreview" src="" alt="Image Preview" style="display:none; max-width: 150px; margin-top: 10px;" />
							</div>

		
		                    <div class="form-group">
							    <label for="productCategory">Loại sản phẩm</label>
							    <frm:select path="loaiSanPham" id="productCategory" class="form-control">
							        <frm:option value="trang-suc">Trang sức</frm:option>
							        <frm:option value="khan">Khăn</frm:option>
							        <frm:option value="mu">Mũ</frm:option>
							        <frm:option value="gang-tay">Găng tay</frm:option>
							        <frm:option value="bit-tai-len">Bịt tai len</frm:option>
							        <frm:option value="dep">Dép</frm:option>
							        <frm:option value="phu-kien-toc">Phụ kiện tóc</frm:option>
							        <frm:option value="kinh">Kính</frm:option>
							        <frm:option value="tat">Tất</frm:option>
							        <frm:option value="giay-that-lung">Giày thắt lưng</frm:option>
							    </frm:select>
							</div>

		                </frm:form>
		            </div>
		            <div class="modal-footer">
		                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
		                <button type="submit" class="btn btn-success btn-save" id="saveProductBtn">Save</button>
		            </div>
		        </div>
		    </div>
		</div>




		        
    </div>
   <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/productJS.js"></script>