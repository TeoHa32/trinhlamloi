package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.product;
import model.productDAO;

/**
 * Servlet implementation class productDetailServlet
 */

//@WebServlet("/productDetailServlet")
@WebServlet(urlPatterns = {
		"/products/cap1",
		"/products/cap2",
		"/products/trang",
		"/products/cap3",
		"/products/tieng-anh",
		"/products/tieng-nhat",
		"/products/truyen-tranh",
		"/products/ky-nang-song",
		"/products/tieu-thuyet",
		"/products/truyen-ngan",
		"/products/low-to-high",
		"/products/high-to-low",
		"/products/detail",
})
public class productDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public productDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		productDAO dao = new productDAO();
		String uri = request.getRequestURI();
		if(uri.contains("productDetailServlet")) {
			List<product> products = dao.getAll();
			request.setAttribute("products", products);
			request.getRequestDispatcher("/view/product.jsp").forward(request, response);
		}
		if(uri.contains("trang")) {
			List<product> products = dao.getAll();
			request.setAttribute("products", products);
			int id = Integer.parseInt(request.getParameter("id"));
			request.setAttribute("id_page", id);
			request.getRequestDispatcher("/view/product.jsp").forward(request, response);
		}
		if(uri.contains("cap1")) {
//			List<product> products = dao.getAllByCategory(1);
			List<product> products = dao.getAll();
			request.setAttribute("products", products);
			request.getRequestDispatcher("/view/product.jsp").forward(request, response);
			
		}
		else if(uri.contains("cap2")) {
			List<product> products = dao.getAllByCategory(2);
			request.setAttribute("products", products);
			request.getRequestDispatcher("/view/product.jsp").forward(request, response);
		}
		else if(uri.contains("cap3")) {
			List<product> products = dao.getAllByCategory(3);
			request.setAttribute("products", products);
			request.getRequestDispatcher("/view/product.jsp").forward(request, response);
		}
		else if(uri.contains("tieng-anh")) {
			List<product> products = dao.getAllByCategory(4);
			request.setAttribute("products", products);
			request.getRequestDispatcher("/view/product.jsp").forward(request, response);
		}
		else if(uri.contains("tieng-nhat")) {
			List<product> products = dao.getAllByCategory(5);
			request.setAttribute("products", products);
			request.getRequestDispatcher("/view/product.jsp").forward(request, response);
		}
		else if(uri.contains("truyen-tranh")) {
			List<product> products = dao.getAllByCategory(6);
			request.setAttribute("products", products);
			request.getRequestDispatcher("/view/product.jsp").forward(request, response);
		}
		else if(uri.contains("ky-nang-song")) {
			List<product> products = dao.getAllByCategory(7);
			request.setAttribute("products", products);
			request.getRequestDispatcher("/view/product.jsp").forward(request, response);
		}
		else if(uri.contains("tieu-thuyet")) {
			List<product> products = dao.getAllByCategory(8);
			request.setAttribute("products", products);
			request.getRequestDispatcher("/view/product.jsp").forward(request, response);
		}
		else if(uri.contains("truyen-ngan")) {
			List<product> products = dao.getAllByCategory(9);
			request.setAttribute("products", products);
			request.getRequestDispatcher("/view/product.jsp").forward(request, response);
		}
		else if(uri.contains("low-to-high")) {
			
			// Từ pageid = 1 từ đoạn này <a href="../products/low-to-high?pageid=1">Từ thấp đến cao<i class="fa-solid fa-check"></i></a>
			String pageidStr = request.getParameter("pageid");
			int pageid = Integer.parseInt(pageidStr);
			
			//mỗi trang 8 sp
			int count = 8;
			
			
			int numrows = dao.numRows();
			
			//tính số trang lớn nhất
			int maxPageid = (numrows / count ) ;
			
			if(pageid ==  1) {
				
			}
			else {
				//công thức phân trang
				pageid = pageid - 1;
				pageid = pageid * count + 1;
			}
			List<product> products = dao.sortPriceLowToHigh(pageid, count);
			
			//numpage bắt đầu là 1
			request.setAttribute("numpage", Integer.parseInt(pageidStr));
			/* request.setAttribute("uri",uri); */
			
			//gán số trang lớn nhất
			request.setAttribute("maxPageid", maxPageid);
			
			request.setAttribute("products", products);
			request.getRequestDispatcher("/view/product.jsp").forward(request, response);
		}
		else if(uri.contains("high-to-low")) {
			
			String pageidStr = request.getParameter("pageid");
			int pageid = Integer.parseInt(pageidStr);
			int count = 8;
			int numrows = dao.numRows();
			
			int maxPageid = (numrows / count ) ;
			
			if(pageid ==  1) {
				
			}
			else {
				pageid = pageid - 1;
				pageid = pageid * count + 1;
			}
			
			request.setAttribute("numpage", Integer.parseInt(pageidStr));
			request.setAttribute("maxPageid", maxPageid);
			
			List<product> products = dao.sortPriceHighToLow(pageid, count );
			request.setAttribute("products", products);
			request.getRequestDispatcher("/view/product.jsp").forward(request, response);
		}
		else if (uri.contains("detail")){
			String id = request.getParameter("id");
			product sp = new product();
			sp = dao.getDetail(id);
			request.setAttribute("sp", sp);
			request.getRequestDispatcher("/view/product.jsp").forward(request, response);
		}
	}

	public static void main(String[] args) {
		
	}
}
