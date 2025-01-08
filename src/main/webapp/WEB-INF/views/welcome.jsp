<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập/Đăng ký</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa; /* Màu nền sáng */
        }
        .header-bar {
            background-color: #ff66a3; /* Màu hồng */
            padding: 15px;
            text-align: center;
            color: white;
            font-weight: bold;
        }
        .form-container {
            max-width: 500px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .btn-custom {
            width: 100%;
            margin-top: 10px;
            padding: 10px;
            border-radius: 5px;
        }
        .btn-login {
            background-color: #ff66a3; /* Màu hồng */
            color: white;
        }
        .btn-login:hover {
            background-color: #e0558e; /* Màu hồng đậm hơn */
        }
        .btn-register {
            background-color: #007bff; /* Màu xanh */
            color: white;
        }
        .btn-register:hover {
            background-color: #0056b3; /* Màu xanh đậm */
        }
    </style>
</head>
<body>
    <div class="header-bar">
        <h1>TAURUSSHOP - Đăng nhập & Đăng ký</h1>
    </div>
    <div class="container">
        <div class="form-container text-center">
            <h2>Chọn hành động</h2>
            <p>Vui lòng chọn một trong hai thao tác bên dưới:</p>
            <!-- Nút Đăng nhập -->
            <form action="login" method="get">
                <button type="submit" class="btn btn-custom btn-login">Đăng nhập</button>
            </form>
            <!-- Nút Đăng ký -->
            <form action="register" method="get">
                <button type="submit" class="btn btn-custom btn-register">Đăng ký</button>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
