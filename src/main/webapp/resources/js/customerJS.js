document.addEventListener("DOMContentLoaded", function () {
    // Lắng nghe sự kiện click vào nút Delete
    const deleteButtons = document.querySelectorAll(".btn-delete");
    
    let customerIdToDelete = null;

    deleteButtons.forEach(button => {
        button.addEventListener("click", function () {
            // Lấy mã khách hàng từ thuộc tính data-customer-id
            customerIdToDelete = this.getAttribute("data-customer-id");
			document.querySelector('.modal-body').textContent = "Bạn có chắc chắn muốn xóa khách hàng có tên "+ this.getAttribute("data-customer-name") +" này không?";

            // Mở modal xác nhận xóa
            const confirmDeleteModal = new bootstrap.Modal(document.getElementById("confirmDeleteModal"));
            confirmDeleteModal.show();
        });
    });

    // Lắng nghe sự kiện click vào nút Confirm trong modal
    document.getElementById("confirmDeleteBtn").addEventListener("click", function () {
        if (customerIdToDelete) {
            // Gửi yêu cầu xóa khách hàng
            fetch('/ProjectWeb/staff/deleteCustomer?customerId=' + customerIdToDelete, {
                method: 'POST', 
				headers: {
				        'Content-Type': 'application/json'
				    }
            })
			
            .then(			response => {
			            if (!response.ok) {
			                throw new Error("HTTP status " + response.status);
			            }
			            return response.json();})
            .then(data => {
                if (data.success) {
                    alert("Khách hàng đã được xóa!");
                    // Đóng modal
                    const confirmDeleteModal = bootstrap.Modal.getInstance(document.getElementById("confirmDeleteModal"));
                    confirmDeleteModal.hide();
                    
                    // Xóa khách hàng khỏi bảng (hoặc làm mới bảng)
                    document.querySelector(`[data-customer-id="${customerIdToDelete}"]`).closest('tr').remove();
                } else {
                    alert("Có lỗi xảy ra khi xóa khách hàng.");
                }
            })
            .catch(error => {
                console.error("Error:", error);
                alert("Có lỗi khi gửi yêu cầu xóa.");
            });
        }
    });
});
