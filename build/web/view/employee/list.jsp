<%-- 
    Document   : list
    Created on : Nov 1, 2024, 8:43:24 AM
    Author     : Admin
--%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>Employee List</title>
        <style>
            td, th {
                text-align: center;
                vertical-align: middle;
            }
            td:nth-child(2) {
                text-align: left;
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
            <h2 class="text-center mb-4">Employee List</h2>
            <div class="table-responsive">
                <table class="table table-bordered table-striped">
                    <thead class="table-primary">
                        <tr>
                            <th scope="col">Employee ID</th>
                            <th scope="col">Employee Name</th>
                            <th scope="col">Salary Level</th>
                            <th scope="col">Department</th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="emp" items="${listEmp}">
                            <tr>
                                <td>${emp.eid}</td>
                                <td>${emp.ename}</td>
                                <td>${emp.salaryLevel}</td>
                                <td>${emp.department.dname}</td>
                                <td>
                                    <div class="d-flex justify-content-center gap-2">
                                        <a href="#" class="btn btn-primary btn-sm">Edit</a>
                                        <a onclick="#" class="btn btn-danger btn-sm">Delete</a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
