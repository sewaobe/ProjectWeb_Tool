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
				showToast("Thành công", "Đã thêm vào giỏ hàng thành công!", "success");

                // Cập nhật lại giỏ hàng trong header
                location.reload();
            })
            .catch((error) => {
                console.error(error);
				showToast("Thành công", "Đã thêm vào giỏ hàng thất bại!", "error");
            });
        });
    });;
});