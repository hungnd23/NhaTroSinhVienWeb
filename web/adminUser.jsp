<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
    <title>Admin - User Management</title>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.css" rel="stylesheet"/>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet"/>

</head>

<body style="background-color:#f5f7fa">

<div class="container mt-5">

    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h2 class="fw-bold mb-0">User Management</h2>
            <p class="text-muted mb-0">Admin quản lý người dùng</p>
        </div>

        <a href="adminUser?action=viewAdd" class="btn btn-primary">
            <i class="fas fa-plus"></i> Add User
        </a>
    </div>

    <div class="card shadow-4">
        <div class="card-body">

            <table class="table table-hover align-middle text-center">

                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Username</th>
                        <th>Role</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach items="${users}" var="u">
                        <tr>
                            <td>${u.userId}</td>

                            <td class="fw-bold">${u.username}</td>

                            <td>
                                <c:choose>
                                    <c:when test="${u.roleId == 1}">
                                        <span class="badge bg-primary">ADMIN</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge bg-info">USER</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>

                            <td>
                                <c:choose>
                                    <c:when test="${u.status}">
                                        <span class="badge bg-success">Active</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge bg-danger">Locked</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>

                            <td>
                                <form action="adminUser" method="post" style="display:inline;">
                                    <input type="hidden" name="id" value="${u.userId}">
                                    <c:choose>
                                        <c:when test="${u.status}">
<input type="hidden" name="action" value="lock">
                                            <button type="submit" class="btn btn-warning btn-sm me-2" title="Khóa">
                                                <i class="fas fa-lock"></i>
                                            </button>
                                        </c:when>
                                        <c:otherwise>
                                            <input type="hidden" name="action" value="unlock">
                                            <button type="submit" class="btn btn-success btn-sm me-2" title="Mở khóa">
                                                <i class="fas fa-lock-open"></i>
                                            </button>
                                        </c:otherwise>
                                    </c:choose>
                                </form>

                                <form action="adminUser" method="post" style="display:inline;">
                                    <input type="hidden" name="id" value="${u.userId}">
                                    <input type="hidden" name="action" value="delete">
                                    <button class="btn btn-danger btn-sm"
                                            onclick="return confirm('Bạn có chắc muốn xóa user này?')">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>

            </table>

        </div>
    </div>

</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.js"></script>

</body>
</html>