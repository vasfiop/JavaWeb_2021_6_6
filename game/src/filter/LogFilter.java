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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebFilter({"/shop_item","*.user_collect","*.user_car"})
public class LogFilter implements Filter {

	public LogFilter() {
	}

	public void destroy() {
	}

	@SuppressWarnings("unchecked")
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httprequest = (HttpServletRequest) request;
		HttpServletResponse httpresponse = (HttpServletResponse) response;
		Map<String, String> user = (Map<String, String>) httprequest.getSession().getAttribute("user");
		if (user != null) {
			chain.doFilter(request, response);
			return;
		} else {
			httprequest.setAttribute("msg", "请登陆后在进行操作!");
			httprequest.setAttribute("href", httprequest.getContextPath() + "/index.jsp");
			httprequest.getRequestDispatcher("/result.jsp").forward(request, response);
			chain.doFilter(request, response);
			return;
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
