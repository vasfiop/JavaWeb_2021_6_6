package action.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ShopService;

@WebServlet("/admin/admin_shop_del")
public class AdminShopDel extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminShopDel() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");

		int r = new ShopService().delShopById(id);
		if (r == 1)
			request.setAttribute("msg", "删除商品分类成功!");
		else
			request.setAttribute("msg", "删除商品分类失败!");

		request.setAttribute("href", request.getContextPath() + "/admin/admin_shop");
		request.getRequestDispatcher("/result.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
