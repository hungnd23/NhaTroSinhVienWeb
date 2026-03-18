<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Hostel Management</title>

<!-- Font Awesome -->
<link
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
rel="stylesheet"
/>

<!-- Google Fonts -->
<link
href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
rel="stylesheet"
/>

<!-- MDBootstrap -->
<link
href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.css"
rel="stylesheet"
/>

</head>
<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.css"/>

<link rel="stylesheet"
href="${pageContext.request.contextPath}/css/style.css">
<body>

<!-- Navbar -->
<nav class="navbar fixed-top navbar-expand-lg navbar-light bg-white">
<div class="container">

<button
class="navbar-toggler"
type="button"
data-mdb-toggle="collapse"
data-mdb-target="#navbarSupportedContent1"
>
<i class="fas fa-bars"></i>
</button>

<div class="collapse navbar-collapse" id="navbarSupportedContent1">

<a class="navbar-brand mt-2 mt-sm-0" href="#">
<img
src="https://mdbcdn.b-cdn.net/img/logo/mdb-transaprent-noshadows.webp"
height="20"
/>
</a>

<ul class="navbar-nav me-auto mb-2 mb-lg-0">

<li class="nav-item mx-2">
    <a class="nav-link" href="home">Home</a>
</li>

<li class="nav-item mx-2">
    <a class="nav-link" href="home">Rooms</a>
</li>

<li class="nav-item mx-2">
    <a class="nav-link" href="#">Contact</a>
</li>

<!-- 🔥 FILTER -->
<li class="nav-item mx-2">
    <a class="nav-link text-success" href="home?status=available">Còn trống</a>
</li>

<li class="nav-item mx-2">
    <a class="nav-link text-danger" href="home?status=occupied">Đã thuê</a>
</li>

</ul>

    <ul class="navbar-nav ms-auto align-items-center">

    <!-- LOGIN -->
    <li class="nav-item me-3">
        <a class="nav-link d-flex align-items-center" href="login.jsp">
            <i class="fa fa-user me-1"></i> Login
        </a>
    </li>

    <!-- REGISTER -->
    <li class="nav-item">
        <a class="btn btn-success btn-sm" href="register.jsp">
            Register
        </a>
    </li>

</ul>
</div>

</div>
</nav>



</div>

</div>

<!-- Main -->
<main class="mt-5 pt-5">
<div class="container">

<h2 class="text-center mb-4">Danh sách phòng</h2>

<div class="row">

<c:forEach var="room" items="${listRoom}">

<div class="col-lg-3 col-md-6 mb-4">
  <div class="card">

    <div class="bg-image hover-zoom ripple">
      <img src="${room.image}" class="w-100"/>
    </div>

    <div class="card-body">
      <h5 class="card-title">${room.roomCode}</h5>

      <p>Price: ${room.price}</p>

      <p>Status: 
    <c:choose>
        <c:when test="${room.status == 'Còn trống'}">
            <span class="badge bg-success">Còn trống</span>
        </c:when>
        <c:otherwise>
            <span class="badge bg-danger">Đã thuê</span>
        </c:otherwise>
    </c:choose>
</p>
      
      <a href="room-detail?id=${room.roomId}" class="btn btn-primary">
        Xem chi tiết
      </a>
    </div>

  </div>
</div>

</c:forEach>

</div>
</main>

<!-- Footer -->
<footer class="text-center text-white mt-4" style="background-color:#607D8B">

<div class="text-center p-3">
© 2026 Hostel Management
</div>

</footer>

<!-- MDB JS -->
<script
src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.js">
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.js"></script>

<script src="${pageContext.request.contextPath}/js/script.js"></script>
</body>
</html>