package cn.edu.neu.service;

import cn.edu.neu.dao.*;
import java.util.*;

public class HomeService {
	private static DBUtil db = new DBUtil();

	public static List<Map<String, Object>> getSort() {
		String sql_sort = "SELECT * FROM t_category WHERE parentid is NULL";
		String sql_type = "SELECT * FROM t_category WHERE parentid = ? LIMIT 0,7";
		String sql_goods = "SELECT * FROM t_goods WHERE cate_id in(SELECT cate_id FROM t_category WHERE parentid = ?) order by goods_date desc LIMIT 0,6";
		List<Map<String, Object>> cate_list = db.getList(sql_sort);
		for (Map<String, Object> map : cate_list) {
			int cateid = (int) map.get("cate_id");
			map.put("childlist", db.getList(sql_type, new Object[] { cateid }));
			map.put("goodslist", db.getList(sql_goods, new Object[] { cateid }));
		}
		return cate_list;
	}

	public static List<Map<String, Object>> getToday() {
		String sql = "SELECT * FROM t_goods WHERE istoday = 1 LIMIT 5";
		return db.getList(sql);
	}

	public static List<Map<String, Object>> getHot() {
		String sql = "SELECT * FROM t_goods ORDER BY goods_sales DESC LIMIT 0,12";
		return db.getList(sql);
	}

//	通过用户名和密码找到用户
	public static Map<String, Object> getUser(String username, String password) {
		String sql = "SELECT * FROM t_user WHERE user_name = ? AND user_pass = ?";
		String[] params = { username, password };
		return db.getMap(sql, params);
	}

	public static int addUser(String username, String password, String age, String sex, String email) {
		String sql = "insert into t_user values(null,?,?,?,?,?,0)";
		String[] params = { username, password, age, sex, email };
		return db.update(sql, params);
	}
}
