<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/view/css/style.css">
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/view/css/reset.css">
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/view//fonts/fontawesome/css/all.css">
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./fonts/fontawesome/css/all.css">
</head>
<body>

    <div id="wrapper">
        <!-- HEADER -->
        <%@include file="/view/template/header.jsp" %>
        <div id="wpcontent-user">
		<c:choose>
    <c:when test="${not empty sessionScope.user}">
        <h2>Bạn đã đăng nhập rồi!!</h2>
    </c:when>
    <c:otherwise>
        <div class="content-user-banner">
                <div class="menu-profile">
					<img
						src="<%if( request.getContextPath()!=null) out.print(request.getContextPath()); %>/view/image/login.png"
						alt="">
				</div>
            </div>
            <div class="content-user-form ">
                
                <form action="/ShopBanSach/accountServlet" method="post">
                    <h1>Hồ sơ của tôi</h1>
                <p class="error">${error } </p>
                    <div>
                        <label for="username">Tên đăng nhập</label>
                        <input type="text" name="username" id="username"  value="" readonly>
                    </div>
                   <div>
                        <label for="email">Email</label>
                        <input type="text" name="email" id="email"  value="" >
                    </div>
                    <div>
                        <label for="phone">Số điện thoại</label>
                        <input type="text" name="phone" id="phone"  value="" >
                    </div>
                    <div>
                        <label for="address">Địa chỉ</label>
                        <input type="text" name="address" id="address"  value="" >
                    </div>
                    <div class="btn-user"><input type="submit" name="action" value="Cập nhật"></div>
                </form>
                <div class="user-bottom">
                    <div class="forgot-password"><a href="/ShopBanSach/view/forgot-password.jsp">Quên mật khẩu?</a></div>
                    <div class="register-link"><a href="/ShopBanSach/view/register.jsp">Đăng ký</a></div>
                </div>
    </c:otherwise>
	</c:choose>
            </div>
        </div>
        
        <!-- FOOTER -->
        <%@include file="/view/template/footer.jsp" %>
    <script src="/ShopBanSach/view/js/account.js"></script>
</body>
</html>

