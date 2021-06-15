package action;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ShopService;
import service.UserService;

@WebServlet("/register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Register() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String tel = request.getParameter("phone");
		String password = request.getParameter("password");
		String username = request.getParameter("username");

		Map<String, String> user = new UserService().getUserByTel(tel);
		if (user != null) {
			request.setAttribute("msg", "该手机号已经被注册!");
			request.setAttribute("href", request.getContextPath() + "/logout");
			request.getRequestDispatcher("/result.jsp").forward(request, response);
		} else {
			int r = new UserService().add(username, password, tel);
			if (r == 1) {
				request.setAttribute("msg", "注册成功!");
				request.getSession().setAttribute("username", username);
				request.setAttribute("href", request.getContextPath() + "/homepage");
				request.getRequestDispatcher("/result.jsp").forward(request, response);
			} else {
				request.setAttribute("msg", "注册失败!");
				request.setAttribute("href", request.getContextPath() + "/logout");
				request.getRequestDispatcher("/result.jsp").forward(request, response);
			}
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
