package action.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.SortService;
import service.TypeService;

@WebServlet("/admin/admin_type_edit")
public class AdminTypeEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminTypeEdit() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String mode = request.getParameter("mode");
		if (mode == null) {
			request.setAttribute("msg", "非法访问!");
			request.setAttribute("href", request.getContextPath() + "/admin/admin_index.jsp");
			request.getRequestDispatcher("/result.jsp").forward(request, response);
		} else if (mode.equals("0")) {
			String id = request.getParameter("id");
			request.getSession().setAttribute("type", new TypeService().getTypeById(id));
			request.getSession().setAttribute("sort", new SortService().getSortName());
			request.getRequestDispatcher("/admin/admin_type_edit.jsp").forward(request, response);
		} else if (mode.equals("1")) {
			String id = request.getParameter("id");
			String name = request.getParameter("typename");
			String typeid = request.getParameter("typeid");

			int r = new TypeService().Update(name, typeid, id);
			if (r == 1) {
				request.setAttribute("msg", "修改种类成功!");
			} else {
				request.setAttribute("msg", "修改种类失败!");
			}
			request.setAttribute("href", request.getContextPath() + "/admin/admin_type");
			request.getRequestDispatcher("/result.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
