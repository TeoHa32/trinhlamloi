package controller;


import java.io.IOException;
//import jakarta.servlet.ServletException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.mysql.cj.Session;
import model.User;
import model.Users;
import model.cartItem;

@WebServlet({"/accountServlet"})
public class accountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
		protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");
			switch(action) {
			case "login": this.doSignIn(req, resp); break;
			case "register" : this.doSignUp(req,resp); break;
			case "logout" : this.doLogout(req, resp); break;
			default: this.doPost(req, resp);
			}
		}
	private void doLogout(HttpServletRequest req, HttpServletResponse resp) {
		try {
			HttpSession session = req.getSession();
			if(session !=null) {
				session.removeAttribute("user");
				resp.sendRedirect("/ShopBanSach/view/login.jsp");
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		}
	private void doSignUp(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		String fullname = req.getParameter("fullname");
	String username = req.getParameter("username");
	String email = req.getParameter("email");
	String password = req.getParameter("password");
	String address = req.getParameter("address");
	int phone = Integer.parseInt(req.getParameter("phone"));
	User u = new User(username,password,email,address,2,phone,fullname);
	if(Users.findByUsername(username) == null) {
		if(Users.addAccount(u)>0 ) {
			if(Users.addUser(u)>0)
			resp.sendRedirect("/ShopBanSach/view/login.jsp");
		}
	}
	else {
		
		req.setAttribute("username", username);
		req.setAttribute("password", password);
		req.setAttribute("fullname", fullname);
		req.setAttribute("email", email);
		req.setAttribute("re_password", username);
		req.setAttribute("address", password);
		req.setAttribute("phone", phone);
		req.setAttribute("error", "Tên đăng nhập đã tồn tại!");
		req.getRequestDispatcher("/view/register.jsp").include(req, resp);
	}
	}
    private void doSignIn(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
    	HttpSession session = req.getSession();
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		try {
		User u = Users.findByUsername(username);
		if(u.getPassword().equals(password)) {
			HttpSession s = req.getSession();
			s.setAttribute("role_id", u.getRole_id());
			switch(u.getRole_id()) {
			case 1: 
				session.setAttribute("admin", u);
				resp.sendRedirect("/ShopBanSach/view/admin.jsp");
				
					break;
			case 2: 
				HttpSession sa = req.getSession();
				ArrayList<cartItem> cart_list = (ArrayList<cartItem>)sa.getAttribute("cart-list");
				if(cart_list!=null) {
					session.setAttribute("user", u);
					resp.sendRedirect("/ShopBanSach/view/order-detail.jsp");
				}
				else {
					session.setAttribute("user", u);
					resp.sendRedirect("/ShopBanSach/view/index.jsp");
				}
					break;
			case 3: 
				
				session.setAttribute("employee", u);
				resp.sendRedirect("/ShopBanSach/view/admin.jsp");
					break;
			}
		} else {
			req.setAttribute("username", username);
			req.setAttribute("password", password);
			req.setAttribute("error", "Sai mật khẩu");
			req.getRequestDispatcher("/view/login.jsp").include(req, resp);
		}
		} catch(Exception  e) {
			req.setAttribute("username", username);
			req.setAttribute("password", password);
			req.setAttribute("error", "Sai tên đăng nhập");
			req.getRequestDispatcher("/view/login.jsp").include(req, resp);
		}
	}

	public accountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
