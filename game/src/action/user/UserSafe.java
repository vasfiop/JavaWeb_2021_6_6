package action.user;

import java.io.IOException;
import java.util.Base64;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CarService;
import service.UserService;
import util.Base;
import util.Time;

@WebServlet("*.safe")
public class UserSafe extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserSafe() {
		super();
	}

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getServletPath();
		path = path.substring(path.lastIndexOf('/') + 1, path.indexOf('.'));
		Map<String, String> user = (Map<String, String>) request.getSession().getAttribute("user");
		if (path.equals("tel")) {
			String mode = "telephone";
			request.setAttribute("mode", mode);
			request.getRequestDispatcher("/user/user_safe_password.jsp").forward(request, response);
		} else if (path.equals("pass_check")) {
			String password = request.getParameter("password");
			if (!password.equals(user.get("password"))) {
				request.setAttribute("msg", "密码错误！");
				request.setAttribute("href", request.getContextPath() + "/user/tel.safe");
				request.getRequestDispatcher("/result.jsp").forward(request, response);
			} else {
				String mode = request.getParameter("mode");
				if (mode.equals("telephone"))
					request.getRequestDispatcher("/user/user_safe_tel_change.jsp").forward(request, response);
				else if (mode.equals("password"))
					request.getRequestDispatcher("/user/user_safe_password_change.jsp").forward(request, response);
				else if (mode.equals("frozen"))
					request.getRequestDispatcher("/user/user_safe_frozen_change.jsp").forward(request, response);
				else if (mode.equals("delete"))
					request.getRequestDispatcher("/user/user_safe_delete_change.jsp").forward(request, response);
				else if (mode.equals("quick"))
					response.sendRedirect("quick_get.safe");
			}
		} else if (path.equals("tel_update")) {
			String telephone = request.getParameter("telphone");
			if (telephone.equals(user.get("telephone"))) {
				request.setAttribute("msg", "新的手机号不可以和原来的手机号相同！");
				request.setAttribute("href", request.getContextPath() + "/user/user_safe_tel_change.jsp");
				request.getRequestDispatcher("/result.jsp").forward(request, response);
			} else {
				Map<String, String> Tuser = new UserService().getUserByTel(telephone);
				if (Tuser != null) {
					request.setAttribute("msg", "该手机号已经被注册！");
					request.setAttribute("href", request.getContextPath() + "/user/user_safe_tel_change.jsp");
					request.getRequestDispatcher("/result.jsp").forward(request, response);
				} else {
					int r = new UserService().Update("telephone", user.get("id"), telephone);
					if (r == 1) {
						request.setAttribute("msg", "修改成功！");
						user = new UserService().getUser(user.get("id"));
						request.getSession().setAttribute("user", user);
					} else
						request.setAttribute("msg", "修改失败！");
					request.setAttribute("href", request.getContextPath() + "/user/safe.personal");
					request.getRequestDispatcher("/result.jsp").forward(request, response);
				}
			}
		} else if (path.equals("password")) {
			String mode = "password";
			request.setAttribute("mode", mode);
			request.getRequestDispatcher("/user/user_safe_password.jsp").forward(request, response);
		} else if (path.equals("password_update")) {
			String password = request.getParameter("password");
			if (password == user.get("password")) {
				request.setAttribute("msg", "新密码不可以和旧密码相同！");
				request.setAttribute("href", request.getContextPath() + "/user/user_safe_password_change.jsp");
				request.getRequestDispatcher("/result.jsp").forward(request, response);
			} else {
				int r = new UserService().Update("password", user.get("id"), password);
				if (r == 1) {
					request.setAttribute("msg", "修改成功！");
					user = new UserService().getUser(user.get("id"));
					request.getSession().setAttribute("user", user);
				} else
					request.setAttribute("msg", "修改失败！");
				request.setAttribute("href", request.getContextPath() + "/user/safe.personal");
				request.getRequestDispatcher("/result.jsp").forward(request, response);
			}
		} else if (path.equals("frozen")) {
			String mode = "frozen";
			request.setAttribute("mode", mode);
			request.getRequestDispatcher("/user/user_safe_password.jsp").forward(request, response);
		} else if (path.equals("frozen_update")) {
			int r = new UserService().Update("frozen", user.get("id"), "1");
			if (r == 1) {
				request.setAttribute("msg", "修改成功！");
				user = new UserService().getUser(user.get("id"));
				request.getSession().setAttribute("user", user);
			} else
				request.setAttribute("msg", "修改失败！");
			request.setAttribute("href", request.getContextPath() + "/logout");
			request.getRequestDispatcher("/result.jsp").forward(request, response);
		} else if (path.equals("delete")) {
			String mode = "delete";
			request.setAttribute("mode", mode);
			request.getRequestDispatcher("/user/user_safe_password.jsp").forward(request, response);
		} else if (path.equals("delete_change")) {
			List<Map<String, String>> Tuser = new CarService().getCarByUserId(user.get("id"));
			if (Tuser != null) {
				int r = new CarService().delByUserId(user.get("id"));
				if (r < 0) {
					request.setAttribute("msg", "删除失败！");
					request.setAttribute("href", request.getContextPath() + "/user/safe.personal");
					request.getRequestDispatcher("/result.jsp").forward(request, response);
				}
			}
			int r = new UserService().delUserById(user.get("id"));
			if (r == 1) {
				request.setAttribute("msg", "注销成功!");
				request.setAttribute("href", request.getContextPath() + "/logout");
				request.getRequestDispatcher("/result.jsp").forward(request, response);
			} else {
				request.setAttribute("msg", "注销失败!");
				request.setAttribute("href", request.getContextPath() + "/user/safe.personal");
				request.getRequestDispatcher("/result.jsp").forward(request, response);
			}
		} else if (path.equals("quick")) {
			if (!user.get("quick").equals("")) {
				request.setAttribute("msg", "您已经申请过口令了!");
				request.setAttribute("href", request.getContextPath() + "/user/safe.personal");
				request.getRequestDispatcher("/result.jsp").forward(request, response);
			} else {
				String mode = "quick";
				request.setAttribute("mode", mode);
				request.getRequestDispatcher("/user/user_safe_password.jsp").forward(request, response);
			}
		} else if (path.equals("quick_get")) {
			String quick = new Base().getBase(new Time().getDate());
			int r = new UserService().Update("quick", user.get("id"), quick);
			if (r <= 0) {
				request.setAttribute("msg", "申请失败!");
				request.setAttribute("href", request.getContextPath() + "/user/safe.personal");
				request.getRequestDispatcher("/result.jsp").forward(request, response);
			} else {
				user = new UserService().getUser(user.get("id"));
				request.getSession().setAttribute("user", user);
				request.setAttribute("quick", quick);
				request.getRequestDispatcher("/user/user_safe_quick_change.jsp").forward(request, response);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
