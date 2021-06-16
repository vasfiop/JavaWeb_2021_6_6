package action.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CarService;

@WebServlet("/user/user_car_del")
public class UserCarDel extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserCarDel() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");

		int r = new CarService().del(id);
		if (r == 1)
			request.setAttribute("msg", "É¾³ý³É¹¦!");
		else
			request.setAttribute("msg", "É¾³ýÊ§°Ü!");
		request.setAttribute("href", request.getContextPath() + "/user/user_car?id=" + id);
		request.getRequestDispatcher("/result.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
