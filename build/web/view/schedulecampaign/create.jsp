<%-- 
    Document   : create
    Created on : Nov 4, 2024, 3:18:55 AM
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
        <title>Schedule Campaign</title>
        <style>
            table th,
            table td {
                width: 80px;
                max-width: 80px;
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: nowrap;
            }
            .table-container {
                overflow-x: auto;
            }
        </style>
    </head>

    <body>
        <div class="container mt-5">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h2 class="card-title mb-4 text-center">Schedule Campaign</h2>
                    <div class="table-responsive">
                        <form action="../schedulecampaign/create" method="post">
                            <input type="hidden" name="plid" value="${plid}">
                            <table class="table table-bordered table-hover table-sm align-middle">
                                <thead>
                                    <tr class="table-primary">
                                        <th scope="col" rowspan="2" class="text-center align-middle">Ngày</th>
                                            <c:forEach items="${productList}" var="product">
                                            <th colspan="3" class="text-center">${product.pname}</th>
                                            </c:forEach>
                                    </tr>
                                    <tr class="table-primary">
                                        <c:forEach items="${productList}" var="product">
                                            <th scope="col" class="text-center">K1</th>
                                            <th scope="col" class="text-center">K2</th>
                                            <th scope="col" class="text-center">K3</th>
                                            </c:forEach>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="date" items="${dateList}">
                                        <tr>
                                            <td class="text-center align-middle">
                                                <input type="hidden" name="date" value="${date}">
                                                ${date}
                                            </td>
                                            <c:forEach var="product" items="${productList}">
                                                <c:forEach var="shift" begin="1" end="3">
                                                    <c:set var="key" value="${date}_${product.pid}_${shift}" />
                                                    <td>
                                                        <input type="number" name="quantity_${key}"
                                                               value="${dataMap[key] != null ? dataMap[key] : 0}" min="0" class="form-control">
                                                    </td>
                                                </c:forEach>
                                            </c:forEach>
                                        </tr>
                                    </c:forEach>


                                </tbody>
                            </table>
                            <button type="submit" class="btn btn-success">Save Schedule Campaign</button>
                        </form>
                    </div>
                </div>
            </div>
    </body>

</html>

