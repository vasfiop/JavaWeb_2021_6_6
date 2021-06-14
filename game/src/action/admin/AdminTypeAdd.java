package action.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ShopService;
import service.TypeService;

@WebServlet("/admin/admin_type_add")
public class AdminTypeAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminTypeAdd() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String mode = request.getParameter("mode");

		if (mode.equals("0")) {
			request.getRequestDispatcher("/admin/admin_type_add.jsp").forward(request, response);
		} else if (mode.equals("1")) {

			request.setAttribute("type", new TypeService().getType());

			String name = request.getParameter("typename");
			String typeid = request.getParameter("typeid");

			System.out.println(name);
			System.out.println(typeid);

			int r = new TypeService().add(name, typeid);

			if (r == 1) {
				request.setAttribute("msg", "��������ɹ�!");
			} else {
				request.setAttribute("msg", "��������ʧ��!");
			}
			request.setAttribute("href", request.getContextPath() + "/admin/admin_type");
			request.getRequestDispatcher("/result.jsp").forward(request, response);
		} else if (mode == null || mode.equals("")) {
			request.setAttribute("msg", "�Ƿ�����!");
			request.setAttribute("href", request.getContextPath() + "/admin/admin_type");
			request.getRequestDispatcher("/result.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}