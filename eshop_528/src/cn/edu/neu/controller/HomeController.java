package cn.edu.neu.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import cn.edu.neu.service.HomeService;

@WebServlet("*.home")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public HomeController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getServletPath();
		path = path.substring(path.lastIndexOf('/') + 1, path.indexOf('.'));
		request.getSession().removeAttribute("search");
		if (path.equals("index")) {
//			Ê×Ò³
			request.setAttribute("cates", HomeService.getSort());
			request.setAttribute("today", HomeService.getToday());
			request.setAttribute("hots", HomeService.getHot());
			request.setAttribute("urlkey", "index");
			request.getRequestDispatcher("homepage.jsp").forward(request, response);
		} else if (path.equals("login")) {
//			µÇÂ½
			response.setContentType("text/json;charset=utf-8");
			PrintWriter out = response.getWriter();
			String username = request.getParameter("username");
			String password = request.getParameter("password");

			Map<String, Object> user = HomeService.getUser(username, password);
			if (user != null) {
				request.getSession().setAttribute("user", user);
				
				out.print("{\"login\":true}");
			} else
				out.print("{\"login\":false}");
			out.flush();
		} else if (path.equals("logout")) {
//			ÍË³öµÇÂ¼
			request.getSession().invalidate();
			response.sendRedirect(request.getContextPath() + "/index.home");
		} else if (path.equals("reg")) {
//			×¢²á
			response.setContentType("text/json;charset=utf-8");
			PrintWriter out = response.getWriter();
			String username = request.getParameter("userName");
			String password = request.getParameter("userPass");
			String password1 = request.getParameter("userPass1");
			String age = request.getParameter("userAge");
			String sex = request.getParameter("userSex");
			String email = request.getParameter("userEmail");
			if (!password.equals(password1)) {
				out.print("{\"value\":1}");
			} else {
				int r = HomeService.addUser(username, password, age, sex, email);
				if (r > 0) {
					out.print("{\"value\":0}");
					Map<String, Object> user = HomeService.getUser(username, password);
					request.getSession().setAttribute("user", user);
				} else {
					out.print("{\"value\":-1}");
				}
			}
			out.flush();
		} else if (path.equals("checkname")) {
//			¼ì²é×¢²áÓÃ»§Ãû
			response.setContentType("text/json;charset=utf-8");
			PrintWriter out = response.getWriter();
			String username = request.getParameter("username");
			Map<String, Object> user = HomeService.getUserByOneLine("user_name", username);
			if (user != null)
				out.print("{\"value\":false}");
			else
				out.print("{\"value\":true}");
			out.flush();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
