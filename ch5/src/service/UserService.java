package service;

import java.util.Map;

import util.DBUtil;

public class UserService {
	private DBUtil db = new DBUtil();

//	根据用户的名字和密码进行查询
	public Map<String, String> getUserByNameAndPass(String username, String password) {
		String sql = "select * from user where username =? and password =?";
		String[] params = { username, password };

		return db.getMap(sql, params);
	}

//	注册
	public int register(String un, String pw, String tel, String addr) {
		String sql = "insert into user values(null,?,?,'0',?,?)";
		String[] params = { un, pw, tel, addr };

		return db.update(sql, params);
	}

//	根据id读取用户信息
	public Map<String, String> getUserById(String id) {
		String sql = "select * from user where id =?";

		String[] params = { id };
		return db.getMap(sql, params);
	}

//	用户修改个人信息
	public int upDate(String pw, String dh, String addr, String id) {
		String sql = "update user set password=?,telephone=?,address=? where id=?";
		String[] params = { pw, dh, addr, id };
		return db.update(sql, params);
	}
}
