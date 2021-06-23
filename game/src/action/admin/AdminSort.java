package action.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.SortService;
import service.TypeService;

@WebServlet("*.admin_sort")
public class AdminSort extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminSort() {
		super();
	}

	@SuppressWarnings({ "unchecked", "unused" })
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getServletPath();
		path = path.substring(path.lastIndexOf('/') + 1, path.indexOf('.'));
		Map<String, String> user = (Map<String, String>) request.getSession().getAttribute("user");

		List<Map<String, String>> sorts = null;
		List<Map<String, String>> newsort = new ArrayList<Map<String, String>>();

		if (path.equals("sort_list")) {
			if (sorts != null)
				sorts.clear();

			sorts = new ArrayList<Map<String, String>>();
			sorts = new SortService().getSortName();

			request.getSession().setAttribute("sorts", sorts);
			request.getRequestDispatcher("page.admin_sort?page=1").forward(request, response);
		} else if (path.equals("page")) {
			if (sorts == null)
				sorts = (List<Map<String, String>>) request.getSession().getAttribute("sorts");
			String page = request.getParameter("page");
			int moment = Integer.valueOf(page);
			int count = sorts.size();
			if (count != 0) {
				int pagecount = count / 8;
				pagecount = count % 8 == 0 ? pagecount : pagecount + 1;
				int TheLastNumber = count % 8 == 0 ? 8 : count % 8;
				for (int i = 0; i < (moment == pagecount ? TheLastNumber : 8); i++)
					newsort.add(sorts.get((moment - 1) * 8 + i));
				request.setAttribute("sorts", newsort);
				request.setAttribute("page", pagecount);
				request.setAttribute("moment", moment);
				request.getRequestDispatcher("/admin/admin_sort_list.jsp").forward(request, response);
			} else {
				request.setAttribute("sort", new SortService().getSortName());
				request.getRequestDispatcher("/admin/admin_sort_list.jsp").forward(request, response);
			}
		} else if (path.equals("search")) {
			if (sorts != null)
				sorts.clear();
			sorts = new ArrayList<Map<String, String>>();
			String s_sort = request.getParameter("s_sort");
			if (s_sort == null)
				sorts = new SortService().getSortName();
			else
				sorts = new SortService().getsortByName(s_sort);
			request.getSession().setAttribute("sorts", sorts);
			request.getRequestDispatcher("page.admin_sort?page=1").forward(request, response);
		} else if (path.equals("add")) {
			request.setAttribute("types", new TypeService().getType());
			request.getRequestDispatcher("admin_sort_add.jsp").forward(request, response);
		} else if (path.equals("new")) {
			String sortname = request.getParameter("sortname");
			int r = new SortService().add(sortname);
			if (r == 1)
				request.setAttribute("msg", "添加分类成功!");
			else
				request.setAttribute("msg", "添加分类失败!");
			request.setAttribute("href", request.getContextPath() + "/admin/sort_list.admin_sort");
			request.getRequestDispatcher("/result.jsp").forward(request, response);
		} else if (path.equals("edit")) {
			String sortid = request.getParameter("sortid");

			request.setAttribute("sort", new SortService().getSortNameById(sortid));
			request.getRequestDispatcher("admin_sort_edit.jsp").forward(request, response);
		} else if (path.equals("update")) {
			String id = request.getParameter("sortid");
			String name = request.getParameter("sortname");

			int r = new SortService().Update(name, id);
			if (r == 1) {
				request.setAttribute("msg", "修改分类成功!");
			} else {
				request.setAttribute("msg", "修改分类失败!");
			}
			request.setAttribute("href", request.getContextPath() + "/admin/sort_list.admin_sort");
			request.getRequestDispatcher("/result.jsp").forward(request, response);
		} else if (path.equals("del")) {
			String id = request.getParameter("sortid");
			int r = new SortService().delSortById(id);
			if (r == 1)
				request.setAttribute("msg", "删除分类成功!");
			else
				request.setAttribute("msg", "删除分类失败!");
			request.setAttribute("href", request.getContextPath() + "/admin/sort_list.admin_sort");
			request.getRequestDispatcher("/result.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
