package action.tool;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.tomcat.util.http.fileupload.FileUpload;

import util.FileUploadUtil;
import util.Time;

@WebServlet("/localupload")
public class LocalUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LocalUpload() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Part part = (Part) request.getSession().getAttribute("part");
		if (part == null) {
			System.out.println(new Time().getAllTime() + " part is null!");
		}
		FileUploadUtil.localupload(part);
		request.setAttribute("msg", "修改商品成功!");
		request.setAttribute("href", request.getContextPath() + "/admin/admin_shop");
		request.getRequestDispatcher("/result.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
