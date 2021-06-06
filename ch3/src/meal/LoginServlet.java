package meal;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
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
//		//输出
//		out.println("<h1>username:" + un + "</h1>");
//		out.println("<h1>passworld:" + pw + "</h1>");
		// 登录判断(用户名neusoft密码123)
		if ("123".equals(un) && "123".equals(pw)) {
			// 合法用户,跳转到welcomeServlet(/ws)。显示欢迎***

			// 得到请求转发对象（静态资源）
//			RequestDispatcher rd = request.getRequestDispatcher("user_index.html");
//			rd.forward(request, response);

			// 像request对象中存储属性
//			request.setAttribute("fruit1", "2框苹果");
//			request.setAttribute("fruit2", "3框鸭梨");
//
//			// 得到请求转发对象（动态资源）
//			RequestDispatcher rd = request.getRequestDispatcher("ws");
//			rd.forward(request, response);

			// 使用session
			request.getSession().setAttribute("fruit1", "2框苹果");
			request.getSession().setAttribute("fruit2", "3框鸭梨");
			request.getSession().setAttribute("用户名", un);
//			通过url访问cookie
			String url = "ws";
			url = response.encodeURL(url);
			// 重定向
			response.sendRedirect(url);

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
