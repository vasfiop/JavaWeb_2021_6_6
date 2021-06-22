package action;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ShopService;

@WebServlet("/shop_item")
public class ShopItem extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ShopItem() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("shopid");
		Map<String, String> shop = new ShopService().getShopByid(id);
		request.setAttribute("shop", shop);

		request.getRequestDispatcher("/shop_item.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
