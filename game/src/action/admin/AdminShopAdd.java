package action.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import service.ShopService;
import service.TypeService;
import util.FileUploadUtil;

@WebServlet("/admin/admin_shop_add")
@MultipartConfig
public class AdminShopAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminShopAdd() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String mode = request.getParameter("mode");
		if (mode.equals("1")) {
			request.getSession().setAttribute("types", new TypeService().getType());
			request.getRequestDispatcher("/admin/admin_shop_add.jsp").forward(request, response);
		} else {
			String name = request.getParameter("shopname");
			String title = request.getParameter("shoptitle");
			String type = request.getParameter("shoptype");
			String price = request.getParameter("shopprice");
			String comm = request.getParameter("shopcomm");
			Part img = request.getPart("shopfile");
			String pic = null;
			String file = FileUploadUtil.getFileExtName(img);
			if (!file.equals("")) {
				String ext = FileUploadUtil.getFileExtName(img);
				if (ext.equalsIgnoreCase(".jpg") || ext.equalsIgnoreCase(".png") || ext.equalsIgnoreCase(".gif"))
					pic = FileUploadUtil.uploadSingleFile(img, request);
				else {
					request.setAttribute("msg", "�ϴ����ļ����Ͳ�����Ҫ��!ֻ���ϴ�jpg,png,gif��ͼƬ��");
					request.setAttribute("href", "javascript:history.back()");
					request.getRequestDispatcher("/result.jsp").forward(request, response);
					return;
				}
			}
			
			int r = new ShopService().addShop(name, title, type, price, pic, comm);
			if (r == 1) {
				request.setAttribute("msg", "���Ӳ�Ʒ����ɹ�!");
			} else {
				request.setAttribute("msg", "���Ӳ�Ʒ����ʧ��!");
			}
			request.setAttribute("href", request.getContextPath() + "/admin/admin_shop");
			request.getRequestDispatcher("/result.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}