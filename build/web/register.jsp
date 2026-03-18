<%-- 
    Document   : register
    Created on : 17 thg 3, 2026, 09:17:58
    Author     : nguye
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>

    <!-- MDB -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.css" rel="stylesheet"/>

</head>

<body style="background: linear-gradient(135deg,#667eea,#764ba2); height:100vh;">

<div class="d-flex justify-content-center align-items-center h-100">

    <div class="card shadow-5" style="width:400px;">
        <div class="card-body p-4">

            <h3 class="text-center mb-4">Create Account</h3>

            <form action="RegisterServlet" method="post">

                <!-- USERNAME -->
                <div class="form-outline mb-3">
                    <input type="text" name="username" class="form-control" required />
                    <label class="form-label">Username</label>
                </div>

                <!-- PASSWORD -->
                <div class="form-outline mb-3">
                    <input type="password" name="password" class="form-control" required />
                    <label class="form-label">Password</label>
                </div>

                <!-- CONFIRM -->
                <div class="form-outline mb-3">
                    <input type="password" name="confirm" class="form-control" required />
                    <label class="form-label">Confirm Password</label>
                </div>

                <div style="display:flex; gap:10px;">

                 <!-- LOGIN -->
                 <button type="submit" class="login-btn" style="flex:1;">
                    Login
                 </button>

                    <!-- REGISTER -->
                    <a href="register.jsp" class="login-btn"
                       style="flex:1; text-align:center; background:#28a745; line-height:40px;">
                        Register
                    </a>

                </div>

            </form>

        </div>
    </div>

</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.js"></script>
</body>
</html>