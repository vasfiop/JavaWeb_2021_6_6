package action;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ShopService;
import service.SortService;
import service.TypeService;

/**
 * Servlet implementation class Shoptype_item
 */
@WebServlet("/shoptype_item")
public class Shoptype_item extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Shoptype_item() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");

//		id = "1";
		List<Map<String, String>> typenames = new TypeService().getTypeNameBySortId(id);
		Map<String, String> sortname = new SortService().getSortNameById(id);

		request.getSession().setAttribute("name", sortname);
		request.getSession().setAttribute("type", typenames);
		request.getSession().setAttribute("count", typenames.size());

		for (int i = 0; i < typenames.size(); i++) {
			String key = "shops" + i;
			request.getSession().setAttribute(key, new ShopService().getShopByTypeId(typenames.get(i).get("id")));
		}

		request.getRequestDispatcher("/shoptype_item.jsp").forward(request, response);
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
