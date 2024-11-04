<%-- 
    Document   : list
    Created on : Nov 1, 2024, 11:56:08 AM
    Author     : Admin
--%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Plan List</title>
        <style>
            body {
                background-color: #f8f9fa;
            }
            td, th {
                text-align: center;
                vertical-align: middle;
            }
            .card {
                border-radius: 15px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            .btn-create {
                font-weight: bold;
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
        <div class="container mt-5">
            <div class="card p-4">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h2 class="m-0">Plan List</h2>
                    <a href="../plans/create" class="btn btn-success btn-create">Create New Plan</a>
                </div>
                <div class="table-responsive">
                    <table class="table table-bordered table-striped">
                        <thead class="table-primary">
                            <tr>
                                <th scope="col">Plan ID</th>
                                <th scope="col">Start Date</th>
                                <th scope="col">End Date</th>
                                <th scope="col">Department</th>
                                <th scope="col">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="plan" items="${planList}">
                                <tr>
                                    <td>${plan.plid}</td>
                                    <td>${plan.startd}</td>
                                    <td>${plan.endd}</td>
                                    <td>${plan.department.dname}</td>
                                    <td>
                                        <div class="d-flex justify-content-center gap-2">
                                            <a href="../schedulecampaign/list?plid=${plan.plid}" class="btn btn-success btn-sm text-white">Schedule</a>
                                            <a href="../plancampaign/list?plid=${plan.plid}" class="btn btn-info btn-sm text-white">Details</a>
                                            <a href="update?plid=${plan.plid}" class="btn btn-primary btn-sm">Edit</a>
                                            <a onclick="deleteHandler(${plan.plid})" class="btn btn-danger btn-sm">Delete</a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <script>
            function deleteHandler(productId) {
                var check = confirm("Bạn có chắc chắn muốn xóa?");
                if (check) {
                    window.location.href = "delete?plid=" + productId;
                }
            }
        </script>
    </body>
</html>
