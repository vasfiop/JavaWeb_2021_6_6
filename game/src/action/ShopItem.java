package action;

import java.io.IOException;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.CarService;
import service.CollectService;
import service.ShopService;

@WebServlet("/shop_item")
public class ShopItem extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ShopItem() {
		super();
	}

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("shopid");
		Map<String, String> shop = new ShopService().getShopByid(id);
		request.setAttribute("shop", shop);

		Map<String, String> user = (Map<String, String>) request.getSession().getAttribute("user");
		Map<String, String> car = new CarService().getCar(user.get("id"), id);
		Map<String, String> collect = new CollectService().getCollect(user.get("id"), id);

		request.setAttribute("car", car == null ? "0" : "1");
		request.setAttribute("collect", collect == null ? "0" : "1");

		request.getRequestDispatcher("/shop_item.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
