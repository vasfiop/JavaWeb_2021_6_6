package action.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.TypeService;
import service.UserService;

@WebServlet("/admin/admin_user_del")
public class AdminUserDel extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminUserDel() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		int r = new UserService().delUserById(id);
		if (r == 1)
			request.setAttribute("msg", "删除用户成功!");
		else
			request.setAttribute("msg", "删除用户失败!");

		request.setAttribute("href", request.getContextPath() + "/admin/admin_user_list");
		request.getRequestDispatcher("/result.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
