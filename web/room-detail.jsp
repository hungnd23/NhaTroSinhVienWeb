<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>

<title>Room Detail</title>

<link
href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.css"
rel="stylesheet"
/>

</head>

<body>

<div class="container mt-5">

<h2 class="text-center mb-4">Room Detail</h2>

<div class="row">

<!-- Ảnh phòng -->
<div class="col-md-6">

<img src="${room.image}" class="img-fluid rounded"/>

</div>


<!-- Thông tin phòng -->
<div class="col-md-6">

<h3>${room.roomCode}</h3>

<hr>

<p><b>Price:</b> ${room.price} VND</p>

<p><b>Area:</b> ${room.area} m²</p>

<p><b>Max People:</b> ${room.maxPeople}</p>

<p><b>Status:</b> ${room.status}</p>

<c:choose>

<c:when test="${room.status == 'Còn trống'}">

<a href="rent-room?id=${room.roomId}" class="btn btn-success mt-3">
THUÊ PHÒNG
</a>

</c:when>

<c:otherwise>

<button class="btn btn-danger mt-3" disabled>
PHÒNG ĐÃ ĐƯỢC THUÊ
</button>

</c:otherwise>

</c:choose>

<a href="home" class="btn btn-secondary mt-3">
QUAY LẠI
</a>

</div>

</div>

<!-- Description -->
<div class="row mt-4">

<div class="col-md-12">

<div class="card">

<div class="card-body">

<h4>Mô tả phòng</h4>

<p>${room.description}</p>

</div>

</div>

</div>

</div>

</div>

</body>
</html>