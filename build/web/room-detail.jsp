<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Room Detail - Hostel Management</title>
    
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.css" rel="stylesheet"/>
    
    <style>
        /* CSS đồng bộ thanh điều hướng */
        .navbar-nav .nav-link {
            font-weight: 500;
            color: #555 !important;
        }
        .nav-status-available {
            color: #28a745 !important; /* Xanh lá */
        }
        .nav-status-rented {
            color: #dc3545 !important; /* Đỏ */
        }
        /* Chỉnh ảnh phòng cho đều */
        .room-img {
            width: 100%;
            height: 400px;
            object-fit: cover;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }
        .price-tag {
            color: #d32f2f;
            font-size: 1.5rem;
            font-weight: bold;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light shadow-0 border-bottom">
    <div class="container">
        <a class="navbar-brand" href="home">
            <span style="color: #1266f1; font-weight: bold;">M</span><span style="color: #4B0082; font-weight: bold;">DB</span>
        </a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item mx-2"><a class="nav-link" href="home">Home</a></li>
                
                <li class="nav-item mx-2"><a class="nav-link" href="#">Contact</a></li>
                
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-5">
    <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="home">Trang chủ</a></li>
        <li class="breadcrumb-item active">${room.roomCode}</li>
      </ol>
    </nav>

    <div class="row">
        <div class="col-md-6">
            <img src="${room.image}" class="room-img" alt="Room Image"/>
        </div>

        <div class="col-md-6">
            <h2 class="fw-bold">${room.roomCode}</h2>
            <p class="text-muted">Mã phòng: #RM-${room.roomId}</p>
            <hr>
            
            <p class="price-tag">${room.price} VND <span class="text-muted" style="font-size: 1rem;">/ tháng</span></p>
            <p><b>Diện tích:</b> ${room.area} m²</p>
            <p><b>Số người tối đa:</b> ${room.maxPeople} người</p>
            <p><b>Trạng thái:</b> 
                <span class="badge ${room.status == 'Còn trống' ? 'badge-success' : 'badge-danger'}">
                    ${room.status}
                </span>
            </p>

            <div class="mt-4">
                <c:choose>
                    <c:when test="${room.status == 'Còn trống'}">
                        <a href="payment?roomId=${room.roomId}" class="btn btn-primary">
                            THUÊ PHÒNG
                        </a>
                    </c:when>
                    <c:otherwise>
                        <button class="btn btn-danger btn-lg shadow-0" disabled>
                            PHÒNG ĐÃ CÓ NGƯỜI
                        </button>
                    </c:otherwise>
                </c:choose>
                
                <a href="home" class="btn btn-outline-secondary btn-lg shadow-0 ms-2">
                    QUAY LẠI
                </a>
            </div>
        </div>
    </div>

    <div class="row mt-5">
        <div class="col-md-12">
            <div class="card shadow-0 border">
                <div class="card-body">
                    <h4 class="card-title border-bottom pb-2">Mô tả chi tiết</h4>
                    <p class="card-text" style="line-height: 1.8;">
                        ${room.description}
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.js"></script>
</body>
</html>