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

import service.ShopService;
import service.SortService;
import service.TalkService;

@WebServlet("*.admin_talk")
public class AdminTalk extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminTalk() {
		super();
	}

	@SuppressWarnings({ "unchecked", "unused" })
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getServletPath();
		path = path.substring(path.lastIndexOf('/') + 1, path.indexOf('.'));
		Map<String, String> user = (Map<String, String>) request.getSession().getAttribute("user");

		List<Map<String, String>> talks = null;
		List<Map<String, String>> newtalk = new ArrayList<Map<String, String>>();

		if (path.equals("list")) {
			if (talks != null)
				talks.clear();
			talks = new ArrayList<Map<String, String>>();
			talks = new TalkService().getTalkCount();

			request.getSession().setAttribute("talks", talks);
			request.getRequestDispatcher("page.admin_talk?page=1").forward(request, response);
		} else if (path.equals("page")) {
			if (talks == null)
				talks = (List<Map<String, String>>) request.getSession().getAttribute("talks");
			String page = request.getParameter("page");
			int moment = Integer.valueOf(page);
			if (newtalk != null)
				newtalk.clear();
			int count = talks.size();
			if (count != 0) {
				int pagecount = count / 5;
				pagecount = count % 5 == 0 ? pagecount : pagecount + 1;
				int TheLastNumber = count % 5 == 0 ? 5 : count % 5;
				for (int i = 0; i < (moment == pagecount ? TheLastNumber : 5); i++)
					newtalk.add(talks.get((moment - 1) * 5 + i));
				request.setAttribute("talks", newtalk);
				request.setAttribute("page", pagecount);
				request.setAttribute("moment", moment);
				request.getRequestDispatcher("/admin/admin_talk_list.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("/admin/admin_talk_list.jsp").forward(request, response);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
