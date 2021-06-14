package action.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.SortService;
import service.TypeService;

@WebServlet("/admin/admin_sort_add")
public class AdminSortAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminSortAdd() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String mode = request.getParameter("mode");

		if (mode.equals("0")) {
			request.getRequestDispatcher("/admin/admin_sort_add.jsp").forward(request, response);
		} else if (mode.equals("1")) {

			request.setAttribute("type", new TypeService().getType());

			String name = request.getParameter("sortname");

			int r = new SortService().add(name);
			if (r == 1) {
				request.setAttribute("msg", "添加分类成功!");
			} else {
				request.setAttribute("msg", "添加分类失败!");
			}
			request.setAttribute("href", request.getContextPath() + "/admin/admin_type");
			request.getRequestDispatcher("/result.jsp").forward(request, response);
		} else if (mode == null || mode.equals("")) {
			request.setAttribute("msg", "非法访问!");
			request.setAttribute("href", request.getContextPath() + "/admin/admin_type");
			request.getRequestDispatcher("/result.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
