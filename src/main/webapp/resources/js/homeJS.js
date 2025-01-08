document.addEventListener("DOMContentLoaded", function () {
	//===================nút yêu thích
	document.querySelectorAll('.product-action .wish').forEach((wishButton) => {
		wishButton.addEventListener("click", function() {
			const isActive = wishButton.classList.toggle("active"); // Toggle trạng thái active
            const idProduct = parseInt(wishButton.getAttribute("data-psid"), 10);
		    // Xác định hành động (thêm hoặc xóa)
		    const action = isActive ? "addToWishlist" : "removeFromWishlist";
		
		    fetch('/ProjectWeb/product?v='+action, {
		        method: "POST",
		        headers: {
		            "Content-Type": "application/json",
		        },
		        body: JSON.stringify({ idProduct: idProduct }),
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
					showToast("Thành công","Đã xóa khỏi giỏ hàng thành công!" , "success");
                    // Cập nhật giao diện: xóa phần tử khỏi giỏ hàng
                    const countCart = document.querySelector('.count-cart-icon .count');
					let count = parseInt(countCart.innerText,10);
        			countCart.innerText = count-1;

                })
                .catch((error) => {
                    // Xử lý lỗi
                    console.error(error);
					showToast("Lỗi","Không thể xóa sản phẩm khỏi giỏ hàng. Vui lòng thử lại." , "error");

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
                        '<img class="img-responsive" src="/ProjectWeb' + productCart.hinhAnh + '" alt="' + productCart.ten + '">' +
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
	
	//======================Nút thêm vào giỏ hàng và mua ngaycartButton
    document.querySelectorAll(".product-action .js-add-cart").forEach((cartButton) => {
    	cartButton.addEventListener("click", function() {
            const idProduct = parseInt(cartButton.getAttribute("data-psid"), 10);

            let data = {
                idProduct: idProduct,
                soLuong: 1
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
				showToast("Thành công","Đã thêm vào giỏ hàng thành công!" , "success");

                // Cập nhật lại giỏ hàng trong header
                updateMiniCart(data);
            })
            .catch((error) => {
                console.error(error);
				showToast("Lỗi","Không thể thêm sản phẩm vào giỏ hàng. Vui lòng thử lại." , "error");

            });
        });
    });;
    
    
 	

	
	
});
