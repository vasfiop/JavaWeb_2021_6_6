package service;

import java.util.List;
import java.util.Map;

import util.DBUtil;

public class UserService {
	private DBUtil db = new DBUtil();

	public Map<String, String> getUser(String username, String password) {
		String sql = "select * from user where username =? and password =?";

		String[] params = { username, password };

		return db.getMap(sql, params);
	}

}
