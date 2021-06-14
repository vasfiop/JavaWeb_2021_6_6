package service;

import java.util.List;
import java.util.Map;

import util.DBUtil;

public class UserService {
	private DBUtil db = new DBUtil();

//	通过账号密码来搜索用户
	public Map<String, String> getUser(String username, String password) {
		String sql = "select * from user where username =? and password =?";
		String[] params = { username, password };
		return db.getMap(sql, params);
	}

//	所有用户
	public List<Map<String, String>> getUsers() {
		String sql = "select * from user";
		return db.getList(sql);
	}

//	通过用户名搜索
	public List<Map<String, String>> getUserByName(String name) {
		String sql = "select * from user where username like ?";
		String[] params = { "%" + name + "%" };
		return db.getList(sql, params);
	}

//	删除该用户
	public int delUserById(String id) {
		String sql = "delete from user where id=?";
		String params[] = { id };
		return db.update(sql, params);
	}

//	用户状态的更新
	public int Update(String id, String mode) {
		String sql = "update user set frozen=? where id=?";
		String[] params = { mode, id };
		return db.update(sql, params);
	}

}
