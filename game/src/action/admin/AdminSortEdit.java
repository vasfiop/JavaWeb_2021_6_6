package action.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ShopService;
import service.SortService;

@WebServlet("/admin/admin_sort_edit")
public class AdminSortEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminSortEdit() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String mode = request.getParameter("mode");
		if (mode.equals("0")) {
			String id = request.getParameter("id");
			request.getSession().setAttribute("sort", new SortService().getSortNameById(id));
			request.getRequestDispatcher("/admin/admin_sort_edit.jsp").forward(request, response);
		} else if (mode.equals("1")) {
			String id = request.getParameter("id");
			String name = request.getParameter("sortname");

			int r = new SortService().Update(name, id);
			if (r == 1) {
				request.setAttribute("msg", "修改分类成功!");
			} else {
				request.setAttribute("msg", "修改分类失败!");
			}
			request.setAttribute("href", request.getContextPath() + "/admin/admin_type");
			request.getRequestDispatcher("/result.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "非法访问!");
			request.setAttribute("href", request.getContextPath() + "/admin/admin_index.jsp");
			request.getRequestDispatcher("/result.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
