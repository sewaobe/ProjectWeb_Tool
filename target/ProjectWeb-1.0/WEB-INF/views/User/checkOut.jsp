<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix = "frm" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="checkout-page container sty-none">
        <frm:form id="formCheckOut" class="formCheckOut formAcount validate" method="post" modelAttribute="user" action="checkout">
            <div class="row">
                <div class="col-checkout col-left col-xl-4 col-lg-6 col-12">
                    <h2 class="col-title">
                            <span class="d-inline-flex align-items-center justify-content-center">1</span>
                            Thông tin người nhận
                        </h2>
                    <div class="form-group">
                        <frm:input id="customerName" path="hoTen" type="text" class="form-control input-sm "  placeholder="Họ tên *"/>
                    </div>
                    <div class="form-group">
                        <frm:input id="customerMobile" path="sdt" type="text" class="form-control input-sm "  placeholder="Điện thoại *"/>
                    </div>
                    <div class="form-group">
                        <frm:input id="customerEmail" path="email" type="text" class="form-control input-sm"  placeholder="Email *"/>
                    </div>
                    <div class="form-group">
                        <frm:input type="text" id="customerAddress" path="diaChi"  class="form-control input-sm" placeholder="Địa chỉ chi tiết *"/>
                    </div>
                    
                    <div class="form-group">
                        <textarea type="text" id="description" name="ghiChu" class="form-control input-sm" rows="3 " placeholder="Ghi chú"></textarea>
                    </div>
                    <div>Đơn hàng trên website được xử lý trong giờ hành chính</div>
                    <div>Vui lòng liên hệ fanpage ngoài khung giờ trên để được hỗ trợ</div>
                    <div>Đơn hàng TAURUSSHOP không đồng kiểm khi giao hàng. Khách hàng vui lòng quay video khi bóc hàng để được hỗ trợ tốt nhất nếu xảy ra vấn đề  </div>
                    
                </div>
                <div class="col-checkout col-center col-xl-3 col-lg-6 col-12">
                    <h2 class="col-title">
                            <span class="d-inline-flex align-items-center justify-content-center">2</span>
                            Phương thức thanh toán
                        </h2>
                    <div class="d-block item">
                        <label class="form-check-label">
                            <input type="radio" value="1" name="paymentMethod" class="form-check-input" />
                            <div class="d-block" data-toggle="collapse" data-target="#p-online" aria-expanded="true">Chuyển khoản trước toàn bộ tiền hàng </div>
                        </label>
                        <div id="p-online" class="col-pay alert alert-warning collapse in show">
                            <p>
                                <span style="font-size:14px;">
                                        <span style="font-family:arial, helvetica, sans-serif;">
                                            <span style="text-indent:10px;">Với phương thức Chuyển khoản trước toàn bộ tiền hàng, bộ phận CSKH sẽ gọi điện đến bạn để xác nhận đơn hàng và hướng dẫn cách thức thanh toán chuyển khoản</span>
                                </span>
                                </span>
                            </p>
                        </div>
                    </div>
                    <div class="d-block item">
                        <label class="form-check-label">
                            <input type="radio" value="0" name="paymentMethod" checked class="form-check-input" />
                            <div class="d-block" data-toggle="collapse" data-target="#p-cod" aria-expanded="true">Thanh toán khi nhận hàng </div>
                        </label>
                        <div id="p-cod" class="col-pay alert alert-warning collapse in show">
                            <p>
                                <span style="font-family:arial, helvetica, sans-serif;">
                                        <span style="font-size:14px;">Thanh toán khi nhận hàng (COD) chỉ áp dụng cho các đơn hàng ở các quận/huyện dưới đây thuộc Hà Nội/TP.HCM:</span>
                                </span>
                            </p>
                            <p style="font-family:'Roboto Condensed', Arial, sans-serif;font-size:15px;margin:0px;padding:5px 0px;">
                                <span style="font-family:arial, helvetica, sans-serif;">
                                        <span style="font-size:14px;">+ Hà Nội: Quận Hoàn Kiếm, Ba Đình, Đống Đa, Hoàng Mai, Hai Bà Trưng, Cầu Giấy, Thanh Xuân, </span>
                                <span style="font-size:14px;">Tây Hồ, Từ Liêm, Hà Đông, Long Biên, Gia Lâm, Sơn Tây, Ba Vì, Mê Linh, Đông Anh, Thường Tín, Thanh Trì</span>
                                </span>
                            </p>
                            <p style="font-family:'Roboto Condensed', Arial, sans-serif;font-size:15px;margin:0px;padding:5px 0px;">
                                <span style="font-family:arial, helvetica, sans-serif;">
                                        <span style="font-size:14px;">+ HCM: Quận 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, Tân Bình, Tân Phú, Phú Nhuận, Bình Thạnh, Gò Vấp, </span>
                                <span style="font-size:14px;">Bình Tân, Thủ Đức, Bình Chánh, Nhà Bè, Hooc M</span>
                                <span style="font-size:14px;">ôn</span>
                                </span>
                            </p>
                            <p style="font-family:'Roboto Condensed', Arial, sans-serif;font-size:15px;margin:0px;padding:5px 0px;">
                                <span style="font-family:arial, helvetica, sans-serif;">
                                        <span style="font-size:14px;"></span>
                                </span>
                            </p>
                        </div>
                    </div>
                    <input type="hidden" id="baokimBankPaymentMethodId" name="baokimBankPaymentMethodId" />
                </div>
                <div class="col-checkout col-right col-xl-5 col-lg-12 col-12">
                    <h2 class="col-title">
                            <span class="d-inline-flex align-items-center justify-content-center">3</span>
                            Thông tin giỏ hàng
                        </h2>
                    <div class="table-responsive scrollModal">
                        <table class="table table-checkout" border="0" cellspacing="10">
                            <thead>
                                <tr>
                                    <th class="text-left" width="55%">Tên sản phẩm</th>
                                    <th class="text-center" width="20%">Số lượng</th>
                                    <th class="text-right" width="25%">Thành tiền</th>
                                </tr>
                            </thead>
                            <tbody>
							    <c:set var="totalAmount" value="0" /> 
                            	<c:forEach items="${productsCart}" var="productCart" >
                            		<tr class="cartItem" data-psId="${productCart.maSP}">
	                                    <td>
	                                        <a href="/ProjectWeb/product?q=${productCart.maSP}">${productCart.ten}                      </a>
	                                        <div class="clearfix">
	                                            Đơn giá:
	                                            <strong><fmt:formatNumber value="${productCart.gia}" pattern="#,###" />đ</strong>
	                                            <div class="d-block"></div>
	                                        </div>
	                                    </td>
	                                    <td class="text-center">${productCart.soLuongGioHang}</td>
	                                    <td class="text-center">
	                                        <strong><fmt:formatNumber value="${productCart.gia*productCart.soLuongGioHang}" pattern="#,###" />đ</strong>
	                                    </td>
                                	</tr>
                	                <c:set var="totalAmount" value="${totalAmount + productCart.gia * productCart.soLuongGioHang}" />
                                	
                            	</c:forEach>
                                
                                
                            </tbody>
                        </table>
                        <table class="table table-checkout" border="0" cellspacing="10">
                            <tfoot>
                                <tr>
                                    <td colspan="2">
                                        <strong>Tạm tính</strong>
                                    </td>
                                    <td><fmt:formatNumber value="${totalAmount}" pattern="#,###" />đ</td>
                                </tr>
                                <tr>
                                    <td colspan="2">Phí vận chuyển</td>
                                    <td id="shipFee" value="0">0 đ</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <strong>Mã giảm giá</strong>
                                    </td>
                                    <td id="txtCode" value="0">0 đ</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <strong>Tổng cộng</strong>
                                    </td>
                                    <td id="showTotalMoney" class="totalPrice" data-total="${totalAmount}"><fmt:formatNumber value="${totalAmount}" pattern="#,###" />đ
                                    </td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                    <!-- Sử dụng mã giảm giá -->
                    <div class="formCode form-group">
                        <strong class="d-block">Nhập mã ưu đãi</strong>
                        <div class="input-group">
                            <input type="text" id="coupon" name="couponCode" class="form-control" placeholder="Mã giảm giá">
                            <div class="input-group-btn">
                                <button class="btn btn-pink" id="getCoupon" type="button">Áp dụng </button>
                            </div>
                        </div>
                    </div>
                    
                    <div id="mss-confirm"></div>
                    <div class="d-block text-right">
                        <div id="js-btn-submit" class="btn btn-pink">Thanh toán</div>
                    </div>
                </div>
            </div>
        </frm:form>
        <jsp:include page="../Fragments/ProductSeen.jsp"></jsp:include>
    </div>
   
    <script type="text/javascript">
document.addEventListener("DOMContentLoaded", function () {
		
	    document.getElementById('js-btn-submit').addEventListener('click', function() {
	    	var formattedDate = new Date().toISOString().slice(0, 19).replace('T', ' ');

	    	// Chuyển chuỗi thành đối tượng Date và chuyển trực tiếp sang ISO 8601 (không cần tạm biến)
	    	let isoDateString = new Date(formattedDate.replace(" ", "T")).toISOString().split('.')[0];

	    	
	    	const orderData = {
	    			maNguoiDung: "${sessionScope.user.maNguoiDung}",
	                tongTien: document.getElementById('showTotalMoney').getAttribute('data-total'),
	                ngayDatHang: isoDateString,
	                trangThai: 'Chờ xác nhận',
	                diaChiGiaoHang: document.getElementById('customerAddress').value,
	                phuongThuc: document.querySelector('input[name="paymentMethod"]:checked').value,
	                nguoiNhan: document.getElementById('customerName').value,
	                ghiChu: document.getElementById('description').value
	            };
	    	
			
	            // Fetch request để gửi OrderModel lên backend
	            fetch('checkout', {
	                method: 'POST',
	                headers: {
	                    'Content-Type': 'application/json'
	                },
	                body: JSON.stringify(orderData)
	            })
	            .then(response => {
	            	if (!response.ok) {
	                    throw new Error('Network response was not ok');
	                }
	                return response.text();
	            }) // Giả sử backend trả về JSON
	            .then(data => {
	            	if (data.includes('User/index')) {
						showToast("Thành công", "Đặt hàng thành công!", "success");

	                    // Có thể thực hiện chuyển hướng nếu cần
	                    window.location.href = '/ProjectWeb/user/message';

	                } else {
	                    alert('Đã xảy ra lỗi. Vui lòng thử lại!');
	                }

	            })
	            .catch(error => {
	                console.error('Error:', error);
					showToast("Thành công", "Đặt hàng thất bại!", "error");

	            });
	    });
    });
    </script>