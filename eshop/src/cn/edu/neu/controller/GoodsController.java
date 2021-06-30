package cn.edu.neu.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.neu.service.HomeService;
import cn.edu.neu.service.GoodsService;

@WebServlet("*.goods")
public class GoodsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public GoodsController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getServletPath();
		path = path.substring(path.lastIndexOf('/') + 1, path.indexOf('.'));
		if (path.equals("hotGoods")) {
//			热销商品
			request.setAttribute("urlkey", "hotGoods");
			request.setAttribute("goods", HomeService.getHot());
			request.getRequestDispatcher("hot_goods.jsp").forward(request, response);
		} else if(path.equals("newGoods")) {
			request.setAttribute("urlkey", "newGoods");
			request.setAttribute("goods", GoodsService.getShopByDate());
			request.getRequestDispatcher("new_goods.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
