package cn.edu.neu.service;

import java.util.List;
import java.util.Map;

import cn.edu.neu.dao.DBUtil;

public class GoodsService {
	private static DBUtil db = new DBUtil();

//	����ʱ������
	public static List<Map<String, Object>> getShopByDate() {
		String sql = "SELECT * FROM t_goods ORDER BY goods_date DESC";
		return db.getList(sql);
	}

//	����ĳһ����������
	public static List<Map<String, Object>> getShop(String mode, String value) {
		String sql = "SELECT * FROM t_goods WHERE " + mode + " = ?";
		String[] params = { value };
		return db.getList(sql, params);
	}

//	����
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
			sql = "SELECT * FROM t_goods WHERE cate_id = ? order by goods_sales DESC";
		String[] params = { "%" + search + "%" };
		return db.getList(sql, params);
	}

//	����
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
}
