package cn.edu.neu.service;

import java.util.List;
import java.util.Map;

import cn.edu.neu.dao.DBUtil;

public class GoodsService {
	private static DBUtil db = new DBUtil();

	public static List<Map<String, Object>> getShopByDate() {
		String sql = "SELECT * FROM t_goods ORDER BY goods_date DESC";
		return db.getList(sql);
	}
}
