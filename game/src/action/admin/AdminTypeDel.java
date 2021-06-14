package action.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.SortService;
import service.TypeService;

@WebServlet("/admin/admin_type_del")
public class AdminTypeDel extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminTypeDel() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String mode = request.getParameter("mode");
		String id = request.getParameter("id");

		if (mode.equals("sort")) {
			int r = new SortService().delSortById(id);
			if (r == 1)
				request.setAttribute("msg", "删除分类成功!");
			else
				request.setAttribute("msg", "删除分类失败!");

			request.setAttribute("href", request.getContextPath() + "/admin/admin_type");
			request.getRequestDispatcher("/result.jsp").forward(request, response);
		} else if (mode.equals("type")) {
			int r = new TypeService().delTypeById(id);
			if (r == 1)
				request.setAttribute("msg", "删除种类成功!");
			else
				request.setAttribute("msg", "删除种类失败!");

			request.setAttribute("href", request.getContextPath() + "/admin/admin_type");
			request.getRequestDispatcher("/result.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
