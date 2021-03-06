package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.TypeService;
import util.DBUtil;

/**
 * Servlet implementation class AdminTypeAdd
 */
@WebServlet("/admin/admin_type_add")
public class Admin_type_add extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Admin_type_add() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		response.setContentType("text/html;charset=utf-8");
//		PrintWriter out = response.getWriter();

		// 设置请求的编码格式
		request.setCharacterEncoding("utf-8");
		// 读取请求中的信息
		String tn = request.getParameter("typename");

		int r = new TypeService().addType(tn);

		if (r == 1)
			request.setAttribute("msg", "添加菜品分类成功!");
		else
			request.setAttribute("msg", "添加菜品分类失败!");

		request.setAttribute("href", request.getContextPath() + "/admin/admin_type_list");
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
