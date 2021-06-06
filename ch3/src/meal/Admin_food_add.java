package meal;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import util.FileUploadUtil;

/**
 * Servlet implementation class Admin_food_add
 */
@WebServlet("/admin_food_add")
@MultipartConfig
public class Admin_food_add extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Admin_food_add() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		 设置请求的参数为UTF-8
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

//		 读取请求的参数un的值
		String un = request.getParameter("un");

//		 将un的值存入到session中
		request.getSession().setAttribute("用户名", un);

//		读取请求中的信息
		String fn = request.getParameter("foodname");
		String fea = request.getParameter("fea");
		String mat = request.getParameter("mat");
		String type = request.getParameter("type");
		String price = request.getParameter("price");
		String pic = null;
		String comn = request.getParameter("comn");
		Part img = request.getPart("pic");

		String file = FileUploadUtil.getFileName(img);

		if (!file.equals("")) {
//			得到上传文件的扩展名
			String ext = FileUploadUtil.getFileExtName(img);

			if (ext.equalsIgnoreCase(".jpg") || ext.equalsIgnoreCase(".png") || ext.equalsIgnoreCase(".gif")) {
//				合法上传
				out.println("<h3>upload success</h3>");
				out.println("<h3>菜名: " + fn + "</h3>");
//				完成上传并且返回文件名字
				pic = FileUploadUtil.uploadSingleFile(img, request);
				out.println("<h3>图片: " + pic + "</h3>");
			}
			else {
//				非法上传
				out.println("<h3>upload failed</h33>");
				out.println("<h3>上传的文件类型不符合要求!</h3>");
			}
		}
		else {
			out.println("<h3>upload null</h3>");
			out.println("<h3>上传的文件不可以为空!</h3>");
		}
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
