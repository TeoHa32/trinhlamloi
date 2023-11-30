<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quên mật khẩu</title>
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./fonts/fontawesome/css/all.css">
</head>
<body>
    <div id="wrapper">
        <%@include file="/view/template/header.jsp" %>
        <div id="wpcontent-user-forgot">
            <div class="forgot-banner">
                <img src="./image/fogot-password.png" alt="">
            </div>
            <div class="forgot-form">
                <h1>Đổi mật khẩu</h1>
                <form action="">
                    
                    <div>
                        <label for="email">Email</label>
                        <input type="email" name="email" id="email" placeholder="Email?">
                    </div>
                    <div class="pw-new">
                        <label for="password">Mật khẩu mới</label>
                        <input type="password" name="password-new" id="password" placeholder="******">
                        
                    </div>
                    <div class="pw-new">
                        <label for="password">Nhập lại khẩu</label>
                        <input type="password" name="password-new" id="password" placeholder="******">
                        
                    </div>
                    <div>
                        <label for="otp">Mã OTP</label>
                        <input type="text" name="otp" id="otp" placeholder="Mã OTP?">
                    </div>
                    <div class="btn-user-forgot"><input type="submit" name="action" value="Xác nhận"></div>
                </form>
            </div>
        </div>
        <!-- FOOTER -->
  <!-- <%@include file="/view/template/header.jsp" %> -->      
    </div>
    <script src="/ShopBanSach/view/js/account.js"></script>
</body>
</html>