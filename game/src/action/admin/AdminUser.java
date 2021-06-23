package action.admin;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.AdminService;
import service.CarService;
import service.CollectService;
import service.UserService;

@WebServlet("*.admin_user")
public class AdminUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminUser() {
		super();
	}

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getServletPath();
		path = path.substring(path.lastIndexOf('/') + 1, path.indexOf('.'));
		Map<String, String> user = (Map<String, String>) request.getSession().getAttribute("user");
		if (path.equals("user_list")) {
			List<Map<String, String>> users = new UserService().getUsers();
			request.setAttribute("users", users);
			request.getRequestDispatcher("/admin/admin_user_list.jsp").forward(request, response);
		} else if (path.equals("user_search")) {
			String search = request.getParameter("search");
			request.getSession().setAttribute("users", new UserService().getUserByName(search));
			request.getRequestDispatcher("/admin/admin_user_list.jsp").forward(request, response);
		} else if (path.equals("user_frozen")) {
			String id = request.getParameter("id");
			String mode = request.getParameter("mode");

			int r = new UserService().Update("frozen", id, mode);
			if (r == 1) {
				request.setAttribute("msg", "修改用户状态成功!");
			} else {
				request.setAttribute("msg", "修改用户状态失败!");
			}
			request.setAttribute("href", request.getContextPath() + "/admin/user_list.admin_user");
			request.getRequestDispatcher("/result.jsp").forward(request, response);
		} else if (path.equals("user_del")) {
			String id = request.getParameter("id");
			List<Map<String, String>> car = new CarService().getCarByUserId(id);
			if (car.size() != 0) {
				int r = new CarService().delByUserId(id);
				if (r == 0) {
					request.setAttribute("msg", "删除用户失败!");
					request.setAttribute("href", request.getContextPath() + "/admin/user_list.admin_user");
					request.getRequestDispatcher("/result.jsp").forward(request, response);
				}
			}
			List<Map<String, String>> collect = new CollectService().getCollect(id);
			if (collect.size() != 0) {
				int r = new CollectService().del(id);
				if (r == 0) {
					request.setAttribute("msg", "删除用户失败!");
					request.setAttribute("href", request.getContextPath() + "/admin/user_list.admin_user");
					request.getRequestDispatcher("/result.jsp").forward(request, response);
				}
			}
			int r = new UserService().delUserById(id);
			if (r == 1)
				request.setAttribute("msg", "删除用户成功!");
			else
				request.setAttribute("msg", "删除用户失败!");
			request.setAttribute("href", request.getContextPath() + "/admin/user_list.admin_user");
			request.getRequestDispatcher("/result.jsp").forward(request, response);
		} else if (path.equals("admin_list")) {
			List<Map<String, String>> users = new AdminService().getAdmin();
			request.getSession().setAttribute("users", users);
			request.getRequestDispatcher("/admin/admin_admin_list.jsp").forward(request, response);
		} else if (path.equals("admin_search")) {
			String search = request.getParameter("search");
			request.getSession().setAttribute("users", new AdminService().getAdmin(search));
			request.getRequestDispatcher("/admin/admin_admin_list.jsp").forward(request, response);
		} else if (path.equals("admin_del")) {
			String id = request.getParameter("id");
			int r = new AdminService().del(id);
			if (r == 1)
				request.setAttribute("msg", "删除用户成功!");
			else
				request.setAttribute("msg", "删除用户失败!");
			request.setAttribute("href", request.getContextPath() + "/admin/admin_list.admin_user");
			request.getRequestDispatcher("/result.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
