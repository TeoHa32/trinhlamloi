package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class oderDAO {
	
	public static int addorder(order d) {
		String sql = "INSERT INTO orders (user_id, order_date, confirm, payments, shipping_method) VALUES ('"+d.getUser_id()+"','"+d.getOrder_date()+"','"+d.getconfirm()+"','sau khi nhan hang','"+d.getShipping_method()+"')";
		try {
			Connection con = DBconnect.getConnection();
			Statement s= con.createStatement();
			int i = s.executeUpdate(sql);
			return i;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	
	}
	public static int addorderdetail(order d, orderDetail r) {
		
		String string ="SELECT 	id FROM orders ORDER BY id DESC LIMIT 1";
		try {
			Connection con = DBconnect.getConnection();
			Statement s= con.createStatement();
			ResultSet resultSet = s.executeQuery(string);
			int i = 0;
			while(resultSet.next()) {
				i = resultSet.getInt("id");
			}
			int j =0;
			if(i>0) {
				String sql1 = "INSERT INTO order_detail (order_id, product_id, quantity, price) VALUES ('"+i+"','"+r.getId()+"','"+r.getQuantity()+"','"+r.getPrice()+"')";
				 j =s.executeUpdate(sql1);
			}
			return j;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	public static List<orderDetail> getALLOrder(){
		List<orderDetail> o = new ArrayList<orderDetail>();
		String sql = "SELECT * FROM orders INNER JOIN order_detail ON orders.id = order_detail.order_id JOIN products ON order_detail.product_id = products.id;";
		try {
			Connection con = DBconnect.getConnection();
			Statement s= con.createStatement();
			ResultSet resultSet = s.executeQuery(sql);
			
			while(resultSet.next()) {
				orderDetail od = new orderDetail();
				od.setId_od(resultSet.getInt("id"));
				od.setOrder_id(resultSet.getInt("order_id"));
				od.setId(resultSet.getInt("product_id"));
				od.setName(resultSet.getString("name"));
				od.setQuantity(resultSet.getInt("quantity"));
				od.setPrice(resultSet.getDouble("price"));
				order Order = new order();
				Order.setUser_id(resultSet.getString("user_id"));
				Order.setConfirm(resultSet.getInt("confirm"));
				od.setOd(Order);
				od.setQuantity(resultSet.getInt("quantity"));
				
				o.add(od);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return o;
	}
	public static void main(String[] args) {
		System.out.println(oderDAO.getALLOrder().size());
	}
}
