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
import util.FileUploadUtil;

@WebServlet("/admin/admin_shop_edit")
@MultipartConfig
public class AdminShopEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminShopEdit() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("shopid");

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
				request.setAttribute("msg", "上传的文件类型不符合要求!只能上传jpg,png,gif的图片。");
				request.setAttribute("href", "javascript:history.back()");
				request.getRequestDispatcher("/result.jsp").forward(request, response);
				return;
			}
		}

		int r = new ShopService().Update(id, name, title, type, price, pic, comm);
		if (r == 1) {
			FileUploadUtil.filecopy();
			request.setAttribute("msg", "修改商品成功!");
		} else {
			request.setAttribute("msg", "修改商品失败!");
		}
		request.setAttribute("href", request.getContextPath() + "/admin/shop_list.admin_shop");
		request.getRequestDispatcher("/result.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
