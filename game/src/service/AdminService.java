package service;

import java.util.Map;

import util.DBUtil;

public class AdminService {
	private DBUtil db = new DBUtil();

//	ͨ��username��password�ҵ�admin
	public Map<String, String> getAdmin(String username, String password) {
		String sql = "SELECT * FROM admin WHERE username=? and password=?";
		String[] params = { username, password };
		return db.getMap(sql, params);
	}
}
