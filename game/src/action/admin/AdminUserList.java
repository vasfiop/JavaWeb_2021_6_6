package action.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.UserService;

@WebServlet("/admin/admin_user_list")
public class AdminUserList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminUserList() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String mode = request.getParameter("mode");
		if (mode != null && mode.equals("1")) {
			String name = request.getParameter("username");
			request.getSession().setAttribute("users", new UserService().getUserByName(name));
		} else
			request.getSession().setAttribute("users", new UserService().getUsers());
		request.getRequestDispatcher("/admin/admin_user_list.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
