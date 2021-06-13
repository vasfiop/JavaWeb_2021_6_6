package action;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.FoodService;
import service.TypeService;

/**
 * Servlet implementation class User_index
 */
@WebServlet("/user/user_index")
public class User_index extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public User_index() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		List<Map<String, String>> types = new TypeService().getTypes(null);

		String s_fn = request.getParameter("s_fn");
		String s_type = request.getParameter("s_type");
		
		System.out.println(s_fn);
		System.out.println(s_type);
		
		if ((s_fn == null || s_fn.equals("")) && (s_type == null || s_type.equals(""))) {
			System.out.println("都空");
			List<Map<String, String>> foods = new FoodService().getFood();
			request.setAttribute("food", foods);
		} else if (s_fn != null && s_type != null) {
			System.out.println("都有");
			List<Map<String, String>> foods = new FoodService().getFood("both", s_fn, s_type);
			request.setAttribute("food", foods);
		} else if (s_fn == null || s_fn.equals("")) {
			System.out.println("搜类型");
			request.setAttribute("food", new FoodService().getFood("type", s_type));
		} else {
			System.out.println("搜菜名");
			request.setAttribute("food", new FoodService().getFood("foodname", s_fn));
		}

		request.setAttribute("types", types);

		request.getRequestDispatcher("user_index.jsp").forward(request, response);
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
