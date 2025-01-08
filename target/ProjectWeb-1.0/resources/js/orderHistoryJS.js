document.addEventListener("DOMContentLoaded", function () {
    console.log("DOM Loaded, JS Running");
	//Detail button
	const detailButtons = document.querySelectorAll(".btn-detail-order");

	    // Lặp qua tất cả các button và gán sự kiện click
	    detailButtons.forEach(button => {
	        button.addEventListener("click", function() {
	            // Lấy giá trị MaHD từ thuộc tính data-id-order
	            const maHD = button.getAttribute("data-id-order");
	            console.log("123");
	            // Chuyển hướng sang trang chi tiết đơn hàng, ví dụ /orders/{maHD}
	            window.location.href = `order/details?q=${maHD}`; // Điều chỉnh URL theo yêu cầu của bạn
	        });
	    });
});
