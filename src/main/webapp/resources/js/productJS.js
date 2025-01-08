document.addEventListener("DOMContentLoaded", function () {
    // Sự kiện khi nhấn nút "View"
    let imageOld;
    document.querySelectorAll('.btn-view-product').forEach(button => {
        button.addEventListener('click', function () {
            // Lấy dữ liệu từ nút nhấn
            const productId = this.getAttribute('data-product-id');
            const productName = this.getAttribute('data-product-name');
            const productDescription = this.getAttribute('data-product-description');
            const productPrice = this.getAttribute('data-product-price');
            const productStock = this.getAttribute('data-product-stock');
            const productImage = this.getAttribute('data-product-image');
            imageOld = productImage; // Dán ảnh cũ
            const productCategory = this.getAttribute('data-product-category');

            // Đưa dữ liệu vào các trường trong modal
            document.getElementById('productId').value = productId;
            document.getElementById('productName').value = productName;
            document.getElementById('productDescription').value = productDescription;
            document.getElementById('productPrice').value = productPrice;
            document.getElementById('productStock').value = productStock;
            document.getElementById('productImage').value = "";
            document.getElementById('productCategory').value = productCategory;

            // Hiển thị ảnh nếu có (trước khi sửa)
            const imagePreview = document.getElementById('imagePreview');
            if (imagePreview) {
                imagePreview.src = productImage;  // Hiển thị ảnh cũ trước khi chỉnh sửa
                imagePreview.style.display = "block"; // Đảm bảo ảnh hiển thị
            }

            // Hiển thị modal
            const modal = new bootstrap.Modal(document.getElementById('productModal'));
            modal.show();
        });
    });

    // Sự kiện khi nhấn nút "Create" (Tạo mới sản phẩm)
    const createNewProductBtn = document.getElementById('createNewInvoice');
    if (createNewProductBtn) {
        createNewProductBtn.addEventListener('click', function () {
            // Đặt lại các giá trị trong modal khi tạo mới sản phẩm
            document.getElementById('productId').value = "Bạn không cần nhập mã sản phẩm";  // Đặt mã sản phẩm trống
            document.getElementById('productName').value = "";  // Đặt tên sản phẩm trống
            document.getElementById('productDescription').value = "";  // Đặt mô tả trống
            document.getElementById('productPrice').value = "";  // Đặt giá trống
            document.getElementById('productStock').value = "";  // Đặt số lượng tồn kho trống
            document.getElementById('productImage').value = "";  // Đặt giá trị ảnh trống
            document.getElementById('productCategory').value = "";  // Đặt loại sản phẩm trống

            // Ẩn ảnh preview cũ
            const imagePreview = document.getElementById('imagePreview');
            if (imagePreview) {
                imagePreview.style.display = "none";
            }

            // Hiển thị modal
            const modal = new bootstrap.Modal(document.getElementById('productModal'));
            modal.show();
        });
    }

    // Lắng nghe sự kiện khi người dùng chọn ảnh mới
    const productImageInput = document.getElementById('productImage');
    const imagePreview = document.getElementById('imagePreview');  // Thẻ img để hiển thị ảnh preview

    if (productImageInput && imagePreview) {
        productImageInput.addEventListener('change', function (event) {
            const file = event.target.files[0]; // Lấy file từ input
            if (file) {
                // Kiểm tra file là hình ảnh và hiển thị ảnh lên thẻ img trước khi upload
                const reader = new FileReader();
                reader.onload = function (e) {
                    imagePreview.src = e.target.result;  // Đặt đường dẫn của ảnh vào thẻ img
                    imagePreview.style.display = "block"; // Hiển thị ảnh
                };
                reader.readAsDataURL(file);  // Đọc file hình ảnh
            }
        });
    }

    // Lắng nghe sự kiện click vào nút Save để gửi form
    document.getElementById("saveProductBtn").addEventListener("click", function () {
        const form = document.getElementById("productForm");
        const productImageInput = document.getElementById('productImage');
        const hiddenProductImage = document.getElementById('hiddenProductImage'); // Hình ảnh cũ được ẩn trong form
        console.log(hiddenProductImage.value);
        
        // Nếu không có hình ảnh mới, sử dụng hình ảnh cũ
        if (!productImageInput.files.length) {
			if(imageOld){ //UPDATE
				hiddenProductImage.value = "/"+imageOld.split('/').slice(2).join('/') || "";  // Đảm bảo giá trị cũ được giữ lại
			}
			else{ //ADD
				alert('Vui lòng chọn hình ảnh cho sản phẩm');
				return;
			}
        }
        if(document.getElementById('productId').value == "Bạn không cần nhập mã sản phẩm"){
			document.getElementById('productId').value = 0;  // Đặt mã sản phẩm trống
		}
        form.submit();  // Gửi form để cập nhật thông tin sản phẩm
    });
	
	
	//==============Nút Delete
	const deleteButtons = document.querySelectorAll(".btn-delete-product");

	    // Lắng nghe sự kiện click vào nút xóa
	    deleteButtons.forEach(function (button) {
	        button.addEventListener("click", function () {
	            // Lấy thông tin sản phẩm từ data attributes
	            const productId = this.getAttribute("data-product-id");
	            const productName = this.getAttribute("data-product-name");
	            
	            // Hiển thị modal xác nhận
	            const confirmModal = document.createElement("div");
	            confirmModal.classList.add("modal", "fade");
	            confirmModal.setAttribute("id", "confirmDeleteModal");
	            confirmModal.setAttribute("tabindex", "-1");
	            confirmModal.setAttribute("aria-labelledby", "confirmDeleteModalLabel");
	            confirmModal.setAttribute("aria-hidden", "true");
	            confirmModal.innerHTML = `
	                <div class="modal-dialog">
	                    <div class="modal-content">
	                        <div class="modal-header">
	                            <h5 class="modal-title" id="confirmDeleteModalLabel">Xác nhận xóa</h5>
	                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	                        </div>
	                        <div class="modal-body">
	                            Bạn có chắc chắn muốn xóa sản phẩm <strong>${productName}</strong> không?
	                        </div>
	                        <div class="modal-footer">
	                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
	                            <button type="button" class="btn btn-danger" id="confirmDeleteBtn">Xóa</button>
	                        </div>
	                    </div>
	                </div>
	            `;
	            
	            // Thêm modal vào DOM
	            document.body.appendChild(confirmModal);
	            const modal = new bootstrap.Modal(confirmModal);
	            modal.show();

	            // Lắng nghe sự kiện click vào nút xác nhận xóa
	            document.getElementById("confirmDeleteBtn").addEventListener("click", function () {
	                // Gửi yêu cầu xóa sản phẩm lên backend
	                fetch(`/ProjectWeb/staff/deleteProduct/${productId}`, {
	                    method: "DELETE", // Sử dụng phương thức DELETE
	                    headers: {
	                        "Content-Type": "application/json"
	                    }
	                })
	                .then(response => response.json())
	                .then(data => {
	                    if (data.success) {
	                        // Nếu xóa thành công, đóng modal và xóa sản phẩm khỏi bảng
	                        modal.hide();
	                        document.querySelector(`button[data-product-id="${productId}"]`).closest('tr').remove();
							
							showToast("Thành công", "Sản phẩm đã được xóa thành công!", "success");
							alert("Sản phẩm đã được xóa thành công");

	                    } else {
							showToast("Lỗi", "Đã có lỗi xảy ra khi xóa sản phẩm.", "error");
							alert("Không thể xóa sản phẩm");
							location.href = "";

	                    }
	                })
	                .catch(error => {
	                    console.error('Error:', error);
						alert("Không thể xóa sản phẩm");
						location.href = "";

	                });
	            });

	            // Lắng nghe sự kiện đóng modal (khi người dùng hủy)
	            confirmModal.querySelector("[data-bs-dismiss='modal']").addEventListener("click", function () {
	                modal.hide();
	                confirmModal.remove();
	            });
	        });
	    });
});
