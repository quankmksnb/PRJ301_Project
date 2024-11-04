<%-- 
    Document   : create
    Created on : Nov 3, 2024, 4:31:01 PM
    Author     : Admin
--%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Plan Campaign</title>
        <style>
            body {
                background-color: #f8f9fa;
            }
            .card {
                border-radius: 15px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                max-width: 70%;
                margin: 0 auto;
            }
            .btn-create {
                font-weight: bold;
            }
            td, th {
                text-align: center;
                vertical-align: middle;
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
                <h2 class="text-center mb-4">Create Plan Campaign</h2>
                <form action="create" method="post">
                    <table class="table table-bordered table-striped">
                        <thead class="table-primary">
                            <tr>
                                <th>Product Name</th>
                                <th>Quantity</th>
                                <th>Estimated Effort</th>
                            </tr>
                        </thead>
                        <tbody>
                        <input type="hidden" name="plid" value="${param.plid}" />
                            <c:forEach items="${availableProducts}" var="pro">
                                <tr>
                                    <td>${pro.pname}<input type="hidden" name="pid" value="${pro.pid}"/></td>
                                    <td><input type="number" class="form-control text-center" name="quantity${pro.pid}"></td>
                                    <td><input type="number" step="0.01" class="form-control text-center" name="estimatedEffort${pro.pid}"></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div class="d-grid">
                        <button type="submit" class="btn btn-success">Create Plan Campaign</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>

