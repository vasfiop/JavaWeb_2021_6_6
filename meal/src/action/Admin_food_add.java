package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import service.FoodService;
import util.DBUtil;
import util.FileUploadUtil;

/**
 * Servlet implementation class Admin_food_add
 */
@WebServlet("/admin/admin_food_add")
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
		request.setCharacterEncoding("utf-8");

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
			if (ext.equalsIgnoreCase(".jpg") || ext.equalsIgnoreCase(".png") || ext.equalsIgnoreCase(".gif"))
				// 完成上传并返回文件名
				pic = FileUploadUtil.uploadSingleFile(img, request);
			else {
				// 非法上传
				request.setAttribute("msg", "上传的文件类型不符合要求!");
				request.setAttribute("href", "javascript:history.back()");
				request.getRequestDispatcher("/result.jsp").forward(request, response);
				return;
			}
		}
		System.out.println(pic);

		int r = new FoodService().addFodd(fn, feo, mat, price, type, pic, comm);
		if (r == 1) {
			request.setAttribute("msg", "添加菜品分类成功!");
		} else {
			request.setAttribute("msg", "添加菜品分类失败!");
		}
		request.setAttribute("href", request.getContextPath() + "/admin/admin_food_list");
		request.getRequestDispatcher("/result.jsp").forward(request, response);
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
