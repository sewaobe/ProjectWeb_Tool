<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Sidebar Left</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            background-color: #fff;
        }

        /* Header */
        .header {
            background-color: #ffb0bd;
            color: #fff;
            padding: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 2px solid #ffe6eb; /* Border below header */
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
        }

        .header .logo {
            font-size: 20px;
            font-weight: bold;
        }

        .header .user-profile {
            display: flex;
            align-items: center;
        }

        .header .user-profile img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-left: 10px;
            border: 2px solid #fff;
        }

        /* Sidebar */
        .sidebar {
            background-color: #ffb0bd;
            color: #fff;
            width: 250px;
            height: calc(100vh - 60px); /* Full height minus header */
            padding: 20px;
            position: fixed;
            top: 60px;
            left: 0;
            transition: left 0.3s ease;
        }

        .sidebar a {
            display: block;
            color: #ffffff;
            text-decoration: none;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 10px;
            text-align: left;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .sidebar a:hover {
            background-color: #ffffff;
            color: #ffb0bd;
        }

        .sidebar a.active {
            background-color: #ffffff;
            color: #ffb0bd;
            font-weight: bold;
        }

        /* Content */
        .content {
            margin-left: 250px; /* Space for the sidebar */
            margin-top: 60px; /* Space for the header */
            padding: 20px;
            flex: 1;
            color: #555; /* Neutral text color for readability */
        }

        .content h3 {
            color: #ffb0bd;
        }

		        /* Cấu hình cho toàn bộ bảng */
		.table-wrapper {
		    background-color: #fff;
		    border: 1px solid #ffb0bd;
		    border-radius: 8px;
		    padding: 15px;
		    overflow-x: auto; /* Hiển thị thanh cuộn ngang nếu bảng quá rộng */
		}
		
		/* Cấu hình bảng với chiều rộng cột cố định */
		.table {
		    width: 100%;
		    table-layout: fixed; /* Cố định chiều rộng của các cột */
		}
		
		.table thead {
		    background-color: #ffb0bd;
		    color: #fff;
		}
		
		/* Cấu hình header của bảng để mỗi cột có chiều rộng cố định 150px */
		.table th {
		    width: 150px; /* Đặt chiều rộng cố định cho header */
		    text-align: center; /* Căn giữa tiêu đề */
		    padding: 8px;
		    white-space: nowrap; /* Ngăn cột tiêu đề xuống dòng */
		    overflow: hidden; /* Ẩn phần nội dung vượt quá */
		    text-overflow: ellipsis; /* Hiển thị dấu ba chấm khi nội dung vượt quá chiều rộng */
		}
		
		/* Cấu hình các ô trong bảng (cả header và body) */
		.table th, .table td {
		    width: 150px; /* Đảm bảo chiều rộng của các cột bằng header */
		    text-align: center; /* Căn giữa nội dung trong các cột */
		    padding: 8px; /* Thêm khoảng cách giữa các ô */
		    white-space: nowrap; /* Ngăn nội dung xuống dòng */
		    overflow: hidden; /* Ẩn phần nội dung vượt quá chiều rộng của ô */
		    text-overflow: ellipsis; /* Hiển thị dấu ba chấm khi nội dung quá dài */
		}
		
		/* Cấu hình hover cho các dòng trong bảng */
		.table tbody tr:hover {
		    background-color: #ffe6eb;
		}
		
		/* Hiển thị thanh cuộn ngang nếu bảng quá rộng */
		.table-wrapper {
		    overflow-x: auto;
		}

		        

        .btn-success {
            background-color: #ffb0bd;
            border-color: #ffb0bd;
            color: #fff;
        }

        .btn-success:hover {
            background-color: #ff8090;
            border-color: #ff8090;
        }

        

        /* Footer */
        .footer {
            background-color: #555;
            color: #fff;
            text-align: center;
            padding: 10px;
            border-top: 2px solid #ffe6eb; /* Border above footer */
            position: fixed;
            bottom: 0;
            width: 100%;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .sidebar {
                position: fixed;
                width: 100%; /* Mở rộng sidebar trên màn hình nhỏ */
                top: -100%; /* Ẩn sidebar khi chưa mở */
                height: calc(100vh - 60px); /* Sidebar chiếm chiều cao full màn hình */
                transition: top 0.3s ease;
            }

            .sidebar.open {
                top: 70px; /* Mở sidebar khi có class 'open' */
                z-index:100;
            }

            .content {
                margin-left: 0; /* Nội dung chiếm full chiều rộng khi sidebar ẩn */
            }

            .header .menu-toggle {
                display: inline-block;
                font-size: 24px;
                cursor: pointer;
                color: #fff;
            }
        }

        @media (min-width: 769px) {
            .header .menu-toggle {
                display: none; /* Ẩn dấu ba gạch trên màn hình lớn */
            }
        }
    </style>
</head>
<body>
    

    <jsp:include page="../Layout/Staff/Header.jsp"></jsp:include>
    <jsp:include page="../Layout/Staff/Sidebar.jsp"></jsp:include>
    <jsp:include page="../${content}"></jsp:include>
    <jsp:include page="../Layout/Staff/Footer.jsp"></jsp:include>
    <!-- JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Sidebar Toggle Behavior
        const menuToggle = document.querySelector('.menu-toggle');
        const sidebar = document.querySelector('.sidebar');

        menuToggle.addEventListener('click', () => {
            sidebar.classList.toggle('open');
        });
    </script>
</body>
</html>
