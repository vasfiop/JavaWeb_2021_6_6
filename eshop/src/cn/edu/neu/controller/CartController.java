package cn.edu.neu.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
			chack_return(new CartService().add_order_detail(order_id, carts));

			request.getSession().removeAttribute("carts");
			request.getSession().removeAttribute("cartcount");
			request.setAttribute("orderkey", "all");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		} else if (path.equals("allorder")) {
//			 全部订单
			Map<String, Object> user = (Map<String, Object>) request.getSession().getAttribute("user");
			List<Map<String, Object>> orders = new CartService().get_orders(String.valueOf(user.get("user_id")));
			request.setAttribute("orders", orders);
			request.setAttribute("orderkey", "all");
			request.getRequestDispatcher("all_order.jsp").forward(request, response);
		} else if (path.equals("payment")) {
//			去付款
			String order_id = request.getParameter("order_id");
			chack_return(new CartService().change_order_mode(order_id, "1"));
			request.setAttribute("orderkey", "all");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		} else if (path.equals("cancel")) {
//			取消订单
			response.setContentType("text/json;charset=utf-8");
			PrintWriter out = response.getWriter();

			String order_id = request.getParameter("order_id");

			chack_return(new CartService().change_order_mode(order_id, "3"));

			out.print("{\"order_id\":" + order_id + "}");

			out.flush();
		} else if (path.equals("del")) {
//			删除订单
			response.setContentType("text/json;charset=utf-8");
			PrintWriter out = response.getWriter();

			String order_id = request.getParameter("order_id");

			chack_return(new CartService().del_orderdetail(order_id));
			chack_return(new CartService().del_order(order_id));

			out.print("{\"order_id\":" + order_id + "}");

			out.flush();
		} else if (path.equals("waitorder")) {
//			代付订单
			Map<String, Object> user = (Map<String, Object>) request.getSession().getAttribute("user");
			String user_id = String.valueOf(user.get("user_id"));
			List<Map<String, Object>> orders = new CartService().get_wait_orders(user_id);

			request.setAttribute("orders", orders);
			request.setAttribute("orderkey", "wait");
			request.getRequestDispatcher("wait_order.jsp").forward(request, response);
		} else if (path.equals("success")) {
//			交易成功订单
			Map<String, Object> user = (Map<String, Object>) request.getSession().getAttribute("user");
			String user_id = String.valueOf(user.get("user_id"));
			List<Map<String, Object>> orders = new CartService().get_success_orders(user_id);

			request.setAttribute("orders", orders);
			request.setAttribute("orderkey", "success");
			request.getRequestDispatcher("success_order.jsp").forward(request, response);
		}
	}

	private void chack_return(int r) {
		if (r == 0)
			System.out.println("TIME::" + new TimeUtile().get_Time() + "WARGING!::数据库修改失败");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
