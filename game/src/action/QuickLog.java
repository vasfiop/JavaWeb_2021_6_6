package action;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.UserService;

@WebServlet("*.quick_log")
public class QuickLog extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public QuickLog() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getServletPath();
		path = path.substring(path.lastIndexOf('/') + 1, path.indexOf('.'));
		if (path.equals("index")) {
			request.getRequestDispatcher("/quick_log.jsp").forward(request, response);
		} else if (path.equals("check")) {
			String quick = request.getParameter("quick");
			System.out.println(quick);
			if (quick.equals("admin")) {
				response.sendRedirect(request.getContextPath() + "/admin/admin_login");
			} else {
				Map<String, String> user = new UserService().getUserByQuick(quick);
				if (user == null || user.get("quick") == null) {
					request.setAttribute("msg", "口令错误！");
					request.setAttribute("href", request.getContextPath() + "/index.quick_log");
					request.getRequestDispatcher("/result.jsp").forward(request, response);
				} else {
					if (user.get("frozen").equals("0")) {
						request.getSession().setAttribute("user", user);
						response.sendRedirect("./homepage");
					} else {
						request.setAttribute("msg", "您的账户已被冻结!");
						request.setAttribute("href", request.getContextPath() + "/logout");
						request.getRequestDispatcher("/result.jsp").forward(request, response);
					}
				}
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}