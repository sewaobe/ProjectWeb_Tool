<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Access Denied</title>
    <!-- Thêm liên kết tới Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container d-flex justify-content-center align-items-center min-vh-100">
        <div class="text-center p-5 border rounded shadow-sm bg-white">
            <h1 class="display-3 text-success"><i class="bi bi-lock"></i> Payment Success</h1>
            <p class="lead">Bạn đã thanh toán thành công, hãy tiếp tục mua sắm nào</p>
            <a href="/ProjectWeb/user" class="btn btn-primary btn-lg">Quay lại trang chủ</a>
        </div>
    </div>

    <!-- Thêm Bootstrap JS và các thư viện phụ thuộc (Popper.js và Bootstrap Bundle) -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
</body>
</html>
