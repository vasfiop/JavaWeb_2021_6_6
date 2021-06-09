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

		if (u != null) {
//					�洢session
			request.getSession().setAttribute("username", username);
//						����ж�
			if (u.get("mode").equals("0")) {
//						��ͨ�û�
				response.sendRedirect("./homepage");
			} else {
//						����Ա
				response.sendRedirect("./admin/admin_index.jsp");
			}
		} else {
			// �Ƿ��û�
			request.setAttribute("msg", "�û������������");
			request.setAttribute("href", request.getContextPath() + "/homepage");
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
