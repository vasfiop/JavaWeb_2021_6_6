package meal;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.DBUtil;

/**
 * Servlet implementation class User_Updata
 */
@WebServlet("/user_update")
public class User_Update extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public User_Update() {
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
		request.setCharacterEncoding("utf-8");
		// 读取用户名登陆
		String pw = request.getParameter("passworld");
		String dh = request.getParameter("tel");
		String addr = request.getParameter("address");
		String id = (String) request.getSession().getAttribute("id");
		
		out.println(pw);
		out.println(dh);
		out.println(addr);
		out.println(id);

		String sql = "update user set password=?,telephone=?,address=? where id=?";
		String[] parame = { pw, dh, addr, id };

		int r = new DBUtil().update(sql, parame);
		if (r == 1)
			out.println("<h1>修改成功!</h1>");
		else
			out.println("<h1>修改失败!</h1>");
		out.println("<a href=user_edit>返回</a>");
		
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
