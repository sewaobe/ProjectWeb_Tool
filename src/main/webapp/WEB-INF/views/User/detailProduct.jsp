<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<main class="mains">
            <div class="container">
                <div class="row">
                    <div class="col-breadcrumb col-sm-12">
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="&#x2F;">Trang chủ</a>
                            </li>
                           
                            <li class="breadcrumb-item">
                                <a class="362868" href="&#x2F;trang-suc-pc362868.html">${titleContent}</a>
                            </li>
                           
                        </ul>
                    </div>
                    <div class="blk-pview-img col-lg-6 col-md-12 col-sm-12">
                        <a id="js-gall" href="${pageContext.request.contextPath}${product.hinhAnh} " data-toggle="lightbox" data-gallery="gallery">
                            <img id="js-pview-uri" src="${pageContext.request.contextPath}${product.hinhAnh} " alt="${product.ten}">
                        </a>
                        <div id="js-list-lightbox" class="d-none"></div>
                        
                    </div>
                    <div class="blk-pview-info col-lg-6 col-md-12 col-sm-12">
                        <div class="blk-code">
                            <h1 class="title">${product.ten}</h1>
                        </div>
                        <div class="blk-action d-inline-flex pull-right">
                            <div class="b-ac shares">
                                <i class="fa fa-share-alt"></i>
                            </div>
                            <div class="b-ac wish" data-psId="${product.maSP}">
                                <i class="fa fa-heart-o"></i>
                            </div>
                            <div class="share-icon d-block full clearfix">
                                <strong>Chia sẻ đến:</strong>
                                <a href="#">
                                    <i class="fa fa-facebook"></i>
                                </a>
                            </div>
                        </div>
                        <div class="blk-price">
                            <div class="product-price">
                                <span class="price"><fmt:formatNumber value="${product.gia}" pattern="#,###" />đ</span>
                            </div>
                        </div>
                        <div class="blk-att" data-label="Màu sắc, size sản phẩm">
                            
                            <div class="r-at-r d-flex align-items-center">
                                <label class="pull-left">Số lượng</label>
                                <div class="pull-left">
                                    <div class="blk-qty d-flex justify-content-center align-items-center">
                                        <div class="blk-qty-btn minus d-flex justify-content-center align-items-center">-</div>
                                        <input class="blk-qty-input d-flex justify-content-center align-items-center" type="text" id="quantity" max="${product.soLuongTonKho}" min="1" value="1">
                                        <div class="blk-qty-btn plus d-flex justify-content-center align-items-center">+</div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="r-at-r d-sm-flex align-items-center clearfix" data-label="btn">
                                <div id="addToCart" class="btn-js-add-cart btn btn-pink" data-psId="${product.maSP}" data-selId="${product.maSP}" data-ck="0" title="Bạn vui lòng chọn màu sắc, kích thước!">Thêm vào giỏ hàng</div>
                                <div id="addPayNow" class="btn-js-add-cart btn btn-pink" data-psId="${product.maSP}" data-selId="${product.maSP}" data-ck="0" title="Bạn vui lòng chọn màu sắc, kích thước!">Mua ngay</div>
                            </div>
                            <div id="mss-alret"></div>
                        </div>
                        <div class="blk-policy full clearfix">
                            <div class="row">
                                <div data-label="shipping" class="item col-lg-4 col-md-4 col-sm-12 col-xs-12 d-flex align-items-center">
                                    <p>Giao hàng toàn quốc đơn hàng từ 99k</p>
                                </div>
                                <div data-label="cod" class="item col-lg-4 col-md-4 col-sm-12 col-xs-12 d-flex align-items-center">COD nội thành HN, HCM                        </div>
                                <div data-label="24h" class="item col-lg-4 col-md-4 col-sm-12 col-xs-12 d-flex align-items-center">Đổi trả trong 24h                        </div>
                            </div>
                        </div>
                        <div class="blk-policy policy-shipping-support full clearfix br-t-0 mt-0">
                            <div class="row">
                                <div data-label="ship_policy" class="item col-12 d-flex align-items-center pt-0 mt-0">
                                    <p>Hỗ trợ ship 20k cho đơn hàng từ 300k nội thành HN, HCM</p>
                                    <p>Hỗ trợ ship 30k cho đơn hàng từ 500k các khu vực khác</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end blk-pview-info -->
                    <div class="col-lg-12 col-md-12 col-sm-12" data-label="Nội dung sản phẩm">
                        <div class="blk-pview-content full clearfix">
                            <div class="blk-pview-title">Mô tả sản phẩm</div>
                            <div class="content full clearfix">${product.moTa}</div>
                        </div>
                    </div>
                    <!-- Các sản phẩm đã xem -->
                    <jsp:include page="../Fragments/ProductSeen.jsp"></jsp:include>
                </div>
            </div>
        </main>
        
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function () {
	//Product
	
    const product = {
            maSP: ${product.maSP},
            ten: "${product.ten}",
            gia: ${product.gia},
            hinhAnh: "${pageContext.request.contextPath}${product.hinhAnh}",
            soLuongTonKho: ${product.soLuongTonKho},
            moTa: "${product.moTa}"
        };

        
    // Lấy phần tử chứa biểu tượng fa-share-alt
    const shareButton = document.querySelector(".b-ac.shares");
    
    // Lấy thẻ share-icon
    const shareIcon = document.querySelector(".share-icon");

    // Gắn sự kiện click cho nút chia sẻ
    shareButton.addEventListener("click", function () {
        // Toggle (thêm hoặc gỡ) class "open"
        shareIcon.classList.toggle("open");
    });
    
    
    //===============================Plus + Minus
    	
    const minusButton = document.querySelector(".blk-qty-btn.minus");
    const plusButton = document.querySelector(".blk-qty-btn.plus");
    const quantityInput = document.getElementById("quantity");
    // Xử lý sự kiện click nút trừ
    minusButton.addEventListener("click", function () {
        // Lấy giá trị hiện tại và giá trị tối thiểu
        let currentValue = parseInt(quantityInput.value);
        const minValue = parseInt(quantityInput.min);

        // Giảm giá trị, nhưng không vượt quá giới hạn min
        if (currentValue > minValue) {
            quantityInput.value = currentValue - 1;
        }
        else{
        	
        	alert('Số lượng không được dưới 1');
        }
    });

    // Xử lý sự kiện click nút cộng
    plusButton.addEventListener("click", function () {
        // Lấy giá trị hiện tại và giá trị tối đa
        let currentValue = parseInt(quantityInput.value);
        const maxValue = parseInt(quantityInput.max);
        // Tăng giá trị, nhưng không vượt quá giới hạn max
        if (currentValue < maxValue) {
            quantityInput.value = currentValue + 1;
        }
		else{
        	
			alert('Chúng tôi chỉ còn ' +maxValue+ ' sản phẩm. Vui lòng chọn số lượng phù hợp.');
        }
    });

    // Đảm bảo người dùng nhập trực tiếp trong input vẫn tuân thủ min-max
    quantityInput.addEventListener("input", function () {
        let currentValue = parseInt(quantityInput.value);
        const minValue = parseInt(quantityInput.min);
        const maxValue = parseInt(quantityInput.max);

        // Nếu giá trị vượt quá min-max, tự động điều chỉnh lại
        if (currentValue < minValue) {
            quantityInput.value = minValue;
        	alert('Số lượng không được dưới 1');

        } else if (currentValue > maxValue) {
            quantityInput.value = maxValue;
			alert('Chúng tôi chỉ còn ' +maxValue+ ' sản phẩm. Vui lòng chọn số lượng phù hợp.');

        }
    });
    
    //===================nút yêu thích
    const wishButton = document.querySelector(".b-ac.wish");
    wishButton.addEventListener("click", function() {
    	const isActive = wishButton.classList.toggle("active"); // Toggle trạng thái active
    	
        // Xác định hành động (thêm hoặc xóa)
        const action = isActive ? "addToWishlist" : "removeFromWishlist";

        fetch('/ProjectWeb/product?v='+action, {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify({ idProduct: product.maSP }),
        })
            .then((response) => {
                if (response.ok) {
                    return response.json();
                } else {
                    throw new Error(
                        isActive
                            ? "Có lỗi xảy ra khi thêm vào danh sách yêu thích."
                            : "Có lỗi xảy ra khi xóa khỏi danh sách yêu thích."
                    );
                }
            })
            .then((data) => {
                // Xử lý thành công
				showToast("Thành công", data.message || (isActive ? "Đã thêm vào yêu thích!" : "Đã xóa khỏi yêu thích!"), "success");
            })
            .catch((error) => {
                // Xử lý lỗi
                console.error(error);
				showToast("Lỗi",  (isActive ? "Không thể thêm sản phẩm vào danh sách yêu thích. Vui lòng thử lại." : "Không thể xóa sản phẩm khỏi danh sách yêu thích. Vui lòng thử lại."), "error");

            });
		
    });
    
    //======================Nút thêm vào giỏ hàng và mua ngay
    const cartButton = document.querySelector("#addToCart");
    const payButton = document.querySelector("#addPayNow");
    cartButton.addEventListener("click", function() {
        const idProduct = parseInt(cartButton.getAttribute("data-psid"), 10);

        let data = {
            idProduct: idProduct,
            soLuong: quantityInput.value
        }

        // Gửi yêu cầu POST để thêm sản phẩm vào giỏ hàng
        fetch('/ProjectWeb/product/cart', {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(data),
        })
        .then((response) => {
            if (response.ok) {
                return response.json();
            } else {
                throw new Error("Có lỗi xảy ra khi thêm vào giỏ hàng.");
            }
        })
        .then((data) => {
            // Xử lý thành công khi thêm sản phẩm vào giỏ hàng
			showToast("Thành công", "Đã thêm vào giỏ hàng!", "success");

            // Cập nhật lại giỏ hàng trong header
            updateMiniCart(data);
        })
        .catch((error) => {
            console.error(error);
			showToast("Lỗi", "Không thể thêm sản phẩm khỏi giỏ hàng. Vui lòng thử lại.", "error");
        });
    });
    payButton.addEventListener("click", function() {
        const idProduct = parseInt(cartButton.getAttribute("data-psid"), 10);

        let data = {
            idProduct: idProduct,
            soLuong: quantityInput.value
        }

        // Gửi yêu cầu POST để thêm sản phẩm vào giỏ hàng
        fetch('/ProjectWeb/product/cart', {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(data),
        })
        .then((response) => {
            if (response.ok) {
                return response.json();
            } else {
                throw new Error("Có lỗi xảy ra khi thêm vào giỏ hàng.");
            }
        })
        .then((data) => {
            // Xử lý thành công khi thêm sản phẩm vào giỏ hàng
			showToast("Thành công", "Đã thêm vào giỏ hàng!", "success");

            // Cập nhật lại giỏ hàng trong header
            updateMiniCart(data);
            window.location.href = '/ProjectWeb/cart';
        })
        .catch((error) => {
            console.error(error);
			showToast("Lỗi", "Không thể thêm sản phẩm khỏi giỏ hàng. Vui lòng thử lại.", "error");
        });
    });

    // Hàm cập nhật giỏ hàng trong header
    function updateMiniCart(data) {
        const miniCart = document.getElementById("js-rs-mini-cart");
        const productList = miniCart.querySelector(".mini-list-product");
        const totalAmountElement = miniCart.querySelector(".shopping-cart-total-amount");
        function handleRemoveFromCart(removeCartButton) {
			const idProduct = parseInt(removeCartButton.getAttribute("data-psId"), 10);
            
            // Gửi yêu cầu xóa sản phẩm
            fetch('/ProjectWeb/product?v=removeToCart', {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify({ idProduct: idProduct }), // Gửi idProduct dưới dạng JSON
            	})
                .then((response) => {
                    if (response.ok) {
                        return response.json();
                    } else {
                        throw new Error("Có lỗi xảy ra khi xóa giỏ hàng.");
                    }
                })
                .then((data) => {
                    // Xử lý thành công
						showToast("Thành công", "Đã xóa khỏi giỏ hàng!", "success");
                    // Cập nhật giao diện: xóa phần tử khỏi giỏ hàng
                    const countCart = document.querySelector('.count-cart-icon .count');
					let count = parseInt(countCart.innerText,10);
        			countCart.innerText = count-1;

                })
                .catch((error) => {
                    // Xử lý lỗi
                    console.error(error);
					showToast("Lỗi", "Không thể xóa sản phẩm khỏi giỏ hàng. Vui lòng thử lại.", "error");

                });
			
			}
        // Làm mới danh sách sản phẩm trong giỏ hàng
        productList.innerHTML = ""; // Xóa các mục cũ
		const countCart = document.querySelector('.count-cart-icon .count');
        let count = 0;
        // Duyệt qua sản phẩm mới và tạo lại danh sách
        data.productsCart.forEach(productCart => {
        	count = count + 1;
            const listItem = document.createElement("li");
            listItem.classList.add("shopping-cart-item", "d-inline-flex");
            let formattedGia = new Intl.NumberFormat('vi-VN').format(productCart.gia) + 'đ';
            listItem.innerHTML = 
                '<figure class="item-image">' +
                    '<a href="/ProjectWeb/product?q=' + productCart.maSP + '" title="' + productCart.ten + '">' +
                        '<img class="img-responsive" src="${pageContext.request.contextPath}' + productCart.hinhAnh + '" alt="' + productCart.ten + '">' +
                    '</a>' +
                '</figure>' +
                '<div class="item-content">' +
                    '<h4 class="item-title">' +
                        '<a href="/ProjectWeb/product?q=' + productCart.maSP + '" title="' + productCart.ten + '">' + productCart.ten + '</a>' +
                    '</h4>' +
                    '<span class="item-price">Đơn giá: ' + formattedGia + '</span>' +
                '</div>' +
                '<div class="item-action">' +
                    '<span class="item-quantity">x' + productCart.soLuongGioHang + '</span>' +
                    '<div class="js-remove-item" data-psId="' + productCart.maSP + '">' +
                        '<i class="fa fa-trash"></i>' +
                    '</div>' +
                '</div>';


            productList.appendChild(listItem);
            listItem.querySelector(".js-remove-item").addEventListener("click", function() {
                handleRemoveFromCart(this);
            });
        });
        countCart.innerText = count;

        // Cập nhật tổng tiền
        totalAmountElement.textContent = new Intl.NumberFormat().format(data.totalAmount) + "đ";
    }
    

});

</script>