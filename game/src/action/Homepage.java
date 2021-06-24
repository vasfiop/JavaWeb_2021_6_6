package action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.ShopService;
import service.SortService;
import service.TypeService;

@WebServlet("/homepage")
public class Homepage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Homepage() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<Map<String, String>> u = new SortService().getSortName();

		request.setAttribute("sort", u);
		request.setAttribute("type", new TypeService().getTypeByCount("16"));
		List<Map<String, String>> shop = new ShopService().getShopByKill();
		List<Map<String, String>> newshop = new ArrayList<Map<String, String>>();
		for (int i = 0; i < 5; i++) {
			Random rand = new Random();
			int position = rand.nextInt();
			if (position < 0)
				position *= -1;
			position = position % shop.size();
			newshop.add(shop.get(position));
			shop.remove(position);
		}
		request.setAttribute("killshop", newshop);

		request.getRequestDispatcher("/homepage.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
