<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix = "frm" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Ký</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa; /* Màu nền sáng nhẹ */
        }
        .register-form {
            max-width: 500px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .register-form h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #ff66a3; /* Màu hồng nhạt */
        }
        .form-label {
            font-weight: bold;
        }
        .btn-register {
            background-color: #ff66a3;
            color: white;
        }
        .btn-register:hover {
            background-color: #e0558e;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="register-form">
            <h2>Đăng Ký</h2>
            <frm:form action="register" method="post" modelAttribute="UserModel" id="formRegister">
                <div class="mb-3">
                    <label for="username" class="form-label">Tên đăng nhập (*)</label>
                    <input type="text" class="form-control" id="username" name="tenDangNhap" required minlength="4">
                </div>
                <div class="mb-3">
                    <label for="fullname" class="form-label">Họ tên (*)</label>
                    <input type="text" class="form-control" id="fullname" name="hoTen" required>
                </div>
                <div class="mb-3">
                    <label for="dob" class="form-label">Ngày sinh (dd/mm/yyyy)</label>
                    <input type="date" class="form-control" id="dob" name="ngaySinh" required>
                </div>
                <div class="mb-3">
                    <label for="phone" class="form-label">Điện thoại (*)</label>
                    <input type="tel" class="form-control" id="phone" name="sdt" required>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Email (*)</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
                <div class="mb-3">
                    <label for="address" class="form-label">Địa chỉ chi tiết (*)</label>
                    <textarea class="form-control" id="address" name="diaChi" rows="3" required></textarea>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Mật khẩu của bạn (*)</label>
                    <input type="password" class="form-control" id="password" name="matKhau" required>
                </div>
                <div class="mb-3">
                    <label for="confirmPassword" class="form-label">Nhập lại mật khẩu (*)</label>
                    <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                </div>
                <button type="submit" class="btn btn-register w-100">Đăng Ký</button>
            </frm:form>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script>
        const form = document.getElementById('formRegister');
        const password = document.getElementById('password');
        const confirmPassword = document.getElementById('confirmPassword');

        form.addEventListener('submit', function (e) {
            // Kiểm tra nếu mật khẩu không khớp
            if (password.value !== confirmPassword.value) {
                e.preventDefault(); // Ngăn chặn gửi form
                alert('Mật khẩu và xác nhận mật khẩu không khớp!');
                confirmPassword.focus(); // Đưa con trỏ vào ô xác nhận mật khẩu
            } else {
                alert('Đăng ký thành công!');
            }
        });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
