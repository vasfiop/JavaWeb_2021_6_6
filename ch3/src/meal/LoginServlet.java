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
		// ��������ı����ʽ
		request.setCharacterEncoding("utf-8");
		// ��ȡ��¼�û���

		String un = request.getParameter("un");
		// ��ȡ��¼����
		String pw = request.getParameter("pw");
//		//���
//		out.println("<h1>username:" + un + "</h1>");
//		out.println("<h1>passworld:" + pw + "</h1>");
		// ��¼�ж�(�û���neusoft����123)
		if ("123".equals(un) && "123".equals(pw)) {
			// �Ϸ��û�,��ת��welcomeServlet(/ws)����ʾ��ӭ***

			// �õ�����ת�����󣨾�̬��Դ��
//			RequestDispatcher rd = request.getRequestDispatcher("user_index.html");
//			rd.forward(request, response);

			// ��request�����д洢����
//			request.setAttribute("fruit1", "2��ƻ��");
//			request.setAttribute("fruit2", "3��Ѽ��");
//
//			// �õ�����ת�����󣨶�̬��Դ��
//			RequestDispatcher rd = request.getRequestDispatcher("ws");
//			rd.forward(request, response);

			// ʹ��session
			request.getSession().setAttribute("fruit1", "2��ƻ��");
			request.getSession().setAttribute("fruit2", "3��Ѽ��");
			request.getSession().setAttribute("�û���", un);
//			ͨ��url����cookie
			String url = "ws";
			url = response.encodeURL(url);
			// �ض���
			response.sendRedirect(url);

		} else {
			// �Ƿ��û�
			out.println("<h1>�û������������!5����Զ����ص�½ҳ��...</h1>");
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
