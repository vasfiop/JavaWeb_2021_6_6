package action.admin;

import java.io.IOException;
import java.util.ArrayList;
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

@WebServlet("*.admin_shop")
public class AdminShop extends HttpServlet {

	public AdminShop() {
		super();
	}

	@SuppressWarnings({ "unchecked", "unused" })
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getServletPath();
		path = path.substring(path.lastIndexOf('/') + 1, path.indexOf('.'));
		Map<String, String> user = (Map<String, String>) request.getSession().getAttribute("user");

		List<Map<String, String>> shops = null;
		List<Map<String, String>> newshops = new ArrayList<Map<String, String>>();

		if (path.equals("shop_list")) {
			if (shops != null)
				shops.clear();
			shops = new ArrayList<Map<String, String>>();
			shops = new ShopService().getShops();

			request.getSession().setAttribute("shops", shops);
			request.getRequestDispatcher("shop_page.admin_shop?page=1").forward(request, response);
		} else if (path.equals("shop_page")) {
			if (shops == null)
				shops = (List<Map<String, String>>) request.getSession().getAttribute("shops");
			String page = request.getParameter("page");
			int moment = Integer.valueOf(page);
			if (newshops != null)
				newshops.clear();
			int count = shops.size();
			if (count != 0) {
				int pagecount = count / 5;
				pagecount = count % 5 == 0 ? pagecount : pagecount + 1;
				int TheLastNumber = count % 5 == 0 ? 5 : count % 5;
				for (int i = 0; i < (moment == pagecount ? TheLastNumber : 5); i++)
					newshops.add(shops.get((moment - 1) * 5 + i));
				request.setAttribute("shops", newshops);
				request.setAttribute("sort", new SortService().getSortName());
				request.setAttribute("page", pagecount);
				request.setAttribute("moment", moment);
				request.getRequestDispatcher("/admin/admin_shop_list.jsp").forward(request, response);
			} else {
				request.setAttribute("sort", new SortService().getSortName());
				request.getRequestDispatcher("/admin/admin_shop_list.jsp").forward(request, response);
			}
		} else if (path.equals("search")) {
			if (shops != null)
				shops.clear();
			shops = new ArrayList<Map<String, String>>();
			String s_name = request.getParameter("s_name");
			String s_sort = request.getParameter("s_sort");

			if (s_name == null || s_name.equals("")) {
				if (s_sort == null || s_sort.equals(""))
					shops = new ShopService().getShops();
				else
					shops = new ShopService().getShopBySortId(s_sort);
			} else {
				if (s_sort == null || s_sort.equals(""))
					shops = new ShopService().getShops("shopname", s_name);
				else
					shops = new ShopService().getShopBySort_and_name(s_name, s_sort);
			}
			request.getSession().setAttribute("shops", shops);
			request.getRequestDispatcher("shop_page.admin_shop?page=1").forward(request, response);
		} else if (path.equals("shop_edit")) {
			String shopid = request.getParameter("shopid");

			request.setAttribute("types", new TypeService().getType());
			request.setAttribute("shop", new ShopService().getShopByid(shopid));
			request.getRequestDispatcher("/admin/admin_shop_edit.jsp").forward(request, response);
		} else if (path.equals("shop_add")) {
			request.setAttribute("types", new TypeService().getType());
			request.getRequestDispatcher("/admin/admin_shop_add.jsp").forward(request, response);
		} else if (path.equals("shop_del")) {
			String shopid = request.getParameter("shopid");

			int r = new ShopService().delShopById(shopid);
			if (r == 1)
				request.setAttribute("msg", "删除商品分类成功!");
			else
				request.setAttribute("msg", "删除商品分类失败!");

			request.setAttribute("href", request.getContextPath() + "/admin/shop_list.admin_shop");
			request.getRequestDispatcher("/result.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
