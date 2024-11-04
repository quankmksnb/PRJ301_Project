<%-- 
    Document   : update
    Created on : Nov 3, 2024, 4:31:06 PM
    Author     : Admin
--%>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Plan Campaign</title>
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
            .btn-update {
                font-weight: bold;
            }
            td, th {
                text-align: center;
                vertical-align: middle;
            }
        </style>
    </head>
    <body>
        <div class="container mt-5">
            <div class="card p-4">
                <h2 class="text-center mb-4">Update Plan Campaign</h2>
                <form action="update" method="post">
                    <input type="hidden" name="canid" value="${oldPC.canid}">
                    <input type="hidden" name="plid" value="${oldPC.plan.plid}">
                    <table class="table table-bordered table-striped">
                        <thead class="table-primary">
                            <tr>
                                <th>Product Name</th>
                                <th>Quantity</th>
                                <th>Estimated Effort</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>${oldPC.product.pname}</td>
                                <td><input type="number" class="form-control text-center" name="quantity" value="${oldPC.quantity}" required></td>
                                <td><input type="number" step="0.01" class="form-control text-center" name="estimatedEffort" value="${oldPC.estimatedEffort}" required></td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="d-grid">
                        <button type="submit" class="btn btn-primary">Update Plan Campaign</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
