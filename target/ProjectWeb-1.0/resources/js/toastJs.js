function showToast(title, message, type = "success") {
    // Tạo toast container nếu chưa có
    let toastContainer = document.getElementById("toast-container");
    if (!toastContainer) {
        toastContainer = document.createElement("div");
        toastContainer.id = "toast-container";
        toastContainer.className = "position-fixed top-0 end-0 p-3";
        toastContainer.style.cssText = `
            z-index: 9999999999;
            position: fixed;
            top: 10px;
            right: 10px;
        `;
        document.body.appendChild(toastContainer);
    }
	const toastId = `toast-${Date.now()}`;

	const icon = getIconForType(type); // Get icon based on type
    const toastClass = getToastClass(type); // Get class for type (color)

    const toastHtml = `
        <div id="${toastId}" class="toast ${toastClass}" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="toast-header">
                <span class="toast-icon">${icon}</span>
                <strong class="me-auto">${title}</strong>
                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
            <div class="toast-body">
                ${message}
            </div>
        </div>
    `;
    

    toastContainer.innerHTML += toastHtml;

    const toastElement = document.getElementById(toastId);
    const toast = new bootstrap.Toast(toastElement);

    // Hiển thị toast
    toast.show();

    // Ẩn toast sau 5 giây
	setTimeout(() => {
	        toastElement.classList.add('show');
	    }, 100); // delay 100ms trước khi áp dụng class .show

	    // Ẩn toast sau 2s
    setTimeout(() => {
        toastElement.classList.remove('show');
    }, 2500); // Toast sẽ biến mất sau 2.5s
	
	toastElement.addEventListener("transitionend", () => {
	        toastElement.remove(); // Xóa toast khi hoàn tất chuyển động
	    });
}
function getIconForType(type) {
    switch (type) {
        case "error":
            return "❌"; // Error icon
        case "success":
            return "✔️"; // Success icon
        default:
            return "";
    }
}
function getToastClass(type) {
    switch (type) {
        case "error":
            return "toast-error"; // Red color for error
        case "success":
            return "toast-success"; // Green color for success
        default:
            return "toast-success"; // Default to success
    }
}