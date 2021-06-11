package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.UserService;

/**
 * Servlet implementation class User_Updata
 */
@WebServlet("/user/user_update")
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
		// 读取用户名登陆
		String pw = request.getParameter("passworld");
		String dh = request.getParameter("tel");
		String addr = request.getParameter("address");
		String id = (String) request.getSession().getAttribute("id");

		int r = new UserService().upDate(pw, dh, addr, id);
		if (r == 1)
			request.setAttribute("msg", "修改成功");
		else
			request.setAttribute("msg", "修改错误");
		request.setAttribute("href", request.getContextPath() + "/user/user_edit");
		request.getRequestDispatcher("/result.jsp").forward(request, response);

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
