package action.user;

import java.io.IOException;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.CarService;

@WebServlet("*.user_car")
public class UserCar extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserCar() {
		super();
	}

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String path = request.getServletPath();
		path = path.substring(path.lastIndexOf('/') + 1, path.indexOf('.'));
		Map<String, String> user = (Map<String, String>) request.getSession().getAttribute("user");
		if (path.equals("index")) {
			List<Map<String, String>> shops = new CarService().getCarByUserId(user.get("id"));
			request.setAttribute("shops", shops);
			request.getRequestDispatcher("/user/user_car.jsp").forward(request, response);
		} else if (path.equals("add")) {
			String src = null;
			String shopid = null;

			src = request.getParameter("src");
			if (src != null) {
				shopid = request.getParameter("shopid");
				src = request.getContextPath() + "/" + request.getParameter("src") + "?shopid=" + shopid;
				int r;
				Map<String, String> car = new CarService().getCar(user.get("id"), shopid);
				if (car == null) {
					r = new CarService().add(shopid, user.get("id"));
				} else {
					r = new CarService().update("count", car.get("id"), car.get("count") + 1);
				}
				if (r == 1) {
					response.sendRedirect(src);
				} else {
					request.setAttribute("msg", "Ìí¼ÓÊ§°Ü£¡");
					request.setAttribute("href", src);
					request.getRequestDispatcher("/result.jsp").forward(request, response);
				}
			} else {
//				TODO Õý³£Ìí¼ÓµÄÎ»ÖÃ
			}

		} else if (path.equals("del")) {
			String src = null;
			String shopid = null;

			src = request.getParameter("src");

			if (src != null) {
				shopid = request.getParameter("shopid");
				src = request.getContextPath() + "/" + request.getParameter("src") + "?shopid=" + shopid;
				int r = new CarService().del(user.get("id"), shopid);
				if (r == 1) {
					response.sendRedirect(src);
				} else {
					request.setAttribute("msg", "É¾³ýÊ§°Ü£¡");
					request.setAttribute("href", src);
					request.getRequestDispatcher("/result.jsp").forward(request, response);
				}
			} else {
//				TODO Õý³£É¾³ýµÄÎ»ÖÃ
				String userid = request.getParameter("id");
				int r = new CarService().del(userid);
				if (r > 0)
					response.sendRedirect("index.user_car");
				else {
					request.setAttribute("msg", "Ìí¼ÓÊ§°Ü£¡");
					request.setAttribute("href", "user/index.user_car");
					request.getRequestDispatcher("/result.jsp").forward(request, response);
				}
			}
		} else if (path.equals("del_item")) {
			String shopid = request.getParameter("id");
			int r = new CarService().del(user.get("id"), shopid);
			if (r == 1)
				response.sendRedirect("user/index.user_car");
			else {
				request.setAttribute("msg", "É¾³ýÊ§°Ü£¡");
				request.setAttribute("href", "user/index.user_car");
				request.getRequestDispatcher("/result.jsp").forward(request, response);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
