package cn.edu.neu.service;

import java.util.*;

import cn.edu.neu.dao.DBUtil;

public class UserService {
	private static DBUtil db = new DBUtil();

//	�����û���������
	public static int Update(String user_age, String user_sex, String user_email, String user_id) {
		String sql = "update t_user set user_age=?,user_sex=?,user_email=? where user_id =?";
		String[] params = { user_age, user_sex, user_email, user_id };
		return db.update(sql, params);
	}

//	ͨ��id�ҵ��û�
	public static Map<String, Object> getUser(String user_id) {
		String sql = "SELECT * FROM t_user WHERE user_id = ?";
		String[] params = { user_id };
		return db.getMap(sql, params);
	}

//	�޸��û�������
	public static int Update(String user_pass, String user_id) {
		String sql = "update t_user set user_pass = ? where user_id = ?";
		String[] params = { user_pass, user_id };
		return db.update(sql, params);
	}

//	��ѯ�û��Ĺ����ַ
	public static List<Map<String, Object>> getAddress(String user_id) {
		String sql = "SELECT * FROM t_address WHERE user_id = ?";
		String[] params = { user_id };
		return db.getList(sql, params);
	}
}
