document.addEventListener("DOMContentLoaded", function() {
    // Lấy đường dẫn hiện tại của trình duyệt
    var currentPath = window.location.pathname;

    // Lấy tất cả các thẻ <a> trong menu
    var menuItems = document.querySelectorAll('.menu-item');

    // Lặp qua các thẻ <a> để kiểm tra đường dẫn
    menuItems.forEach(function(menuItem) {
        var linkPath = menuItem.getAttribute('href'); // Lấy giá trị của href

        // Kiểm tra nếu đường dẫn của thẻ <a> trùng với đường dẫn hiện tại
        if (currentPath === linkPath) {
            // Thêm class 'active' vào thẻ <a> tương ứng
            menuItem.classList.add('active');
        } else {
            // Đảm bảo các thẻ khác không có class 'active'
            menuItem.classList.remove('active');
        }
    });
});
