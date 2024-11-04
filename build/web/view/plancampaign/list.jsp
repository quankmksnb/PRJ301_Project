<%-- 
    Document   : list
    Created on : Nov 1, 2024, 2:05:45 PM
    Author     : Admin
--%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Plan Campaign List</title>
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
                    <h2 class="m-0">Plan Campaign List</h2>
                    <a href="create?plid=${param.plid}" class="btn btn-success btn-create">Create New Plan Campaign</a>
                </div>
                <div class="table-responsive">
                    <table class="table table-bordered table-striped">
                        <thead class="table-primary">
                            <tr>
                                <th scope="col">Campaign ID</th>
                                <th scope="col">Plan</th>
                                <th scope="col">Product</th>
                                <th scope="col">Quantity</th>
                                <th scope="col">Estimated Effort</th>
                                <th scope="col">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="planCampaign" items="${planCampaignList}">
                                <c:if test="${planCampaign.plan.plid eq param.plid}">
                                    <tr>
                                        <td>${planCampaign.canid}</td>
                                        <td>${planCampaign.plan.plid}</td>
                                        <td>${planCampaign.product.pname}</td>
                                        <td>${planCampaign.quantity}</td>
                                        <td>${planCampaign.estimatedEffort}</td>
                                        <td>
                                            <div class="d-flex justify-content-center gap-2">
                                                <a href="update?canid=${planCampaign.canid}" class="btn btn-primary btn-sm">Edit</a>
                                                <a onclick="deleteHandler(${planCampaign.canid}, ${planCampaign.plan.plid})" class="btn btn-danger btn-sm">Delete</a>
                                            </div>
                                        </td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <script>
            function deleteHandler(canid, plid) {
                var check = confirm("Bạn có chắc chắn muốn xóa?");
                if (check) {
                    window.location.href = "delete?plid=" + plid + "&canid=" + canid;
                }
            }
        </script>
    </body>
</html>
