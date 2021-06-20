package action.admin;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.AdminService;

@WebServlet("/admin/admin_login_check")
public class AdminLoginCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminLoginCheck() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Map<String, String> user = new AdminService().getAdmin(username, password);
		if (user == null) {
			request.setAttribute("msg", "用户名和密码错误!");
			request.setAttribute("href", request.getContextPath() + "/admin/admin_login");
			request.getRequestDispatcher("/result.jsp").forward(request, response);
		} else {
			request.getSession().setAttribute("user", user);
			response.sendRedirect("admin_homepage");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
