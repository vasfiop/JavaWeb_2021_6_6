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

//		 ��������Ĳ���ΪUTF-8
//		request.setCharacterEncoding("utf-8");

//		��session��ȡ�û���
		String un = (String) request.getSession().getAttribute("�û���");

//		�������ж�ȡ�������Ʒ
		String[] goods = request.getParameterValues("goods");

//		���ҳ����Ϣ
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
//		����û��Ĺ�����Ϣ
		if(goods==null) {
			out.println(un+"����δѡ����Ʒ!");
		}
		else{
			for(String s : goods) {
				out.println("<h3>"+un+",��ȷ������"+s+"��</h3>");
			}
//			����Ʒ���뵽session��
			request.getSession().setAttribute("�ѹ���Ʒ", goods);
		}	
		out.println(
				"          </div>\r\n" + 
				"          <div class=\"text-center\">\r\n" + 
				"            <button type=\"submit\" class=\"btn btn-primary\" name=\"sbmt\" value=\"true\">��</button>\r\n" + 
				"            <button type=\"submit\" class=\"btn btn-danger\" name=\"sbmt\" value=\"false\">��</button>\r\n" + 
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
