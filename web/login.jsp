<%-- 
    Document   : login
    Created on : 16 thg 3, 2026, 23:02:44
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>Admin Login - Dommitory Management</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>

/* Fix lỗi input tràn */
*{
box-sizing:border-box;
margin:0;
padding:0;
}

/* Background */

body{
font-family:Arial, Helvetica, sans-serif;
background:linear-gradient(135deg,#667eea,#764ba2);
height:100vh;
display:flex;
justify-content:center;
align-items:center;
}

/* Card */

.login-card{
background:white;
width:380px;
padding:40px;
border-radius:15px;
box-shadow:0 10px 25px rgba(0,0,0,0.2);
text-align:center;
}

/* Title */

.login-card h2{
margin-bottom:30px;
}

/* Input */

.input-group{
position:relative;
margin-bottom:20px;
}

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

/* Focus */

.input-group input:focus{
outline:none;
border-color:#667eea;
box-shadow:0 0 5px rgba(102,126,234,0.5);
}

/* Button */

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

.login-btn:hover{
background:#5563d6;
}

/* Footer */

.footer{
margin-top:20px;
font-size:13px;
color:#777;
}

</style>

</head>

<body>

<div class="login-card">

<h2>Admin Login</h2>

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

</body>
</html>