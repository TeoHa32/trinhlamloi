<%@page import="model.User"%>
<%@page import="model.oderDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.orderDetail"%>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Lịch sử đơn hàng</h1>
<%
	String mess = request.getParameter("mess");
	if(mess!=null){%>
		<input type="hidden" id ="thongbao" value=<%=mess %> >
	<%}
	else {%>
		<input type="hidden" id ="thongbao" value="khong ton tai">
<%}
	List<orderDetail> od = new ArrayList<orderDetail>();
	od = oderDAO.getALLOrder();
	HttpSession sess = request.getSession();
	int ship = 0;
	if(sess != null)
		if(sess.getAttribute("user")!=null){ //ngoặc 1
			User u = (User)sess.getAttribute("user");
				
%>

	<% int i= 0; int id = 0; int sl=1; int stt = 0, k=0, tong = 0; int id_sl = 0;
	if(od.size() >0){ // ngoặc 2 %>
			<table border="1">
		<tr>
			 <td >Đơn hàng</td>
			<td>Sản phẩm</td>
			<td>Số lượng</td>
			<td>Tình trạng đơn hàng</td>
			<td>Địa chỉ</td>
			<td>Ngày đặt đơn</td>
			<td>Phí ship</td>
			<td>Giá tiền</td>
			<td>Tổng tiền</td>
			<!-- <td >Tổng tiền</td> -->
		</tr>
		<% for(orderDetail o : od){ 
			if(o.getOd().getUser_id().equals(u.getUsername())){
			
			// ngoặc3%>
			
			<tr>
			
			<% if(id != o.getOrder_id()){
				
				i = 0;
				stt++;
				sl=0;
			 }
			if(i == 0) {
				id = o.getOrder_id();
				for(orderDetail ode : od){
					if(id == ode.getOrder_id())
					{
						sl++;
						tong+= ode.getQuantity()*ode.getPrice();
						ship = Integer.parseInt(o.getOd().getShipping_method());
					}
						
				}
				i++;
				k=sl;
			%>
			<td rowspan='<%= sl%>'>đơn hàng <%=stt %></td>
			<%}  
			if(id == o.getOrder_id()){%>
				<td><%=o.getName() %></td>
				<td><%=o.getQuantity() %></td>
			
			<% }
			if(sl == k){ %>
				<td rowspan='<%= sl%>'><% if(o.getOd().getconfirm() == 1) {
				out.print("đã xác nhận");
				}
				else { out.print("chưa xác nhận | "); %>
				<a onclick="chuyentrang(<%=o.getOd().getId()%>)" >Huỷ đơn</a>
				<% } %>
			 </td>
				<td rowspan='<%= sl%>'><%if(!o.getOd().getDiachinhanhang().equals("")) 
											out.print(o.getOd().getDiachinhanhang());
										else out.print(oderDAO.diachi(u.getUsername()));
							%></td>
				<td rowspan='<%=sl%>'><% LocalDateTime localDateTime =o.getOd().getOrder_date(); 
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm, EEEE, dd-MM-yyyy");
		        String formattedDateTime = localDateTime.format(formatter);
		        out.print(formattedDateTime);
				%></td>
				<td rowspan='<%=sl%>'> <%=ship%></td>
				<td rowspan='<%= sl%>'> <%=tong %></td>
				<td rowspan='<%= sl%>'> <%=tong + ship%></td>
				
			<% } k=0; tong = 0;%>
			
			<!-- <td rowspan="3">Tổng tiền</td> -->
		</tr>
		<% }
		} //ngoặc3
		//ngoặc 2
	}%> 
	</table>
	<a href="/ShopBanSach/view/index.jsp">quay lại chủ</a>
	<% 	} //ngoặc 1
		else{
			out.print("đăng nhập để xem lịch sử mua hàng");
		}
		
%>
</body>
</html>
<script type="text/javascript">
	function chuyentrang(url) {
		
		var xacNhan = confirm("Bạn có chắc muốn xóa không không?");
		if (xacNhan) {
			window.location.href = "/ShopBanSach/historyServlet?idod="+url;
		} 
	}
	var mess = document.getElementById("thongbao").value
	if(mess == "successful"){
		alert("hủy đơn thành công");
	}
	else if(mess == "Unable"){
		alert("không thể hủy đơn")
	}
</script>