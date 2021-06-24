package action.user;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.CollectService;

@WebServlet("*.user_collect")
public class UserCollect extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserCollect() {
		super();
	}

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getServletPath();
		path = path.substring(path.lastIndexOf('/') + 1, path.indexOf('.'));
		Map<String, String> user = (Map<String, String>) request.getSession().getAttribute("user");
		if (path.equals("add")) {
			String src = null;
			String shopid = null;
			src = request.getParameter("src");
			if (src != null) {
				shopid = request.getParameter("shopid");
				src = request.getContextPath() + "/" + request.getParameter("src") + "?shopid=" + shopid;
				int r = new CollectService().add(user.get("id"), shopid);
				if (r == 1) {
					response.sendRedirect(src);
				} else {
					request.setAttribute("msg", "添加失败！");
					request.setAttribute("href", src);
					request.getRequestDispatcher("/result.jsp").forward(request, response);
				}
			} else {
//				TODO 不需要跳转添加
				shopid = request.getParameter("shopid");
				int r = new CollectService().add(user.get("id"), shopid);
				if (r == 1) {
					request.getRequestDispatcher("javascript:history.back();location.reload();").forward(request,
							response);
				} else {
					System.out.println("失败");
				}
			}
		} else if (path.equals("del")) {
			String src = null;
			String shopid = null;
			src = request.getParameter("src");
			if (src != null) {
				shopid = request.getParameter("shopid");
				src = request.getContextPath() + "/" + request.getParameter("src") + "?shopid=" + shopid;
				int r = new CollectService().del(user.get("id"), shopid);
				if (r == 1) {
					response.sendRedirect(src);
				} else {
					request.setAttribute("msg", "删除失败！");
					request.setAttribute("href", src);
					request.getRequestDispatcher("/result.jsp").forward(request, response);
				}
			} else {
//				TODO 不需要跳转的删除
				shopid = request.getParameter("shopid");
				int r = new CollectService().del(user.get("id"), shopid);
				if (r == 1) {
					request.getRequestDispatcher("javascript:history.back();location.reload();").forward(request,
							response);
				} else {
					System.out.println("失败");
				}
			}
		} else if (path.equals("add_and_del")) {
			String shopid = request.getParameter("id");
			int r = new CollectService().add(user.get("id"), shopid);
			if (r == 1) {
				request.getRequestDispatcher("del_item.user_car?id=" + shopid).forward(request, response);
			} else {
				request.setAttribute("msg", "添加失败！");
				request.setAttribute("href", "inidex.user_car");
				request.getRequestDispatcher("/result.jsp").forward(request, response);
			}
		} else if (path.equals("index")) {
			request.setAttribute("shops", new CollectService().getCollect(user.get("id")));
			request.getRequestDispatcher("/user/user_collect_index.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
