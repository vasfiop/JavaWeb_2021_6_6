package action.user;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CarService;
import service.UserService;
import util.Time;

@WebServlet("*.personal")
public class UserPersonal extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserPersonal() {
		super();
	}

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getServletPath();
		path = path.substring(path.lastIndexOf('/') + 1, path.indexOf('.'));
		Map<String, String> user = (Map<String, String>) request.getSession().getAttribute("user");
		if (path.equals("index")) {
			request.getRequestDispatcher("/user/user_personal.jsp").forward(request, response);
		} else if (path.equals("update")) {
			String signinname = request.getParameter("signinname");
			String sex = request.getParameter("sex");
			String nickname = request.getParameter("nickname");
			int r = new UserService().Update(signinname, sex, nickname, user.get("id"));
			if (r == 1)
				request.setAttribute("msg", "修改成功！");
			else
				request.setAttribute("msg", "修改失败！");
			request.setAttribute("href", request.getContextPath() + "/user/user_homepage");
			request.getRequestDispatcher("/result.jsp").forward(request, response);
			System.out.println(new Time().getDate());
		} else if (path.equals("safe")) {
			request.getRequestDispatcher("/user/user_safe_index.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
