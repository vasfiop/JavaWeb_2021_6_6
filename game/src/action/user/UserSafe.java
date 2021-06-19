package action.user;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.UserService;

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
			request.getRequestDispatcher("/user/user_safe_tel.jsp").forward(request, response);
		} else if (path.equals("pass_check")) {
			String password = request.getParameter("password");
			if (!password.equals(user.get("password"))) {
				request.setAttribute("msg", "密码错误！");
				request.setAttribute("href", request.getContextPath() + "/user/tel.safe");
				request.getRequestDispatcher("/result.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("/user/user_safe_tel_change.jsp").forward(request, response);
			}
		} else if (path.equals("tel_update")) {
			String telephone = request.getParameter("telphone");
			if (telephone.equals(user.get("telephone"))) {
				request.setAttribute("msg", "新的手机号不可以和原来的手机号相同！");
				request.setAttribute("href", request.getContextPath() + "/user/user_safe_tel_change.jsp");
				request.getRequestDispatcher("/result.jsp").forward(request, response);
			} else {
				Map<String, String> Tuser = new UserService().getUserByTel(telephone);
				System.out.println(Tuser);
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
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
