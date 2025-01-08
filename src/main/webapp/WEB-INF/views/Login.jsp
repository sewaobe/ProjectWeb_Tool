<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Nhập</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@500;600&family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    <style>
       body {
		    background: linear-gradient(135deg, #ffb3c6, #ffffff); /* Màu nền gradient đẹp */
		    font-family: 'Roboto', sans-serif;
		}

        .login-form {
            max-width: 400px;
            margin: 100px auto;
            padding: 30px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .login-form h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .login-btn {
            background-color: #fbb0c9;
            color: white;
        }
        .btn-facebook {
            background-color: #3b5998;
            color: white;
        }
        .btn-google {
            background-color: #db4437;
            color: white;
        }
        .link-forgot {
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="login-form">
            <h2>ĐĂNG NHẬP</h2>
            <form action="login" method="POST">
                <div class="form-group">
                    <input type="text" class="form-control" id="username" name="username" placeholder="Nhập email hoặc tên đăng nhập" required>
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" id="password" name="password" placeholder="Mật khẩu" required>
                </div>
                <button type="submit" class="btn btn-lg login-btn btn-block">ĐĂNG NHẬP</button>
            </form>
            <div class="link-forgot">
                <a href="#">Quên mật khẩu?</a><br>
                <span>Hoặc đăng nhập với</span>
            </div>
            <div class="text-center mt-3">
                <button class="btn btn-facebook btn-block"><i class="fab fa-facebook-f"></i> Đăng nhập bằng Facebook</button>
                <button class="btn btn-google btn-block"><i class="fab fa-google"></i> Đăng nhập bằng Google</button>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and FontAwesome for social icons -->
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
