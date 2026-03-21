<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin - Add New User</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.css" rel="stylesheet"/>
</head>
<body style="background-color:#f5f7fa">
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow-4">
                <div class="card-header bg-primary text-white">
                    <h4 class="mb-0">Create New Account</h4>
                </div>
                <div class="card-body">
                    <form action="adminUser" method="post">
                        <input type="hidden" name="action" value="add">

                        <div class="form-outline mb-4 border border-1">
                            <input type="text" name="username" class="form-control" required />
                            <label class="form-label">Username</label>
                        </div>

                        <div class="form-outline mb-4 border border-1">
                            <input type="password" name="password" class="form-control" required />
                            <label class="form-label">Password</label>
                        </div>

                        <div class="d-flex justify-content-between">
                            <a href="adminUser" class="btn btn-secondary">Back to List</a>
                            <button type="submit" class="btn btn-primary">Create User</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.js"></script>
</body>
</html>