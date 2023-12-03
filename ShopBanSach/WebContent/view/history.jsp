<%@page import="model.User"%>
<%@page import="model.oderDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.orderDetail"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	List<orderDetail> od = new ArrayList<orderDetail>();
	od = oderDAO.getALLOrder();
	HttpSession sess = request.getSession();
	if(sess != null)
		if(sess.getAttribute("user")!=null){ //ngoặc 1
			User u = (User)sess.getAttribute("user");
%>
<table border="1">
		<tr>
			 <td >Đơn hàng</td>
			<td>Sản phẩm</td>
			<td>Số lượng</td>
			<td>Tình trạng đơn hàng</td>
			<td>Tổng tiền</td>
			<!-- <td >Tổng tiền</td> -->
		</tr>
	<% int i= 0; int id = 0; int sl=1; int stt = 0, k=0, tong = 0; int id_sl = 0;
	if(od.size() >0){ // ngoặc 2
		for(orderDetail o : od){ 
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
			<td><% if(o.getOd().getconfirm() == 1) {
				out.print("đã xác nhận");
				}
				else {
					out.print("chưa xác nhận"); 
				} %>
			 </td>
			<% }
			if(sl == k){ %>
				<td rowspan='<%= sl%>'> <%=tong %></td>
			<% } k=0; tong = 0;%>
			
			<!-- <td rowspan="3">Tổng tiền</td> -->
		</tr>
		<% }
		} //ngoặc3
		//ngoặc 2
	}%> 
	</table>
	
	<% 	} //ngoặc 1
		else{
			out.print("đăng nhập để xem lịch sử mua hàng");
		}
		
%>
</body>
</html>