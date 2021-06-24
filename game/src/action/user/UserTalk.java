package action.user;

import java.io.IOException;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.AdminService;
import service.TalkService;

@WebServlet("*.user_talk")
public class UserTalk extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserTalk() {
		super();
	}

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getServletPath();
		path = path.substring(path.lastIndexOf('/') + 1, path.indexOf('.'));
		Map<String, String> user = (Map<String, String>) request.getSession().getAttribute("user");
		if (path.equals("index")) {
			request.setAttribute("admin", new AdminService().getAdmin());
			request.getRequestDispatcher("/user/user_talk_index.jsp").forward(request, response);
		} else if (path.equals("submit")) {
			String submit = request.getParameter("editor");
			String adminid = request.getParameter("adminid");
			int r = new TalkService().add(submit, user.get("id"), adminid);
			if (r == 0) {
				request.setAttribute("msg", "添加失败！");
				request.setAttribute("href", "index.user_talk");
			} else {
				request.setAttribute("msg", "添加成功！");
				request.setAttribute("href", "user_homepage");
			}
			request.getRequestDispatcher("/result.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
