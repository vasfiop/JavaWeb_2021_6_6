package cn.edu.neu.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

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

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String path = request.getServletPath();
		path = path.substring(path.lastIndexOf('/') + 1, path.indexOf('.'));
		List<Map<String, Object>> cates = HomeService.getSort();
		request.getSession().removeAttribute("search");
		request.setAttribute("cates", cates);
		if (path.equals("hotGoods")) {
//			热销商品
			request.getSession().setAttribute("value", "1");
			request.setAttribute("urlkey", "hotGoods");
			request.getSession().setAttribute("goods", HomeService.getHot());
			request.getRequestDispatcher("hot_goods.jsp").forward(request, response);
		} else if (path.equals("newGoods")) {
//			新商品
			request.getSession().setAttribute("value", "1");
			request.setAttribute("urlkey", "newGoods");
			request.getSession().setAttribute("goods", GoodsService.getShopByDate());
			request.getRequestDispatcher("new_goods.jsp").forward(request, response);
		} else if (path.equals("type")) {
			String id = request.getParameter("cateid");
			request.setAttribute("goods", GoodsService.getShop("cate_id", id));
			request.setAttribute("urlkey", id);
			request.getSession().setAttribute("value", id);
			request.getSession().removeAttribute("search");
			request.getRequestDispatcher("goods_type.jsp").forward(request, response);
		} else if (path.equals("search")) {
			String search = request.getParameter("search");
			request.getSession().setAttribute("search", search);
			request.setAttribute("goods", GoodsService.search(search));
			request.setAttribute("urlkey", "search");
			request.getRequestDispatcher("goods_type.jsp").forward(request, response);
		} else if (path.equals("searchGoods")) {
			String sort = request.getParameter("sort");
			String cateid = (String) request.getSession().getAttribute("value");
			String search = (String) request.getSession().getAttribute("search");
			List<Map<String, Object>> goods = new ArrayList<Map<String, Object>>();

			if (cateid != null && !cateid.equals(""))
				goods = GoodsService.getShopBySort(sort, cateid);

			if (search != null && !search.equals("")) {
				goods = GoodsService.search(sort, search);
			}

			request.setAttribute("goods", goods);
			request.setAttribute("urlkey", cateid);
			request.getRequestDispatcher("goods_type.jsp").forward(request, response);
		} else if (path.equals("gooditem")) {
			String goods_id = request.getParameter("goodsid");
			Map<String, Object> good = GoodsService.getGoodById(goods_id);
			request.setAttribute("good", good);
			request.getRequestDispatcher("goods_item.jsp").forward(request, response);
		} else if (path.equals("addCart")) {
			response.setContentType("text/json;charset=utf-8");
			PrintWriter out = response.getWriter();

			Map<String, Object> carts = (Map<String, Object>) request.getSession().getAttribute("carts");
			String goods_id = request.getParameter("goods_id");
			String goods_name = request.getParameter("goods_name");
			String goods_pic = request.getParameter("goods_pic");
			String goods_price = request.getParameter("goods_price");
			String goods_count = request.getParameter("goods_count");

			if (carts != null && carts.get(goods_id) != null) {
				Map<String, Object> item = (Map<String, Object>) carts.get(goods_id);
				String newCount = String
						.valueOf(Integer.valueOf(goods_count) + Integer.valueOf((String) item.get("goods_count")));
				((Map<String, Object>) carts.get(goods_id)).put("goods_count", newCount);
			} else {
				Map<String, Object> item = new HashMap<String, Object>();
				if (carts == null)
					carts = new HashMap<String, Object>();
				item.put("goods_id", goods_id);
				item.put("goods_name", goods_name);
				item.put("goods_pic", goods_pic);
				item.put("goods_price", goods_price);
				item.put("goods_count", goods_count);
				carts.put(goods_id, item);
			}
			out.print(carts.size());
			out.flush();
			request.getSession().setAttribute("carts", carts);
			request.getSession().setAttribute("cartcount", carts.size());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
