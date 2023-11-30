package model;

import java.sql.Connection;
import java.sql.Statement;
import java.time.LocalDateTime;

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
		String sql1 = "INSERT INTO order_detail (order_id, product_id, quantity, price) VALUES ('6','6','"+r.getQuantity()+"','"+r.getPrice()+"')";
		try {
			Connection con = DBconnect.getConnection();
			Statement s= con.createStatement();
			int j =s.executeUpdate(sql1);
			return j;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
//	public static void main(String[] args) {
//		LocalDateTime localDateTime = LocalDateTime.now();
//		order d = new order("trinh123",localDateTime, 0);
//		orderDetail o = new orderDetail(d.getId(), d);
//		o.setQuantity(10);
//		o.setPrice(100);
//		System.out.println(d.getId()+"uvu");
//		System.out.println(oderDAO.addorder(d, o));
//	}
}
