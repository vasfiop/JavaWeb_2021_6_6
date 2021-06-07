package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.DBUtil;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// ��������ı����ʽ
		request.setCharacterEncoding("utf-8");

		String un = request.getParameter("username");
		String pw = request.getParameter("password");
		String phone = request.getParameter("phone");
		

//		sql ��ѯ���
		String sql = "select * from user where username =? and password =?";

		String[] params = { un, pw };

		Map<String, String> u = new DBUtil().getMap(sql, params);

		if (u != null) {
//			�洢session
			request.getSession().setAttribute("�û���", un);
			request.getSession().setAttribute("id", u.get("id"));

//				����ж�
			if (u.get("ident").equals("0")) {
//				��ͨ�û�
				response.sendRedirect("./user/user_index.jsp");
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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
