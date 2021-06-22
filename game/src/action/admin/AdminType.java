package action.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.SortService;
import service.TypeService;

@WebServlet("/admin/admin_type")
public class AdminType extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminType() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String mode = request.getParameter("mode");
		String s_sort = request.getParameter("s_sort");
		String s_type = request.getParameter("s_type");

		boolean sortIsNull = (s_sort == null) || (s_sort.equals(""));
		boolean typeIsNull = (s_type == null) || (s_type.equals(""));

//		if (sortIsNull && typeIsNull) {
//			System.out.println("¶¼¿Õ");
//			request.getSession().setAttribute("sort", new SortService().getSortName());
//			request.getSession().setAttribute("type", new TypeService().getType("link"));
//		} else if (!sortIsNull && typeIsNull) {
//			System.out.println("ËÑsort"+s_sort);
//			request.getSession().setAttribute("sort", new SortService().getsortByName(s_sort));
//			request.getSession().setAttribute("type", new TypeService().getType("link"));
//		} else if (sortIsNull && !typeIsNull) {
//			System.out.println("ËÑtype");
//			request.getSession().setAttribute("sort", new SortService().getSortName());
//			request.getSession().setAttribute("type", new TypeService().getTypeByName("link", s_type));
//		} else if (!sortIsNull && !typeIsNull) {
//			System.out.println("¶¼ËÑ");
//			request.getSession().setAttribute("sort", new SortService().getsortByName(s_sort));
//			request.getSession().setAttribute("type", new TypeService().getTypeByName("link", s_type));
//		}

		if (mode == null) {
			request.getSession().setAttribute("sort", new SortService().getSortName());
			request.getSession().setAttribute("type", new TypeService().getType("link"));
		} else {
			if (mode.equals("sort")) {
				request.getSession().setAttribute("sort", new SortService().getsortByName(s_sort));
				request.getSession().setAttribute("type", new TypeService().getType("link"));
			} else if (mode.equals("type")) {
				request.getSession().setAttribute("sort", new SortService().getSortName());
				request.getSession().setAttribute("type", new TypeService().getTypeByName("link", s_type));
			} else if (mode == null || mode.equals("")) {
				request.getSession().setAttribute("sort", new SortService().getSortName());
				request.getSession().setAttribute("type", new TypeService().getType("link"));
			}
		}
		request.getRequestDispatcher("/admin/admin_type.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
