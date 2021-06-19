package filter;

import java.io.IOException;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter("/user/user_car")
public class LogFilter implements Filter {

	public LogFilter() {
	}

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
//		Map<String,String> user = (Map<String, String>) request.getAttribute("user");
//		String id = request.getParameter("id");
//		System.out.println(id);
//		System.out.println(user);
//		if (id == null || id.equals("")) {
//			request.setAttribute("msg", "ÇëµÇÂ¼£¡");
//			request.setAttribute("href", "/game/homepage");
//			request.getRequestDispatcher("/result.jsp").forward(request, response);
//		}
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
