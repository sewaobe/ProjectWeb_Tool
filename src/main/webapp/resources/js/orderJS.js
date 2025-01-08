document.addEventListener("DOMContentLoaded", function () {
    console.log("DOM Loaded, JS Running");
	
    document.querySelector(".content").addEventListener("click", function (event) {
        if (event.target && event.target.classList.contains("btn-view-order")) {
            const button = event.target;
            let row = button.closest("tr"); // Dành cho bảng
            if (!row) {
                row = button.closest(".card"); // Nếu không phải bảng, tìm trong card
            }

            const orderDetails = {
                maHD: row.querySelector("h5.card-title, td:nth-child(1)").textContent.trim(),
                maNguoiDung: row.querySelector("td:nth-child(2)") ? row.querySelector("td:nth-child(2)").textContent.trim() : row.querySelector(".card-text").textContent.match(/Người gửi: (.*)/)[1],
                tongTien: row.querySelector("td:nth-child(3)") ? row.querySelector("td:nth-child(3)").textContent.trim() : row.querySelector(".card-text").textContent.match(/Tổng tiền: (.*)/)[1],
                ngayDatHang: row.querySelector("td:nth-child(4)") ? row.querySelector("td:nth-child(4)").textContent.trim() : row.querySelector(".card-text").textContent.match(/Ngày đặt hàng: (.*)/)[1],
                trangThai: row.querySelector("td:nth-child(5)") ? row.querySelector("td:nth-child(5)").textContent.trim() : row.querySelector(".card-text").textContent.match(/Trạng thái: (.*)/)[1],
                diaChiGiaoHang: row.querySelector("td:nth-child(6)") ? row.querySelector("td:nth-child(6)").textContent.trim() : row.querySelector(".card-text").textContent.match(/Địa chỉ giao hàng: (.*)/)[1],
                phuongThuc: row.querySelector("td:nth-child(7)") ? row.querySelector("td:nth-child(7)").textContent.trim() : row.querySelector(".card-text").textContent.match(/Phương thức: (.*)/)[1],
                nguoiNhan: row.querySelector("td:nth-child(8)") ? row.querySelector("td:nth-child(8)").textContent.trim() : row.querySelector(".card-text").textContent.match(/Người nhận: (.*)/)[1],
                ghiChu: row.querySelector("td:nth-child(9)") ? row.querySelector("td:nth-child(9)").textContent.trim() : row.querySelector(".card-text").textContent.match(/Ghi chú: (.*)/)[1],
            };

            // Tạo nội dung chi tiết cho modal
            const modalContent = `
                <p><strong>Order ID:</strong> ${orderDetails.maHD}</p>
                <p><strong>Người gửi:</strong> ${orderDetails.maNguoiDung}</p>
                <p><strong>Tổng tiền:</strong> ${orderDetails.tongTien}</p>
                <p><strong>Ngày đặt hàng:</strong> ${orderDetails.ngayDatHang}</p>
                <p><strong>Trạng thái:</strong>
                    <select id="orderStatusModal" class="form-select">
                        <option value="Chờ xác nhận" ${orderDetails.trangThai === "Chờ xác nhận" ? "selected" : ""}>Chờ xác nhận</option>
                        <option value="Đã xác nhận" ${orderDetails.trangThai === "Đã xác nhận" ? "selected" : ""}>Đã xác nhận</option>
                        <option value="Đang vận chuyển" ${orderDetails.trangThai === "Đang vận chuyển" ? "selected" : ""}>Đang vận chuyển</option>
                        <option value="Đã vận chuyển" ${orderDetails.trangThai === "Đã vận chuyển" ? "selected" : ""}>Đã vận chuyển</option>
                        <option value="Đã hủy" ${orderDetails.trangThai === "Đã hủy" ? "selected" : ""}>Đã hủy</option>
                    </select>
                </p>
                <p><strong>Địa chỉ giao hàng:</strong> ${orderDetails.diaChiGiaoHang}</p>
                <p><strong>Phương thức:</strong> ${orderDetails.phuongThuc}</p>
                <p><strong>Người nhận:</strong> ${orderDetails.nguoiNhan}</p>
                <p><strong>Ghi chú:</strong> ${orderDetails.ghiChu}</p>
            `;

            document.getElementById("modalOrderContent").innerHTML = modalContent;

            // Cập nhật giá trị vào các input ẩn
            document.getElementById("orderMaHD").value = orderDetails.maHD;
            document.getElementById("orderMaNguoiDung").value = orderDetails.maNguoiDung;
            document.getElementById("orderTongTien").value = orderDetails.tongTien;
            document.getElementById("orderNgayDatHang").value = orderDetails.ngayDatHang;
            document.getElementById("orderDiaChiGiaoHang").value = orderDetails.diaChiGiaoHang;
            document.getElementById("orderPhuongThuc").value = orderDetails.phuongThuc;
            document.getElementById("orderNguoiNhan").value = orderDetails.nguoiNhan;
            document.getElementById("orderGhiChu").value = orderDetails.ghiChu;

            // Hiển thị modal
            const orderModal = new bootstrap.Modal(document.getElementById("orderModal"));
            orderModal.show();
        }
    });

    // Lắng nghe sự kiện click nút Save
	document.getElementById("saveOrderBtn").addEventListener("click", function () {
	    // Lấy giá trị từ select trong modal
	    const selectedStatus = document.getElementById("orderStatusModal").value;
	    const orderId = document.getElementById("orderMaHD").value;

	    // Loại bỏ tiền tố "HD" từ mã đơn hàng
	    const orderIdWithoutPrefix = orderId.replace("HD", "");

	    // Tạo đối tượng JSON từ dữ liệu
	    const orderData = {
	        maHD: orderIdWithoutPrefix,
	        maNguoiDung: document.getElementById("orderMaNguoiDung").value,
	        tongTien: document.getElementById("orderTongTien").value,
	        ngayDatHang: document.getElementById("orderNgayDatHang").value,
	        trangThai: selectedStatus,  // Lấy trạng thái đã chọn
	        diaChiGiaoHang: document.getElementById("orderDiaChiGiaoHang").value,
	        phuongThuc: document.getElementById("orderPhuongThuc").value,
	        nguoiNhan: document.getElementById("orderNguoiNhan").value,
	        ghiChu: document.getElementById("orderGhiChu").value
	    };

	    // Sử dụng fetch để gửi dữ liệu dưới dạng JSON
	    fetch('staff/updateOrder', {
	        method: 'POST',
	        headers: {
	            "Content-Type": "application/json"
	        },
	        body: JSON.stringify(orderData) // Gửi dữ liệu dưới dạng JSON
	    })
	    .then(response => response.json())  // Giả sử controller trả về JSON
	    .then(data => {
	        console.log("Response from server:", data);
	        if (data.success) {
	            alert("Order updated successfully!");
	            // Đóng modal
				// Sau khi lưu dữ liệu thành công
				const modalElement = document.getElementById('orderModal');
				modalElement.classList.remove('show');
				modalElement.setAttribute('aria-hidden', 'true');
				document.body.classList.remove('modal-open'); // Đảm bảo modal backdrop bị xóa
				document.querySelector('.modal-backdrop').remove(); // Xóa backdrop
				location.reload();
	        } else {
	            alert("Failed to update order.");
				location.reload();

	        }
	    })
	    .catch(error => {
	        console.error("Error updating order:", error);
	        alert("There was an error updating the order.");
	    });
	});
	
	//Detail button
	const detailButtons = document.querySelectorAll(".btn-detail-order");

	    // Lặp qua tất cả các button và gán sự kiện click
	    detailButtons.forEach(button => {
	        button.addEventListener("click", function() {
	            // Lấy giá trị MaHD từ thuộc tính data-id-order
	            const maHD = button.getAttribute("data-id-order");
	            console.log("123");
	            // Chuyển hướng sang trang chi tiết đơn hàng, ví dụ /orders/{maHD}
	            window.location.href = `staff/orders/details?q=${maHD}`; // Điều chỉnh URL theo yêu cầu của bạn
	        });
	    });
});
