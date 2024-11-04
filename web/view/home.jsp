<%-- 
    Document   : home
    Created on : Oct 30, 2024, 5:20:43 PM
    Author     : Admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trang Chủ - Quản Lý Công Ty</title>
        <style>
            body {
                background: url('https://images.pexels.com/photos/189349/pexels-photo-189349.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500') no-repeat center center fixed;
                background-size: cover;
                color: #ffffff;
                height: 100vh;
                margin: 0;
                display: flex;
                align-items: center;
                justify-content: center;
                flex-direction: column;
            }
            .card {
                transition: transform 0.3s ease;
                background-color: rgba(255, 255, 255, 0.8);
            }
            .card:hover {
                transform: scale(1.05);
            }
            .container {
                background: rgba(0, 0, 0, 0.7);
                padding: 2rem;
                border-radius: 10px;
                max-width: 800px;
            }
            .header-text {
                color: #ffc107;
                text-shadow: 2px 2px 4px #000000;
            }
            .logout-button {
                position: fixed;
                top: 20px;
                right: 20px;
            }
            .navbar {
                width: 100%;
                background-color: #f8f9fa !important;
                position: fixed;
                top: 0;
                left: 0;
                z-index: 1030;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-infor">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Quản Lý Công Ty</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="../home">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../employees/list">Employee</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../plans/list">Plan</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link btn btn-danger text-white" href="../logout">Log Out</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container text-center mt-5 pt-5">
            <div class="mb-5">
                <h1 class="display-4 header-text">Hệ Thống Quản Lý Công Ty</h1>
                <p class="lead">Chào mừng bạn đến với trang chủ hệ thống quản lý nhân viên và kế hoạch của công ty.</p>
            </div>
            <div class="row justify-content-center">
                <div class="col-md-6 mb-4">
                    <div class="card shadow-sm">
                        <div class="card-body text-center">
                            <h3 class="card-title">Quản Lý Nhân Viên</h3>
                            <p class="card-text">Xem danh sách, thông tin và quản lý nhân viên của công ty.</p>
                            <a href="../employees/list" class="btn btn-primary">Xem Nhân Viên</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 mb-4">
                    <div class="card shadow-sm">
                        <div class="card-body text-center">
                            <h3 class="card-title">Quản Lý Kế Hoạch</h3>
                            <p class="card-text">Xem danh sách và chi tiết các kế hoạch sản xuất của công ty.</p>
                            <a href="../plans/list" class="btn btn-primary">Xem Kế Hoạch</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-eMNEnBtKXxi+B6yEp7UB0yZ2AN7Wcl8MFqN9EvkU4lV0/0uAMHpR1ErTvcEj1Mg8" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhG81rD5Ffj4c7GZ7pNIxKmwz6M9E5eSiCZpA83GxM9UhIfl9w5y4v9XXscr" crossorigin="anonymous"></script>
    </body>
</html>
