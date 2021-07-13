package cn.edu.neu.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.neu.service.HomeService;
import cn.edu.neu.service.UserService;

@WebServlet("*.person")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserController() {
		super();
	}

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getServletPath();
		path = path.substring(path.lastIndexOf('/') + 1, path.indexOf('.'));
		request.getSession().removeAttribute("search");
		List<Map<String, Object>> cates = HomeService.getSort();
		request.getSession().removeAttribute("search");
		request.setAttribute("cates", cates);
		request.setAttribute("urlkey", null);

		Map<String, Object> user = (Map<String, Object>) request.getSession().getAttribute("user");

		if (path.equals("index")) {
			request.setAttribute("personkey", null);
			request.setAttribute("msg", "��ӭ�����������ģ��������޸ĸ�����Ϣ������͹����ջ���ַ");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		} else if (path.equals("info")) {
			request.setAttribute("personkey", "info");
			request.getRequestDispatcher("info.jsp").forward(request, response);
		} else if (path.equals("changPersonalInfo")) {
			request.setAttribute("personkey", null);

			String user_age = request.getParameter("user_age");
			String user_sex = request.getParameter("user_sex");
			String user_email = request.getParameter("user_email");
			String user_id = request.getParameter("user_id");

			int r = UserService.Update(user_age, user_sex, user_email, user_id);
			if (r > 0) {
				request.setAttribute("msg", "�޸ĸ�����Ϣ�ɹ�");
				Map<String, Object> usernew = UserService.getUser(user_id);
				request.getSession().setAttribute("user", usernew);
			} else {
				request.setAttribute("msg", "�޸ĸ�����Ϣʧ��");
			}
			request.getRequestDispatcher("index.jsp").forward(request, response);
		} else if (path.equals("password")) {
			request.setAttribute("personkey", "password");
			request.getRequestDispatcher("password.jsp").forward(request, response);
		} else if (path.equals("checkOldPass")) {
//			��������
			response.setContentType("text/json;charset=utf-8");
			PrintWriter out = response.getWriter();

			String user_pass = (String) user.get("user_pass");
			String old_pass = request.getParameter("old_pass");
			if (user_pass.equals(old_pass)) {
				out.print("{\"success\":true}");
			} else {
				out.print("{\"success\":false}");
			}

			out.flush();
		} else if (path.equals("changePass")) {
//			�û��޸�����
			request.setAttribute("personkey", null);

			String user_id = request.getParameter("user_id");
			String user_pass = request.getParameter("user_new_pass");

			int r = UserService.Update(user_pass, user_id);

			if (r > 0) {
				request.setAttribute("msg", "�޸ĸ�����Ϣ�ɹ�");
				Map<String, Object> usernew = UserService.getUser(user_id);
				request.getSession().setAttribute("user", usernew);
			} else {
				request.setAttribute("msg", "�޸ĸ�����Ϣʧ��");
			}
			request.getRequestDispatcher("index.jsp").forward(request, response);
		} else if (path.equals("address")) {
			String user_id = String.valueOf(user.get("user_id"));

			List<Map<String, Object>> address = UserService.getAddress(user_id);

			request.setAttribute("address", address);
			request.setAttribute("personkey", "address");
			request.getRequestDispatcher("address.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
