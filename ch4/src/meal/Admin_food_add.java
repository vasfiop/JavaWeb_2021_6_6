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

import util.*;
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
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 设置请求的编码格式
		request.setCharacterEncoding("utf-8");
		// 读取请求中的信息
		String fn = request.getParameter("fn");
		String feo = request.getParameter("fea");
		String mat = request.getParameter("mat");
		String type = request.getParameter("type");
		String price = request.getParameter("price");
		String comm = request.getParameter("comm");
		Part img = request.getPart("pic");
		String pic = null;
		String file = FileUploadUtil.getFileExtName(img);
		if (!file.equals("")) {
			// 得到上传文件的扩展名
			String ext = FileUploadUtil.getFileExtName(img);
			if (ext.equalsIgnoreCase(".jpg") || ext.equalsIgnoreCase(".png") || ext.equalsIgnoreCase(".gif")) {
				// 完成上传并返回文件名
				pic = FileUploadUtil.uploadSingleFile(img, request);
			} else {
				// 非法上传
				out.println("<h1>上传的文件类型不符合要求：</h1>");
				return;
			}
		}

		String sql = "insert into food values(null,?,?,?,?,?,?,'0',?)";
		String[] params = { fn, feo, mat, price, type, pic, comm };
		int r = new DBUtil().update(sql, params);
		if (r == 1) {
			out.println("<h1> 添加菜品成功: </h1>");
		} else {
			out.println("<h1> 添加菜品失败: </h1>");
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
