package action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.ForEach;

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
		
		List<Map<String, String>> u = new TypeService().getTypeNameeById(id);
		request.getSession().setAttribute("type", u);
		
//		List<Map<String, String>> list = new ShopService().getShopByTypeId(u.get(0).get("typeid"));
//		request.getSession().setAttribute("shops", list);
		
		List<Map<String, String>> list = new ShopService().getShopBySortId(id);
		request.getSession().setAttribute("shops", list);
		
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
