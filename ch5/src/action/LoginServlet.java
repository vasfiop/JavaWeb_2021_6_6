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

		String un = request.getParameter("un");
		String pw = request.getParameter("pw");

		Map<String, String> u = new UserService().getUserByNameAndPass(un, pw);

		if (u != null) {
//			�洢session
			request.getSession().setAttribute("�û���", un);
			request.getSession().setAttribute("id", u.get("id"));

//				����ж�
			if (u.get("ident").equals("0")) {
//				��ͨ�û�
				response.sendRedirect("./user/user_index");
			} else {
//				����Ա
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
