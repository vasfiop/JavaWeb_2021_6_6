package action.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.UserService;

@WebServlet("/admin/admin_user_frozen")
public class AdminUserFrozen extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminUserFrozen() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String mode = request.getParameter("mode");

		int r = new UserService().Update(id, mode);
		if (r == 1) {
			request.setAttribute("msg", "修改用户状态成功!");
		} else {
			request.setAttribute("msg", "修改用户状态失败!");
		}
		request.setAttribute("href", request.getContextPath() + "/admin/admin_user_list");
		request.getRequestDispatcher("/result.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
