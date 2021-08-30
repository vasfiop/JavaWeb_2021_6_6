package cn.edu.neu.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.ForEach;

import cn.edu.neu.dao.TimeUtile;
import cn.edu.neu.service.CartService;
import cn.edu.neu.service.UserService;

@WebServlet("*.cart")
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CartController() {
		super();
	}

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String path = request.getServletPath();
		path = path.substring(path.lastIndexOf('/') + 1, path.indexOf('.'));
		if (path.equals("bugGoods")) {
//			确认购买页面
			Map<String, Object> user = (Map<String, Object>) request.getSession().getAttribute("user");
			String user_id = String.valueOf(user.get("user_id"));
			List<Map<String, Object>> address = UserService.getAddress(user_id);
			request.setAttribute("address", address);

			request.getRequestDispatcher("buy_goods.jsp").forward(request, response);
		} else if (path.equals("addCart")) {
//			提交订单
			Map<String, Object> carts = (Map<String, Object>) request.getSession().getAttribute("carts");
			Map<String, Object> user = (Map<String, Object>) request.getSession().getAttribute("user");
			String address_id = request.getParameter("address");
			String status = request.getParameter("status");
			Map<String, Object> address_nav = CartService.get_address_by_id(address_id);
			String address_str = address_nav.get("addr_province") + " " + address_nav.get("addr_city") + " "
					+ address_nav.get("addr_area") + " " + address_nav.get("addr_content") + " ("
					+ address_nav.get("addr_receiver") + "收) " + address_nav.get("addr_tel");
			new TimeUtile();
			String order_code = TimeUtile.get_order_code();
			String user_id = String.valueOf(user.get("user_id"));
			int order_id = new CartService().add_order(order_code, user_id, status, address_str);
			int r = new CartService().add_order_detail(order_id, carts);

			String allmoney = request.getParameter("allmoney");
			request.setAttribute("orderkey", "all");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		} else if (path.equals("allorder")) {
//			 全部订单
			Map<String, Object> user = (Map<String, Object>) request.getSession().getAttribute("user");
			List<Map<String, Object>> orders = new CartService().get_orders(String.valueOf(user.get("user_id")));
			request.setAttribute("orders", orders);
			request.setAttribute("orderkey", "all");
			request.getRequestDispatcher("all_order.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
