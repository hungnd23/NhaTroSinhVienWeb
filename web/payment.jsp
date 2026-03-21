<%@page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Thanh toán</title>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.css" rel="stylesheet"/>

    <style>
        .payment-container {
            max-width: 800px;
            margin: 40px auto;
        }
        .qr-img {
            width: 250px;
        }
    </style>
</head>
<body>

<div class="container payment-container">

    <h2 class="text-center mb-4">Thanh toán phòng</h2>

    <div class="card p-4">

        <!-- Room info -->
        <div class="row">
            <div class="col-md-6">
                <img src="${room.image}" class="img-fluid rounded"/>
            </div>

            <div class="col-md-6">
                <h4>Phòng: ${room.roomCode}</h4>
                <h5 class="text-danger">Giá: ${room.price} VND</h5>
            </div>
        </div>

        <hr>

        <!-- QR -->
        <div class="text-center">
            <h5>Quét mã QR để thanh toán</h5>

            <!-- QR fake demo -->
            <img src="https://img.vietqr.io/image/MB-123456789-compact.png?amount=${room.price}&addInfo=Thanh toan phong ${room.roomCode}"
                 class="qr-img mt-3"/>
        </div>

        <hr>

        <!-- Buttons -->
        <div class="text-center mt-4">
            <form action="completePayment" method="post">
                <input type="hidden" name="roomId" value="${room.roomId}"/>

                <button class="btn btn-success">Hoàn tất thanh toán</button>
                <a href="home" class="btn btn-secondary">Trở lại</a>
            </form>
        </div>

    </div>

</div>

</body>
</html>