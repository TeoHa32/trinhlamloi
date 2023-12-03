package controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;
import model.cartItem;
import model.oderDAO;
import model.order;
import model.orderDetail;
import model.productDAO;

/**
 * Servlet implementation class orderServlet
 */
//@WebServlet("/orderServlet")
@WebServlet(urlPatterns = {
		"/orderServlet",
		"/tietkiem",
		"/nhanh",
})
public class orderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public orderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * String uri = request.getRequestURI();
		 * if(uri.contains("tietkiem")) {
		 * int shipping = Integer.parseInt(request.getParameter("delivery"));
		 * request.setAttribute("shipping", shipping);
		 * request.getRequestDispatcher("/view/payment.jsp").forward(request, response);
		 * }
		 * if(uri.contains("nhanh")) {
		 * int shipping = Integer.parseInt(request.getParameter("delivery"));
		 * request.setAttribute("shipping", shipping);
		 * request.getRequestDispatcher("/view/payment.jsp").forward(request, response);
		 * }
		 * else {
		 */
			HttpSession add = request.getSession();
	    	ArrayList<cartItem> cart_list = (ArrayList<cartItem>)add.getAttribute("cart-list");
	    	List<cartItem> cartProduct= null;
	    	if(cart_list != null){
	    		productDAO pDAO = new productDAO();
	    		cartProduct= productDAO.getCartProducts(cart_list);
	    		request.setAttribute("cart_list", cart_list);
	    	}
	    	HttpSession se = request.getSession();
	    	String shipping = request.getParameter("delivery");
	    	LocalDateTime localDateTime = LocalDateTime.now();
	    	User u = (User) se.getAttribute("user");
	    	//order od = new order(u.getUsername(), localDateTime, 0,shipping);
	    	order od = new order(u.getUsername(), localDateTime, 0, shipping);
	    	int a = oderDAO.addorder(od);
	    	if(a> 0) {
	    		for (cartItem c : cartProduct){
	    			orderDetail d = new orderDetail(od.getId(), od);
	    			d.setId(c.getId());
	    			d.setQuantity(c.getQuantity());
	    			d.setPrice(c.getPrice());
	       		 	int b = oderDAO.addorderdetail(od, d);
	        	}
	    		
	    	}
	    	try {
				HttpSession session = request.getSession();
				if(session !=null) {
				
						session.removeAttribute("cart-list");
						request.getRequestDispatcher("/view/index.jsp").forward(request, response);
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	//	}
    	//request.getRequestDispatcher("/view/index.jsp").forward(request, response);
    	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
