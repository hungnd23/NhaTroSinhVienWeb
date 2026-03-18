<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
    <title>Admin - User Management</title>

    <!-- MDBootstrap -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.css" rel="stylesheet"/>

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet"/>

</head>

<body style="background-color:#f5f7fa">

<div class="container mt-5">

    <!-- HEADER -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h2 class="fw-bold mb-0">User Management</h2>
            <p class="text-muted mb-0">Admin quản lý người dùng</p>
        </div>

        <!-- ADD BUTTON -->
        <button class="btn btn-primary">
            <i class="fas fa-plus"></i> Add User
        </button>
    </div>

    <!-- CARD -->
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

                    <!-- USER 1 -->
                    <tr>
                        <td>1</td>

                        <td class="fw-bold">admin</td>

                        <td>
                            <span class="badge bg-primary">ADMIN</span>
                        </td>

                        <td>
                            <span class="badge bg-success">Active</span>
                        </td>

                        <td>
                             <!-- EDIT -->
                             <button class="btn btn-info btn-sm me-2">
                             <i class="fas fa-edit"></i>
                             </button>

                             <!-- DELETE -->
                             <form action="DeleteUserServlet" method="post" style="display:inline;">
                             <input type="hidden" name="id" value="1">
                             <button class="btn btn-danger btn-sm"
                             onclick="return confirm('Bạn có chắc muốn xóa user này?')">
                             <i class="fas fa-trash"></i>
                             </button>
                             </form>
                            
                        </td>
                    </tr>

                    <!-- USER 2 -->
                    <tr>
                        <td>2</td>

                        <td class="fw-bold">user01</td>

                        <td>
                            <span class="badge bg-secondary">USER</span>
                        </td>

                        <td>
                            <span class="badge bg-success">Active</span>
                        </td>

                        <td>
                            <button class="btn btn-info btn-sm me-2">
                                <i class="fas fa-edit"></i>
                            </button>

                            <button class="btn btn-danger btn-sm">
                                <i class="fas fa-trash"></i>
                            </button>
                        </td>
                    </tr>

                </tbody>

            </table>

        </div>
    </div>

</div>

<!-- MDB JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.js"></script>

</body>
</html>