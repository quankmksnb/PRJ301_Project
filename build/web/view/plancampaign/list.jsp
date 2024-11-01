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
        </style>
    </head>
    <body>
        <div class="container mt-5">
            <div class="card p-4">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h2 class="m-0">Plan Campaign List</h2>
                    <a href="#" class="btn btn-success btn-create">Create New Plan Campaign</a>
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
                                                <a href="#" class="btn btn-primary btn-sm">Edit</a>
                                                <a onclick="#" class="btn btn-danger btn-sm">Delete</a>
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
    </body>
</html>
