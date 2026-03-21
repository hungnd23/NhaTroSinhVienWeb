<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- Thêm thư viện JSTL để kiểm tra điều kiện --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login - Dommitory Management</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <style>
        /* Fix lỗi input tràn */
        *{ box-sizing:border-box; margin:0; padding:0; }

        body{
            font-family:Arial, Helvetica, sans-serif;
            background:linear-gradient(135deg,#667eea,#764ba2);
            height:100vh;
            display:flex;
            justify-content:center;
            align-items:center;
        }

        .login-card{
            background:white;
            width:380px;
            padding:40px;
            border-radius:15px;
            box-shadow:0 10px 25px rgba(0,0,0,0.2);
            text-align:center;
        }

        .login-card h2{ margin-bottom:30px; }

        .input-group{ position:relative; margin-bottom:20px; }
        .input-group i{
            position:absolute;
            top:50%;
            left:12px;
            transform:translateY(-50%);
            color:#888;
        }

        .input-group input{
            width:100%;
            padding:12px 12px 12px 40px;
            border-radius:8px;
            border:1px solid #ccc;
            font-size:15px;
        }

        .input-group input:focus{
            outline:none;
            border-color:#667eea;
            box-shadow:0 0 5px rgba(102,126,234,0.5);
        }

        .login-btn{
            width:100%;
            padding:12px;
            border:none;
            border-radius:8px;
            background:#667eea;
            color:white;
            font-size:16px;
            cursor:pointer;
            transition:0.3s;
        }

        .login-btn:hover{ background:#5563d6; }

        .footer{ margin-top:20px; font-size:13px; color:#777; }
        
        .error-msg {
            color: red;
            margin-bottom: 15px;
            font-size: 14px;
        }
    </style>
</head>
<body>

<div class="login-card">
    <h2>Admin Login</h2>
    <c:if test="${param.error == 'login_required'}">
        <div class="error-msg">
            <i class="fas fa-exclamation-circle"></i>
            Bạn cần đăng nhập để thuê phòng!
        </div>
    </c:if>
    <%
        String error = (String)request.getAttribute("error");
        if (error != null && !error.isEmpty()) {
    %>
        <div class="error-msg">
            <i class="fas fa-exclamation-circle"></i> <%= error %>
        </div>
    <% } %>

    <form action="login" method="post">
        <div class="input-group">
            <i class="fa fa-user"></i>
            <input type="text" name="username" placeholder="Username" required>
        </div>

        <div class="input-group">
            <i class="fa fa-lock"></i>
            <input type="password" name="password" placeholder="Password" required>
        </div>
<button type="submit" class="login-btn">Login</button>
    </form>

    <div class="footer">
        Hostel Management System
    </div>
</div>

<c:if test="${not empty message}">
    <script>
        Swal.fire({
            title: 'Thành công!',
            text: '${message}',
            icon: 'success',
            timer: 2500, /* Hiện thông báo trong 2.5 giây */
            timerProgressBar: true,
            showConfirmButton: false
        }).then(() => {
            // Sau khi hết thời gian, tự động load lại trang login sạch
            window.location.href = "login.jsp"; 
        });
    </script>
</c:if>

</body>
</html>