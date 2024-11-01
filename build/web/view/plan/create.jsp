<%-- 
    Document   : create
    Created on : Nov 1, 2024, 9:00:26 PM
    Author     : Admin
--%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Plan</title>
        <style>
            body {
                background-color: #f8f9fa;
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
                <h2 class="text-center mb-4">Create Plan</h2>
                <form action="create" method="post">
                    <div class="mb-3">
                        <label for="startd" class="form-label">Start Date</label>
                        <input type="date" class="form-control" id="startd" name="startd" required>
                    </div>
                    <div class="mb-3">
                        <label for="endd" class="form-label">End Date</label>
                        <input type="date" class="form-control" id="endd" name="endd" required>
                    </div>
                    <div class="mb-3">
                        <label for="department" class="form-label">Department</label>
                        <select class="form-control" id="department" name="department" required>
                            <option selected disabled>Choose Department</option>
                            <c:forEach items="${depts}" var="dept">
                                <option value="${dept.did}">${dept.dname}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="d-grid">
                        <button type="submit" class="btn btn-success">Create Plan</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
