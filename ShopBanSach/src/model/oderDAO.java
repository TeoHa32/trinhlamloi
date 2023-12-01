package model;

import java.sql.Connection;
import java.sql.ResultSet;
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
	
}
