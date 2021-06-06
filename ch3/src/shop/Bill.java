package shop;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Bill
 */
@WebServlet("/shop/bill")
public class Bill extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Bill() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		相应输出
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

//		从session读取用户名
		String un = (String) request.getSession().getAttribute("用户名");

//		从session读取已购商品
		String[] goods = (String[]) request.getSession().getAttribute("已购商品");

//		输出用户名购买的商品
		out.println("<h3>" + un + "所购买的商品为: ");
		if (goods != null) {
			for (String s : goods) {
				out.println(s + " ");
			}
			out.println(".</h3>");
		}
		out.println("<a href=logout>退出</a>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
