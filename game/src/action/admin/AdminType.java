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

@WebServlet("*.admin_type")
public class AdminType extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminType() {
		super();
	}

	@SuppressWarnings({ "unchecked", "unused" })
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getServletPath();
		path = path.substring(path.lastIndexOf('/') + 1, path.indexOf('.'));
		Map<String, String> user = (Map<String, String>) request.getSession().getAttribute("user");

		List<Map<String, String>> types = null;
		List<Map<String, String>> newtype = new ArrayList<Map<String, String>>();

		if (path.equals("list")) {
			if (types != null)
				types.clear();
			types = new ArrayList<Map<String, String>>();
			types = new TypeService().getType("link");
			request.getSession().setAttribute("types", types);
			request.getRequestDispatcher("page.admin_type?page=1").forward(request, response);
		} else if (path.equals("page")) {
			if (types == null)
				types = (List<Map<String, String>>) request.getSession().getAttribute("types");
			String page = request.getParameter("page");
			int moment = Integer.valueOf(page);
			int count = types.size();
			if (count != 0) {
				int pagecount = count / 8;
				pagecount = count % 8 == 0 ? pagecount : pagecount + 1;
				int TheLastNumber = count % 8 == 0 ? 8 : count % 8;
				for (int i = 0; i < (moment == pagecount ? TheLastNumber : 8); i++)
					newtype.add(types.get((moment - 1) * 8 + i));
				request.setAttribute("types", newtype);
				request.setAttribute("page", pagecount);
				request.setAttribute("moment", moment);
				request.getRequestDispatcher("/admin/admin_type_list.jsp").forward(request, response);
			} else {
				request.setAttribute("sorts", new SortService().getSortName());
				request.getRequestDispatcher("/admin/admin_type_list.jsp").forward(request, response);
			}
		} else if (path.equals("search")) {
			if (types != null)
				types.clear();
			types = new ArrayList<Map<String, String>>();
			String s_type = request.getParameter("s_type");
			if (s_type == null)
				types = new SortService().getSortName();
			else
				types = new SortService().getsortByName(s_type);
			request.getSession().setAttribute("types", types);
			request.getRequestDispatcher("page.admin_type?page=1").forward(request, response);
		} else if (path.equals("add")) {
			request.setAttribute("sorts", new SortService().getSortName());
			request.getRequestDispatcher("/admin/admin_type_add.jsp").forward(request, response);
		} else if (path.equals("new")) {
			String name = request.getParameter("typename");
			String typeid = request.getParameter("sortid");
			int r = new TypeService().add(name, typeid);
			if (r == 1)
				request.setAttribute("msg", "添加种类成功!");
			else
				request.setAttribute("msg", "添加种类失败!");
			request.setAttribute("href", request.getContextPath() + "/admin/list.admin_type");
			request.getRequestDispatcher("/result.jsp").forward(request, response);
		} else if (path.equals("edit")) {
			String id = request.getParameter("typeid");
			request.getSession().setAttribute("type", new TypeService().getTypeById(id));
			request.getSession().setAttribute("sort", new SortService().getSortName());
			request.getRequestDispatcher("/admin/admin_type_edit.jsp").forward(request, response);
		} else if (path.equals("update")) {
			String id = request.getParameter("typeid");
			String name = request.getParameter("typename");
			String sortid = request.getParameter("sortid");
			int r = new TypeService().Update(name, sortid, id);
			if (r == 1)
				request.setAttribute("msg", "修改种类成功!");
			else
				request.setAttribute("msg", "修改种类失败!");
			request.setAttribute("href", request.getContextPath() + "/admin/list.admin_type");
			request.getRequestDispatcher("/result.jsp").forward(request, response);
		} else if (path.equals("del")) {
			String id = request.getParameter("typeid");
			int r = new TypeService().delTypeById(id);
			if (r == 1)
				request.setAttribute("msg", "删除种类成功!");
			else
				request.setAttribute("msg", "删除种类失败!");

			request.setAttribute("href", request.getContextPath() + "/admin/list.admin_type");
			request.getRequestDispatcher("/result.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
