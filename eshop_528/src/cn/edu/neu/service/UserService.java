package cn.edu.neu.service;

import java.util.*;

import cn.edu.neu.dao.DBUtil;

public class UserService {
	private static DBUtil db = new DBUtil();

//	更新用户个人资料
	public static int Update(String user_age, String user_sex, String user_email, String user_id) {
		String sql = "update t_user set user_age=?,user_sex=?,user_email=? where user_id =?";
		String[] params = { user_age, user_sex, user_email, user_id };
		return db.update(sql, params);
	}

//	通过id找到用户
	public static Map<String, Object> getUser(String user_id) {
		String sql = "SELECT * FROM t_user WHERE user_id = ?";
		String[] params = { user_id };
		return db.getMap(sql, params);
	}

//	修改用户的密码
	public static int Update(String user_pass, String user_id) {
		String sql = "update t_user set user_pass = ? where user_id = ?";
		String[] params = { user_pass, user_id };
		return db.update(sql, params);
	}

//	查询用户的购买地址
	public static List<Map<String, Object>> getAddress(String user_id) {
		String sql = "SELECT * FROM t_address WHERE user_id = ?";
		String[] params = { user_id };
		return db.getList(sql, params);
	}

//	添加地址
	public static int addAddress(String addr_province, String addr_city, String addr_area, String addr_content,
			String addr_receiver, String addr_tel, String user_id) {
		String sql = "insert into t_address values(null,?,?,?,?,?,?,?,0)";
		String[] params = { user_id, addr_province, addr_city, addr_area, addr_content, addr_receiver, addr_tel };

		return db.update(sql, params);
	}

//	找回添加地址的id
	public static String getAddressNewId(String user_id) {
		String sql = "SELECT MAX(addr_id) max FROM t_address WHERE user_id = ?";
		String[] params = { user_id };

		return String.valueOf(db.getMap(sql, params).get("max"));
	}

//	修改地址
	public static int changeAddress(String addr_province, String addr_city, String addr_area, String addr_content,
			String addr_receiver, String addr_tel, String addr_id) {
		String sql = "update t_address set addr_province = ? , addr_city = ? , addr_area = ? , addr_content = ? , addr_receiver = ? , addr_tel = ? where addr_id = ?";
		String[] params = { addr_province, addr_city, addr_area, addr_content, addr_receiver, addr_tel, addr_id };
		return db.update(sql, params);
	}

//	删除地址
	public static int delAddress(String addr_id) {
		String sql = "delete from t_address where addr_id=?";
		String[] params = { addr_id };
		return db.update(sql, params);
	}

//	修改默认地址
	public static int changeDefault(String addr_id, String user_id) {
		String sql = "update t_address set addr_isdefault=0 where user_id=?";
		Object params[] = { user_id };
		db.update(sql, params);
		sql = "update t_address set addr_isdefault=1 where addr_id=?";
		params[0] = addr_id;
		return db.update(sql, params);
	}
}
