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
}
