package shop;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Answer
 */
@WebServlet("/shop/buy")
public class Buy extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Buy() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

//		 设置请求的参数为UTF-8
//		request.setCharacterEncoding("utf-8");

//		从session读取用户名
		String un = (String) request.getSession().getAttribute("用户名");

//		从请求中读取购买的商品
		String[] goods = request.getParameterValues("goods");

//		输出页面信息
		out.println("<!doctype html>\r\n" + 
				"<html lang=\"en\">\r\n" + 
				"\r\n" + 
				"<head>\r\n" + 
				"  <title>Title</title>\r\n" + 
				"  <!-- Required meta tags -->\r\n" + 
				"  <meta charset=\"utf-8\">\r\n" + 
				"  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\r\n" + 
				"\r\n" + 
				"  <link rel=\"stylesheet\" href=\"../resources/WebContent/bootstrap/css/bootstrap.min.css\">\r\n" + 
				"  <script src=\"../resources/WebContent/jquery/jquery-3.6.0.min.js\"></script>\r\n" + 
				"  <script src=\"../resources/WebContent/bootstrap/js/bootstrap.bundle.min.js\"></script>\r\n" + 
				"</head>\r\n" + 
				"\r\n" + 
				"<body>\r\n" + 
				"  <div class=\"container-fluid\">\r\n" + 
				"    <div class=\"row\">\r\n" + 
				"      <div class=\"col-md-3\">\r\n" + 
				"      </div>\r\n" + 
				"      <div class=\"col-md-6\">\r\n" + 
				"        <form method=\"POST\" action=\"answer\" role=\"form\">\r\n" + 
				"          <div class=\"form-group text-center\">\r\n");
//		输出用户的购买信息
		if(goods==null) {
			out.println(un+"你尚未选择商品!");
		}
		else{
			for(String s : goods) {
				out.println("<h3>"+un+",您确定购买"+s+"吗？</h3>");
			}
//			将商品存入到session中
			request.getSession().setAttribute("已购商品", goods);
		}	
		out.println(
				"          </div>\r\n" + 
				"          <div class=\"text-center\">\r\n" + 
				"            <button type=\"submit\" class=\"btn btn-primary\" name=\"sbmt\" value=\"true\">是</button>\r\n" + 
				"            <button type=\"submit\" class=\"btn btn-danger\" name=\"sbmt\" value=\"false\">否</button>\r\n" + 
				"          </div>\r\n" + 
				"        </form>\r\n" + 
				"      </div>\r\n" + 
				"      <div class=\"col-md-3\">\r\n" + 
				"      </div>\r\n" + 
				"    </div>\r\n" + 
				"  </div>\r\n" + 
				"</body>\r\n" + 
				"\r\n" + 
				"</html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
