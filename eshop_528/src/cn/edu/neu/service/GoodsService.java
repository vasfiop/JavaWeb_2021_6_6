package cn.edu.neu.service;

import java.util.List;
import java.util.Map;

import cn.edu.neu.dao.DBUtil;

public class GoodsService {
	private static DBUtil db = new DBUtil();

//	根据时间排序
	public static List<Map<String, Object>> getShopByDate() {
		String sql = "SELECT * FROM t_goods ORDER BY goods_date DESC";
		return db.getList(sql);
	}

//	根据某一个东西查找
	public static List<Map<String, Object>> getShop(String mode, String value) {
		String sql = "SELECT * FROM t_goods WHERE " + mode + " = ?";
		String[] params = { value };
		return db.getList(sql, params);
	}

//	搜索
	public static List<Map<String, Object>> search(String search) {
		String sql = "SELECT * FROM t_goods WHERE goods_name LIKE ?";
		String[] params = { "%" + search + "%" };
		return db.getList(sql, params);
	}

	public static List<Map<String, Object>> search(String sort, String search) {
		String sql = null;
		if (sort.equals("1"))
			sql = "SELECT * FROM t_goods WHERE goods_name LIKE ? order by goods_discount";
		else if (sort.equals("2"))
			sql = "SELECT * FROM t_goods WHERE goods_name LIKE ? order by goods_discount DESC";
		else if (sort.equals("3"))
			sql = "SELECT * FROM t_goods WHERE goods_name LIKE ? order by goods_sales";
		else if (sort.equals("4"))
			sql = "SELECT * FROM t_goods WHERE goods_name LIKE ? order by goods_sales DESC";
		String[] params = { "%" + search + "%" };
		return db.getList(sql, params);
	}

//	排序
	public static List<Map<String, Object>> getShopBySort(String sort, String cateid) {
		String sql = null;
		if (sort.equals("1"))
			sql = "SELECT * FROM t_goods WHERE cate_id = ? order by goods_discount";
		else if (sort.equals("2"))
			sql = "SELECT * FROM t_goods WHERE cate_id = ? order by goods_discount DESC";
		else if (sort.equals("3"))
			sql = "SELECT * FROM t_goods WHERE cate_id = ? order by goods_sales";
		else if (sort.equals("4"))
			sql = "SELECT * FROM t_goods WHERE cate_id = ? order by goods_sales DESC";
		String[] params = { cateid };
		return db.getList(sql, params);
	}

//	通过id来查找
	public static Map<String, Object> getGoodById(String goods_id) {
		String sql_good = "SELECT g.*,(select cate_name from t_category where cate_id = g.cate_id) as cate_name from t_goods g where goods_id = ?";
		String sql_type = "SELECT * FROM t_goodsdetail WHERE goods_id = ? ORDER BY type_id";
		String sql_type_name = "SELECT * FROM t_goodsdetailtype WHERE type_id in(SELECT type_id FROM t_goodsdetail WHERE goods_id = ? ORDER BY type_id)";
		String sql_pic = "SELECT * FROM t_pic WHERE goods_id = ?";

		Object[] params = { goods_id };
		Map<String, Object> good = db.getMap(sql_good, params);
		good.put("typetitle", db.getList(sql_type_name, params));
		good.put("typename", db.getList(sql_type, params));
		good.put("pic", db.getList(sql_pic, params));
		
		return good;
	}
}
