<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./fonts/fontawesome/css/all.css">
</head>
<body>
    <div id="wrapper">
        <!-- HEADER -->
        <%@include file="/view/template/header.jsp" %>
        <div id="wpcontent-user">
            <div class="content-user-banner">
                <div class="banner-user">
                    <img src="./image/login.png" alt="">
                </div>
            </div>
            <div class="content-user-form ">
                <h1>Đăng ký</h1>
                <form action="/ShopBanSach/accountServlet">
                    <div>
                        <label for="fullname">Họ và tên</label>
                        <input type="text" name="fullname" id="fullname" placeholder="Họ và tên?">
                    </div>
                    
                    <div>
                        <label for="email">Email</label>
                        <input type="email" name="email" id="email" placeholder="Email?">
                    </div>
                    <div>
                        <label for="address">Địa chỉ</label>
                        <input type="text" name="address" id="address" placeholder="Địa chỉ?">
                    </div>
                    <div>
                        <label for="phone">Số điện thoại</label>
                        <input type="number" name="phone" id="phone" placeholder="Phone?">
                    </div>
                    <div>
                        <label for="username">Tên đăng nhập</label>
                        <input type="text" name="username" id="username" placeholder="Username?">
                    </div>
                    
                    <div class="pw">
                        <label for="password">Mật khẩu</label>
                        <input type="password" name="password-reg" id="password" placeholder="******">
                        <i class="fa-solid fa-eye-slash"></i>
                    </div>
                    <div class="pw">
                        <label for="password">Nhập lại khẩu</label>
                        <input type="password" name="password-reg-re" id="password" placeholder="******">
                        <i class="fa-solid fa-eye-slash"></i>
                    </div>
                    <div class="btn-user"><input type="submit" name="action" value="register"></div>
                </form>
               
            </div>
            
        </div>
        <!-- FOOTER -->
        <%@include file="/view/template/footer.jsp" %>
    </div>
</body>
</html>