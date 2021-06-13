package action.admin;

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

@WebServlet("/admin/admin_shop")
public class AdminShop extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminShop() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Map<String, String>> sorts = new SortService().getSortName();
		request.getSession().setAttribute("sort", sorts);

		String s_name = request.getParameter("s_name");
		String s_sort = request.getParameter("s_sort");

		if ((s_name == null || s_name.equals("")) && (s_sort == null || s_sort.equals(""))) {
			List<Map<String, String>> shops = new ShopService().getShops();
			request.getSession().setAttribute("shops", shops);
		}
		if ((s_name != null && !s_name.equals("")) && (s_sort == null || s_sort.equals(""))) {
			List<Map<String, String>> shops = new ShopService().getShops("shopname", s_name);
			request.getSession().setAttribute("shops", shops);
		}
		if ((s_sort != null && !s_sort.equals("")) && (s_name == null || s_name.equals(""))) {
			List<Map<String, String>> shops = new ShopService().getShops("type", s_sort);
			request.getSession().setAttribute("shops", shops);
		}
		if ((s_name != null && !s_name.equals("")) && (s_sort != null && !s_sort.equals(""))) {
			List<Map<String, String>> shops = new ShopService().getShopBySort_and_name(s_name, s_sort);
			request.getSession().setAttribute("shops", shops);
		}
		
		request.getRequestDispatcher("/admin/admin_shop.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
