document.addEventListener("DOMContentLoaded", function () {
	    // Hàm tính lại giá trị của một sản phẩm (totalPriceProduct)
	    function updateTotalPriceProduct(item) {
	        const quantityInput = item.querySelector(".updateCart");
	        const price = parseFloat(item.querySelector(".price").innerText.replace(/[^\d.-]/g, '')); // Lấy giá từ cột có class d-block
	        const quantity = parseInt(quantityInput.value, 10);
	        const totalPrice = price * quantity;
			
	        // Cập nhật lại giá trị totalPriceProduct của sản phẩm
	        item.querySelector(".totalPriceProduct").innerText = totalPrice.toLocaleString() + "đ";
			
	        return totalPrice;
	    }

	    // Hàm tính lại tổng giỏ hàng
	    function updateTotalCart() {
	        let total = 0;
	        const cartItems = document.querySelectorAll(".cart-item");
	        cartItems.forEach(item => {
	            total += updateTotalPriceProduct(item);
	        });

	        // Cập nhật tổng giỏ hàng
	        const totalCartElement = document.querySelector(".total");
	        totalCartElement.innerText = total.toLocaleString() + "đ"; // Giả sử #totalCart là phần tử hiển thị tổng giỏ hàng
	    }

	    // Lắng nghe sự kiện khi nhấn nút plus và minus
	    document.querySelectorAll(".blk-qty-btn").forEach(button => {
	        button.addEventListener("click", function () {
	            const cartItem = button.closest(".cart-item");
	            const quantityInput = cartItem.querySelector(".updateCart");
	            let currentQuantity = parseInt(quantityInput.value, 10);

	            // Nếu là nút plus, tăng số lượng
	            if (button.classList.contains("plus")) {
	                if (currentQuantity < parseInt(quantityInput.max, 10)) { // Kiểm tra số lượng tối đa
	                    quantityInput.value = currentQuantity + 1;
	                }
	            } 
	            // Nếu là nút minus, giảm số lượng
	            else if (button.classList.contains("minus")) {
	                if (currentQuantity > parseInt(quantityInput.min, 10)) { // Kiểm tra số lượng tối thiểu
	                    quantityInput.value = currentQuantity - 1;
	                }
	            }

	            // Cập nhật lại tổng tiền của sản phẩm và tổng giỏ hàng
	            updateTotalPriceProduct(cartItem);
	            updateTotalCart();
	        });
	    });

	    // Lắng nghe sự kiện khi người dùng thay đổi trực tiếp số lượng trong input
	    document.querySelectorAll(".updateCart").forEach(input => {
	        input.addEventListener("blur", function () {
	            const cartItem = input.closest(".cart-item");
	            // Kiểm tra để đảm bảo số lượng nhập hợp lệ
	            const quantity = parseInt(input.value, 10);
	            if (isNaN(quantity)||quantity < parseInt(input.min, 10) || quantity > parseInt(input.max, 10)) {
					showToast("Lỗi",  "Số lượng không hợp lệ", "error");
	                input.value=1;
	            }

	            // Cập nhật lại tổng tiền của sản phẩm và tổng giỏ hàng
	            updateTotalPriceProduct(cartItem);
	            updateTotalCart();
	        });
	    });

	    // Khởi tạo lại tổng giỏ hàng khi trang được load
	    updateTotalCart();
	    
	    //Nút xóa ở giỏ hàng
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
        document.querySelectorAll(".remove-cart").forEach((removeCartButton) => {
            removeCartButton.addEventListener("click", function() {
            	handleRemoveFromCart(this);
        	});
        });
	});

 