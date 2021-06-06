package meal;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.*;

/**
 * Servlet implementation class Admin_type_list
 */
@WebServlet("/admin_type_list")
public class Admin_type_list extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Admin_type_list() {
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
//		连接数据库
		String sql = "select * from foodtype";
		List<Map<String, String>> list = new DBUtil().getList(sql);
		if (list != null) {
			out.println("<!doctype html>\r\n" + 
					"<html lang=\"en\">\r\n" + 
					"\r\n" + 
					"<head>\r\n" + 
					"  <title>管理员分类菜品信息</title>\r\n" + 
					"  <!-- Required meta tags -->\r\n" + 
					"  <meta charset=\"utf-8\">\r\n" + 
					"  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\r\n" + 
					"\r\n" + 
					"  <!-- 新 Bootstrap4 核心 CSS 文件 -->\r\n" + 
					"  <link rel=\"stylesheet\" href=\"./resources/WebContent/bootstrap/css/bootstrap.min.css\">\r\n" + 
					"\r\n" + 
					"  <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->\r\n" + 
					"  <script src=\"./resources/WebContent/jquery/jquery-3.6.0.min.js\"></script>\r\n" + 
					"\r\n" + 
					"  <!-- 最新的 Bootstrap4 核心 JavaScript 文件 -->\r\n" + 
					"  <script src=\"./resources/WebContent/bootstrap/js/bootstrap.bundle.min.js\"></script>\r\n" + 
					"\r\n" + 
					"</head>\r\n" + 
					"\r\n" + 
					"<body>\r\n" + 
					"  <div class=\"container-fluid\">\r\n" + 
					"    <div class=\"row\">\r\n" + 
					"      <div class=\"col-md-12\">\r\n" + 
					"        <nav class=\"navbar navbar-expand-lg navbar-light bg-light\">\r\n" + 
					"\r\n" + 
					"          <button class=\"navbar-toggler\" type=\"button\" data-toggle=\"collapse\"\r\n" + 
					"            data-target=\"#bs-example-navbar-collapse-1\">\r\n" + 
					"            <span class=\"navbar-toggler-icon\"></span>\r\n" + 
					"          </button>\r\n" + 
					"          <a class=\"navbar-brand\" href=\"admin_index.html\"><span class=\"text-info\">网络点餐系统</span></a>\r\n" + 
					"          <div class=\"collapse navbar-collapse\" id=\"bs-example-navbar-collapse-1\">\r\n" + 
					"            <ul class=\"navbar-nav\">\r\n" + 
					"              <li class=\"nav-item\">\r\n" + 
					"                <a class=\"nav-link\" href=\"admin_user_list.html\">用户管理</a>\r\n" + 
					"              </li>\r\n" + 
					"              <li class=\"nav-item active\">\r\n" + 
					"                <a class=\"nav-link\" href=\"admin_type_list\">菜品分类管理</a>\r\n" + 
					"              </li>\r\n" + 
					"              <li class=\"nav-item\">\r\n" + 
					"                <a class=\"nav-link\" href=\"admin_food_list.html\">菜品管理</a>\r\n" + 
					"              </li>\r\n" + 
					"              <li class=\"nav-item\">\r\n" + 
					"                <a class=\"nav-link\" href=\"admin_dc_show.html\">查看用户点餐情况</a>\r\n" + 
					"              </li>\r\n" + 
					"            </ul>\r\n" + 
					"            <ul class=\"navbar-nav ml-md-auto\">\r\n" + 
					"              <li class=\"nav-item dropdown\">\r\n" + 
					"                <a class=\"nav-link dropdown-toggle\" id=\"navbarDropdownMenuLink\"\r\n" + 
					"                  data-toggle=\"dropdown\">admin</a>\r\n" + 
					"                <div class=\"dropdown-menu dropdown-menu-right\" aria-labelledby=\"navbarDropdownMenuLink\">\r\n" + 
					"                  <a class=\"dropdown-item\" href=\"homepage.html\">退出登录</a>\r\n" + 
					"                </div>\r\n" + 
					"              </li>\r\n" + 
					"            </ul>\r\n" + 
					"          </div>\r\n" + 
					"\r\n" + 
					"        </nav>\r\n" + 
					"      </div>\r\n" + 
					"    </div>\r\n" + 
					"  </div>\r\n" + 
					"\r\n" + 
					"  <div class=\"container\">\r\n" + 
					"    <div class=\"row\">\r\n" + 
					"\r\n" + 
					"      <div class=\"col-md-3\">\r\n" + 
					"      </div>\r\n" + 
					"\r\n" + 
					"      <div class=\"col-md-6\">\r\n" + 
					"        <div class=\"card\">\r\n" + 
					"          <div class=\"card-header\">\r\n" + 
					"            <!-- 搜索表单 -->\r\n" + 
					"            <form role=\"form\" class=\"form-inline\">\r\n" + 
					"              <div class=\"form-group\">\r\n" + 
					"                <input type=\"text\" class=\"form-control\" id=\"exampleInputEmail1\" name=\"s_tn\" placeholder=\"按分类名搜索\" />\r\n" + 
					"              </div>\r\n" + 
					"              &nbsp;&nbsp;&nbsp;\r\n" + 
					"              <button href=\"admin_food_list.html\" class=\"btn btn-outline-primary\">\r\n" + 
					"                搜索\r\n" + 
					"              </button>\r\n" + 
					"              &nbsp;&nbsp;&nbsp;\r\n" + 
					"              <a href=\"admin_type_add.html\" role=\"button\" class=\"btn btn-outline-success\">\r\n" + 
					"                添加分类\r\n" + 
					"              </a>\r\n" + 
					"            </form>\r\n" + 
					"          </div>\r\n" + 
					"          <div class=\"card-body\">\r\n" + 
					"            <!-- table -->\r\n" + 
					"            <form action=\"user_dc_show.html\" method=\"POST\">\r\n" + 
					"              <table class=\"table table-hover table-striped\">\r\n" + 
					"                <thead>\r\n" + 
					"                  <tr>\r\n" + 
					"                    <th>#</th>\r\n" + 
					"                    <th>分类名称</th>\r\n" + 
					"                    <th>操作</th>\r\n" + 
					"                  </tr>\r\n" + 
					"                </thead>\r\n" + 
					"                <tbody>");
			int i=0;
			for(Map<String,String> t:list)
			{
				i++;
				out.println("<tr><th>"+i+"</th>");
				out.println("<td>"+t.get("typename")+"</td>");
				out.println("                    <td>\r\n" + 
						"                      <a href=\"admin_type_edit.html\" role=\"button\" class=\"btn btn-outline-warning btn-sm\">修改</a>\r\n" + 
						"                      <a href=\"#modal_del\" role=\"button\" class=\"btn btn-outline-danger btn-sm\"\r\n" + 
						"                        data-toggle=\"modal\">删除</a>\r\n" + 
						"                    </td>\r\n" + 
						"                  </tr>");
			}
			out.println(" </tbody>\r\n" + 
					"              </table>\r\n" + 
					"            </form>\r\n" + 
					"          </div>\r\n" + 
					"        </div>\r\n" + 
					"      </div>\r\n" + 
					"\r\n" + 
					"      <div class=\"col-md-3\">\r\n" + 
					"      </div>\r\n" + 
					"\r\n" + 
					"    </div>\r\n" + 
					"  </div>\r\n" + 
					"\r\n" + 
					"  <!-- 删除模态框 -->\r\n" + 
					"  <div class=\"modal fade\" id=\"modal_del\" role=\"dialog\" aria-labelledby=\"myModalLabel\" aria-hidden=\"true\">\r\n" + 
					"    <div class=\"modal-dialog\" role=\"document\">\r\n" + 
					"      <div class=\"modal-content\">\r\n" + 
					"        <div class=\"modal-header bg-primary\">\r\n" + 
					"          <h5 class=\"modal-title text-white\" id=\"myModalLabel\">\r\n" + 
					"            删除确认\r\n" + 
					"          </h5>\r\n" + 
					"          <button type=\"button\" class=\"close\" data-dismiss=\"modal\">\r\n" + 
					"            <span aria-hidden=\"true\">×</span>\r\n" + 
					"          </button>\r\n" + 
					"        </div>\r\n" + 
					"        <div class=\"modal-body\">\r\n" + 
					"          <h4 class=\"text-danger\">\r\n" + 
					"            确定要删除该分类(分类下必须无菜品)吗？\r\n" + 
					"          </h4>\r\n" + 
					"        </div>\r\n" + 
					"        <div class=\"modal-footer\">\r\n" + 
					"          <button type=\"button\" class=\"btn btn-secondary\" data-dismiss=\"modal\">\r\n" + 
					"            取消\r\n" + 
					"          </button>\r\n" + 
					"          <button type=\"button\" class=\"btn btn-danger\" data-dismiss=\"modal\">\r\n" + 
					"            确定\r\n" + 
					"          </button>\r\n" + 
					"        </div>\r\n" + 
					"      </div>\r\n" + 
					"    </div>\r\n" + 
					"  </div>\r\n" + 
					"\r\n" + 
					"</body>\r\n" + 
					"\r\n" + 
					"</html>");
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
