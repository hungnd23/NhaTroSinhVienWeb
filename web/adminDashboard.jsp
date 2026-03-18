<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<title>Admin Dashboard</title>

<style>

body{
margin:0;
font-family:Arial, Helvetica, sans-serif;
background:#f4f6f9;
}

/* Sidebar */

.sidebar{
position:fixed;
left:0;
top:0;
width:220px;
height:100%;
background:#2f4050;
padding-top:20px;
}

.sidebar h2{
color:white;
text-align:center;
margin-bottom:30px;
}

.sidebar a{
display:block;
color:white;
padding:15px;
text-decoration:none;
transition:0.3s;
}

.sidebar a:hover{
background:#1ab394;
}

/* Header */

.header{
margin-left:220px;
height:60px;
background:white;
display:flex;
justify-content:flex-end;
align-items:center;
padding-right:30px;
box-shadow:0 2px 5px rgba(0,0,0,0.1);
}

.logout{
background:#e74c3c;
color:white;
padding:8px 15px;
text-decoration:none;
border-radius:5px;
}

/* Main content */

.main{
margin-left:220px;
padding:30px;
}

.cards{
display:flex;
gap:20px;
margin-top:20px;
}

.card{
background:white;
padding:30px;
border-radius:10px;
box-shadow:0 2px 10px rgba(0,0,0,0.1);
flex:1;
text-align:center;
transition:0.3s;
}

.card:hover{
transform:translateY(-5px);
}

.card a{
text-decoration:none;
color:#1ab394;
font-weight:bold;
font-size:18px;
}

</style>

</head>

<body>

<!-- Sidebar -->

<div class="sidebar">

<h2>Admin Panel</h2>

<a href="adminDashboard">Dashboard</a>

<a href="adminUser">Manage Users</a>

<a href="adminRoom">Manage Rooms</a>

</div>


<!-- Header -->

<div class="header">

<a class="logout" href="logout">Logout</a>

</div>


<!-- Main Content -->

<div class="main">

<h1>Welcome Admin</h1>

<p>System Management Dashboard</p>

<div class="cards">

<div class="card">
<h2>Users</h2>
<p>Manage system users</p>
<a href="adminUser">Go to Users</a>
</div>

<div class="card">
<h2>Rooms</h2>
<p>Manage rental rooms</p>
<a href="adminRoom">Go to Rooms</a>
</div>

</div>

</div>

</body>

</html>