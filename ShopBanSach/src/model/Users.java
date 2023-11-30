package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

//import org.omg.PortableServer.POAManagerPackage.State;

public class Users {
	public static void main(String[] args) {
//		User u = Users.findByUsername("TaiHa");
//		System.out.println(u.getRole_id());
//		System.out.println(u.getPassword()+ u.getAddress());
//		User u = new User("132","123","132","123",2,123,"1");
//		Users.addAccount(u);
//		Users.addUser(u);
		ArrayList<User> list = Users.listUser();
		for(User u1 : list) {
			System.out.println(u1.getUsername());
		}
		
	}
	public static ArrayList<User> listUser(){
		ArrayList<User> list = new ArrayList<>();
		try {
			Connection con = DBconnect.getConnection();
			String sql = "SELECT * FROM account a JOIN users u ON a.username LIKE u.id";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				User u =  new User();
				u.setUsername(rs.getString("a.username"));
				u.setPassword(rs.getString("a.password"));
				u.setEmail(rs.getString("u.email"));
				u.setName(rs.getString("u.name"));
				u.setPhone(rs.getInt("u.phone"));
				u.setAddress(rs.getString("u.address"));
				u.setRole_id(rs.getInt("a.role_id"));
				list.add(u);
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public static int addUser(User u) {
		Connection con = DBconnect.getConnection();
		int i=0;
		try {
			if(con!=null) {
				String sql = "INSERT INTO users(id , name , email , phone , address ) VALUES ("+ u.getUsername()+" , "+u.getName()+" , "+u.getEmail()+" , "+u.getPhone()+" , "+u.getAddress()+ ")";
//				String sql = "INSERT INTO users(id , name , email , phone , address ) VALUES ('1' , '123' , '123' , "+123+" , 123)";
				Statement st1 = con.createStatement();
				i = st1.executeUpdate(sql);
				return i;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	public static int addAccount(User u) {
		Connection con = DBconnect.getConnection();
		int i=0;
		try {
			if(con!=null) {
				String sql = "INSERT INTO account(username , password , role_id) VALUES ("+ u.getUsername()+" , "+ u.getPassword()+" , "+2+")";
				Statement st = con.createStatement();
				
				i = st.executeUpdate(sql);
				return i;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	public static User findByUsername(String username) {
		Connection	con  =  DBconnect.getConnection();
		User u = new User();
		try {
		if(con != null) {
			String sql = "SELECT * FROM  users JOIN account ON users.id LIKE account.username  WHERE account.username  LIKE '"+username+"'";
			Statement ps = con.createStatement();
			ResultSet rs = ps.executeQuery(sql);
			while(rs.next()) {
				u.setUsername(rs.getString("users.id"));
				u.setPassword(rs.getString("account.password"));
				u.setRole_id(rs.getInt("account.role_id"));
				u.setName(rs.getString("users.name"));
				u.setEmail(rs.getString("users.email"));
				u.setPhone(rs.getInt("users.phone"));
				u.setAddress(rs.getString("users.address"));
				return u;
			}
		}
		else System.out.println("Lỗi truy vấn");
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return null;	
		
	}
}
