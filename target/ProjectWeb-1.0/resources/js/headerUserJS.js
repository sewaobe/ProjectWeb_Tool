document.addEventListener("DOMContentLoaded", function () {
    		
	     	document.querySelector(".mini-list-product").addEventListener("click", function (event) {
	   			// Kiểm tra nếu phần tử được nhấp là nút xóa
			    if (event.target.closest(".js-remove-item")) {
			        const removeButton = event.target.closest(".js-remove-item");
			        const itemElement = removeButton.closest(".shopping-cart-item");
					
			        if (itemElement) {
			            // Lấy giá và số lượng từ DOM
			            const priceElement = itemElement.querySelector(".item-price");
			            const quantityElement = itemElement.querySelector(".item-quantity");
			
			            const itemPrice = parseInt(
			                priceElement.textContent.replace(/[^0-9]/g, ""), // Loại bỏ ký tự không phải số
			                10
			            );
			            const itemQuantity = parseInt(quantityElement.textContent.replace(/[^0-9]/g, ""), 10);
			
			            // Tính tổng giá sản phẩm (giá x số lượng)
			            const itemTotal = itemPrice * itemQuantity;
			
			            // Xóa sản phẩm khỏi DOM
			            itemElement.remove();
			
			            // Cập nhật tổng tiền
			            const totalElement = document.querySelector(".shopping-cart-total-amount");
			            let currentTotal = parseInt(
			                totalElement.textContent.replace(/[^0-9]/g, ""), // Loại bỏ ký tự không phải số
			                10
			            );
			            currentTotal -= itemTotal;
			
			            // Định dạng và hiển thị lại tổng tiền
			            totalElement.textContent = new Intl.NumberFormat("vi-VN").format(currentTotal) + "đ";
						

				        }
				    }
				});
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
            			location.reload();

                    })
                    .catch((error) => {
                        // Xử lý lỗi
                        console.error(error);
						showToast("Lỗi", "Không thể xóa sản phẩm khỏi giỏ hàng. Vui lòng thử lại.", "error");
                    });
				
			}														
	        document.querySelectorAll(".js-remove-item").forEach((removeCartButton) => {
	            removeCartButton.addEventListener("click", function() {
	            	handleRemoveFromCart(this);
	        	});
	        });
        });