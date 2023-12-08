<%@page import="model.cartItem"%>
<%@page import="model.productDAO"%>
<%@page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang sản phẩm</title>
    <!-- BOOTSTRAP -->
    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <!-- ICON -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="icon" type="image/x-icon" href="../view/image/icon.png">
    <link rel="stylesheet" href="../view/css/products.css">
    <link rel="stylesheet" href="../view/css/style.css">
    <script src="../view/js/product.js"></script>
	<jsp:useBean id="p" class="model.productDAO" scope="request"></jsp:useBean>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<style>
	a{
		text-decoration:none
	}
</style>
<body>
<%
	ArrayList<cartItem> cart_list = (ArrayList<cartItem>)session.getAttribute("cart-list");	
	if(cart_list != null){
		request.setAttribute("cart_list", cart_list);
	}
%>
<%@include file="/view/template/header.jsp" %>

<%
	
%>
    <!-- BANNER -->
    <div class="container">
        <div class="banner d-flex">
            <div class="banner_txt d-flex align-items-center flex-column my-auto">
                <h2 class="banner_txt-title mb-5">TRANG SẢN PHẨM</h2>
                <div class="banner_txt-content mx-5 text-center">
                    <i class="fa fa-quote-left"></i>
                    <i class="banner_txt-content ">Không chỉ đơn thuần là cung cấp kiến thức hay những câu từ đơn nghĩa, vai trò của sách còn cao cả và vĩ đại hơn nhiều, mang đến cả giá trị tinh thần và vật chất cho người đọc</i>
                    <i class="fa fa-quote-right"></i>
                </div>
            </div>
              <img src="../view/image/b5.PNG" class="banner_img" alt="Banner trang sản phẩm">
          <!--   <img src="./image/b5.PNG" class="banner_img" alt="Banner trang sản phẩm"> -->

        </div>
    </div>
<div class="container-fluid py-5">
        <div class="container w-100">
            <div class="row">

                <!-- Tìm kiếm nâng cao -->
                <div class="col-3">
                    <div class="option_search">
                        <div class="option_search-title">
                            <h5>Tìm kiếm nâng cao</h5>
                        </div>
							<div class="option_search-list">
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="mau" id="mau">
                                        <label class="form-check-label" for="mau">Theo màu</label>
                                    </div>
                                </li>
                                <li class="list-group-item">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="duoi100" id="duoi100">
                                        <label class="form-check-label" for="duoi100">Sản phẩm dưới 100.000 VNĐ</label>
                                    </div>
                                </li>
                                <li class="list-group-item">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="tren100" id="tren100">
                                        <label class="form-check-label" for="tren100">Sản phẩm trên 100.000 VNĐ</label>
                                    </div>
                                </li>
                              </ul>
                        </div>
                    </div>
                </div>

                <!--Sản phẩm -->
                <div class="col-9 d-flex flex-column">
                    <!-- Danh mục sản phẩm -->
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="home-tab" data-bs-toggle="dropdown" data-bs-toggle="tab"  data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="false">Sách giáo khoa</button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="../products/cap1">Sách cấp 1</a></li>
                                <li><a class="dropdown-item" href="../products/cap2">Sách cấp 2</a></li>
                                <li><a class="dropdown-item" href="../products/cap3">Sách cấp 3</a></li>
                            </ul>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="profile-tab" data-bs-toggle="dropdown"  data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">Sách ngoại ngữ</button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="../products/tieng-anh">Sách tiếng Anh</a></li>
						<li><a class="dropdown-item" href="../products/tieng-nhat">Sách tiếng Nhật</a></li>
                            </ul>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="messages-tab"data-bs-toggle="dropdown"  data-bs-toggle="tab" data-bs-target="#messages" type="button" role="tab" aria-controls="messages" aria-selected="false">Sách thiếu nhi</button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="../products/truyen-tranh">Truyện tranh</a></li>
                                <li><a class="dropdown-item" href="../products/ky-nang-song">Kỹ năng sống</a></li>
                            </ul>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="settings-tab" data-bs-toggle="dropdown" data-bs-toggle="tab" data-bs-target="#settings" type="button" role="tab" aria-controls="settings" aria-selected="false">Văn học</button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="../products/tieu-thuyet">Tiểu thuyết</a></li>
                                <li><a class="dropdown-item" href="../products/truyen-ngan">Truyện ngắn</a></li>
                            </ul>
                        </li>
                    </ul>

                    <!-- Danh sách sản phẩm -->
                    <div class="d-flex flex-column">
                        <h3 class="product_title align-self-center mx-auto w-25 text-center pb-1 pt-5">SẢN PHẨM</h3>
                        <!-- Sắp xếp theo giá -->
                        <div class="dropdown d-flex flex-row-reverse"  onclick="sortByPrice()" >
                            <button type="button" class="btn btn-sort dropdown-toggle border border-2 " data-bs-toggle="dropdown"> Sắp xếp theo giá</button>
                            <ul class="dropdown-menu">
                                <li class="dropdown-item sort_low-to-high">
                                 <a href="../products/low-to-high?pageid=1">Từ thấp đến cao<i class="fa-solid fa-check"></i></a>
                           <%--          <a href="../products/${uri }">Từ thấp đến cao<i class="fa-solid fa-check"></i></a> --%>
                                </li>
                                <li class="dropdown-item sort_high-to-low">
                                    <a href="../products/high-to-low?pageid=1">Từ cao đến thấp<i class="fa-solid fa-check"></i></a>
                                </li>
                            </ul>
                        </div>                       	
                        <!-- Sản phẩm -->

                        <div class="row">
                        
	                       <c:forEach items="${products}" var="product">
	                        	 <div class="col-3 product">
									<div data-bs-toggle="modal" data-bs-target="#product" class="card mt-5" onclick="myfinction('${product.img }', '${product.name }','${product.price }','${product.publisher }','${product.description }','${product.author }')" >
	                                    <img class="card-img-top pt-3" src="../view/image/${product.img }" alt="Card image">
	                                    <div class="card-body px-">
	                                        <div class="line1 d-flex justify-content-between">
	                                            <b class="card-title ">${product.name}</b>
	                                            
	                                            <i class="fa-regular fa-heart align-self-center"></i>
	                                        </div>
	                                        <div class="line2 d-flex justify-content-between align-items-center">
	                                            <div class="product_price d-flex align-items-center">
	                                                <div class="product_price-original "><del>${product.id}</del></div>
	                                                  <div class="value">${product.id }</div>
	                                                <b class="product_price-current mx-1">${product.price }</b>
	                                            </div>
	                                            <i class="fa-solid fa-truck"></i>
	                                        </div>  											  
	                                    </div>	  	                                    	                                                                   
	                                
	                                </div>
	                           
								    
                                <!-- Chi tiết sản phẩm 1-->
                             
	                                <div class="modal fade" id="product">
	                                    <div class="modal-dialog">
	                                        <div class="modal-content pb-5" style="width: 800px; transform: translateX(-22%); margin-top: 15%;">
												<h1>${message }</h1>
	                                            <!-- Modal Header -->
	                                            <div class="modal-header">
	                                                <h4 class="modal-title">Chi tiết sản phẩm</h4>
												<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	                                            </div>
	                                            <!-- Modal body -->
	                                            <div class="modal-body">
	                                                <div class="product_detail d-flex">
	                                                    <img src="" alt="" class="product_detail-img align-self-center" id="img">
	                                                    <div class="product_detail-info">
	                                                        <div class="product_detail-name" id="name">Tên sản phẩm: </div>
	                                                        <div class="product_detail-author d-flex justify-content-between">
	                                                            <b>Tác giả:</b>
	                                                            <div class="product_detail-author-name " id="author"></div>
	                                                            </div>
	                                                        <div class="product_detail-type d-flex justify-content-between">
	                                                            <b>Nhà xuất bản:</b> 
	                                                            <div class="product_detail-type-name" id="publisher"></div>
	                                                        </div>
	                                                        <div class="product_detail-rating-price d-flex justify-content-between">
	                                                            <div class="product_detail-rating my-auto">
	                                                                <i class="fa-regular fa-star"></i>
	                                                                <i class="fa-regular fa-star"></i>
	                                                                <i class="fa-regular fa-star"></i>
	                                                                <i class="fa-regular fa-star"></i>
	                                                                <i class="fa-regular fa-star"></i>
	                                                            </div>
	                                                            <div class="product_detail-price d-flex flex-column align-items-end">
	                                                                <div class="product_price-original "><del>100.000</del></div>
	                                                                <b class="product_price-current " id="price"></b>
	                                                            </div>
	                                                        </div>
	                                                        <div class="product_detail-description">
	                                                            <b>Mô tả ngắn: </b>
															<div class="product_detail-description-txt">${sp.description}</div>
	                                                        </div>
	                                                        <div class="product_detail-action d-flex justify-content-around pt-5">
	                                                            <div class="product_detail-amount d-flex align-items-center" onclick="amount()">
	                                                                <i class="fa-solid fa-minus"></i>
	                                                                <input class="product_detail-amount-num" name="soluong" value="1">
	                                                                <i class="fa-solid fa-plus"></i>
	                                                            </div>																	                                                        
																  <form action="/ShopBanSach/cartServlet" method="get">
																    <input type="hidden" name="id" value="${product.id}">
																    <input type="submit" class="btn btn-primary" value="Thêm vào giỏ hàng" >
																  </form> 	                                                            
	                                                        </div>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
                            	</div>
	                        </c:forEach>
                        </div>
                         <!-- Phân trang -->
			                    
			                    
	                    <ul class="pagination align-self-center pt-5">
		                    <c:if test="${numpage == 0 }">
			                       
			                </c:if>
	                    	<c:if test="${numpage == 1 }">
		                        <li class="page-item disabled"><a class="page-link" href="#"><i class="fa-solid fa-chevron-left"></i></a></li>
		                        <li class="page-item"><a class="page-link" href="../products/low-to-high?${numpage}">1</a></li>
		                       	<li class="page-item disabled"><a class="page-link" href="../products/low-to-high">...</a></li>
		                        <li class="page-item"><a class="page-link" href="../products/low-to-high?${numpage + 1 }">${numpage + 1 }</a></li>
		                        <li class="page-item"><a class="page-link" href="../products/low-to-high?pageid=${numpage + 1 }"><i class="fa-solid fa-chevron-right"></i></a></li>
		                    </c:if>
		                    <c:if test="${numpage == maxPageid}">
		                        <li class="page-item"><a class="page-link" href="../products/low-to-high?pageid=${numpage - 1 }"><i class="fa-solid fa-chevron-left"></i></a></li>
		                       	<li class="page-item disabled"><a class="page-link" href="../products/low-to-high">...</a></li>
		                        <li class="page-item"><a class="page-link" href="../products/low-to-high?pageid=${numpage}">${numpage }</a></li>
		                        <li class="page-item disabled"><a class="page-link" href="#"><i class="fa-solid fa-chevron-right"></i></a></li>
		                    </c:if>
		                    <c:if test="${numpage > 1 && maxPageid > numpage }">
		                        <li class="page-item"><a class="page-link" href="../products/low-to-high?pageid=${numpage - 1 }"><i class="fa-solid fa-chevron-left"></i></a></li>
		                       	<li class="page-item"><a class="page-link" href="../products/low-to-high?${numpage - 1 }">${numpage - 1 }</a></li>
		                        <li class="page-item disabled"><a class="page-link" href="../products/low-to-high">...</a></li>
		                         <li class="page-item "><a class="page-link" href="../products/low-to-high?${numpage + 1 }">${numpage + 1 }</a></li>
		                        <li class="page-item"><a class="page-link" href="../products/low-to-high?pageid=${numpage + 1 }"><i class="fa-solid fa-chevron-right"></i></a></li>
		                    </c:if>
	                    </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="/view/template/footer.jsp" %>
    <script src="/ShopBanSach/view/js/account.js"></script>
    <script>
        var firstTabEl = document.querySelector('#myTab li:last-child a')
        var firstTab = new bootstrap.Tab(firstTabEl)
        firstTab.show()
        function myfinction(img, name, price,publisher, description,author ){
        	document.getElementById('img').src =  "../view/image/"+img
        		
        	document.getElementById('name').innerText = name
        	document.getElementById('publisher').innerText = publisher
        	document.getElementById('author').innerText = author
        	document.getElementById('price').innerText = price
        	//$('#name').text() = name;
        	//../view/image/${sp.img }
        	//alert(img);
        }

      </script>
</body>
</html>