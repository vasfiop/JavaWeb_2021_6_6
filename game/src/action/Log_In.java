package action;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.UserService;

/**
 * Servlet implementation class Log_In
 */
@WebServlet("/login")
public class Log_In extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Log_In() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");

		Map<String, String> u = new UserService().getUser(username, password);
		if (u == null)
			u = new UserService().getUserByTel(username, password);
		if (u != null) {
			if (u.get("frozen").equals("0")) {
				request.getSession().setAttribute("user", u);
				if (u.get("mode").equals("0"))
					response.sendRedirect("./homepage");
				else
					response.sendRedirect("./admin/admin_homepage");
			} else {
				request.setAttribute("msg", "您的账户已被冻结!");
				request.setAttribute("href", request.getContextPath() + "/logout");
				request.getRequestDispatcher("/result.jsp").forward(request, response);
			}

		} else {
			request.setAttribute("msg", "用户名和密码错误!");
			request.setAttribute("href", request.getContextPath() + "/logout");
			request.getRequestDispatcher("/result.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
