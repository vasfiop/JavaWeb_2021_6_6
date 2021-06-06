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
//		 ��������Ĳ���ΪUTF-8
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

//		 ��ȡ����Ĳ���un��ֵ
		String un = request.getParameter("un");

//		 ��un��ֵ���뵽session��
		request.getSession().setAttribute("�û���", un);

//		��ȡ�����е���Ϣ
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
//			�õ��ϴ��ļ�����չ��
			String ext = FileUploadUtil.getFileExtName(img);

			if (ext.equalsIgnoreCase(".jpg") || ext.equalsIgnoreCase(".png") || ext.equalsIgnoreCase(".gif")) {
//				�Ϸ��ϴ�
				out.println("<h3>upload success</h3>");
				out.println("<h3>����: " + fn + "</h3>");
//				����ϴ����ҷ����ļ�����
				pic = FileUploadUtil.uploadSingleFile(img, request);
				out.println("<h3>ͼƬ: " + pic + "</h3>");
			}
			else {
//				�Ƿ��ϴ�
				out.println("<h3>upload failed</h33>");
				out.println("<h3>�ϴ����ļ����Ͳ�����Ҫ��!</h3>");
			}
		}
		else {
			out.println("<h3>upload null</h3>");
			out.println("<h3>�ϴ����ļ�������Ϊ��!</h3>");
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
