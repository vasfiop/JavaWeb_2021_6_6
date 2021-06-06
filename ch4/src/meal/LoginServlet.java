package meal;

import util.DBUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 设置请求的编码格式
		request.setCharacterEncoding("utf-8");

		// 读取登录用户名
		String un = request.getParameter("un");

// 读取登录密码
		String pw = request.getParameter("pw");

//		sql 查询语句
		String sql = "select * from user where username =? and password =?";

		String[] params = { un, pw };

		Map<String, String> u = new DBUtil().getMap(sql, params);

		if (u != null) {
//			存储session
			request.getSession().setAttribute("用户名", un);
			request.getSession().setAttribute("id", u.get("id"));

//				身份判断
			if (u.get("ident").equals("0")) {
//				普通用户
				response.sendRedirect("user_index.html");
			} else {
//				管理员
				response.sendRedirect("admin_index.html");
			}
		} else {
			// 非法用户
			out.println("<h1>用户名或密码错误!5秒后自动返回登陆页面...</h1>");
			response.setHeader("Refresh", "5;url=homepage.html");
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
