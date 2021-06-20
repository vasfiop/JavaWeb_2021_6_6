package service;

import java.util.List;
import java.util.Map;

import util.DBUtil;

public class UserService {
	private DBUtil db = new DBUtil();

//	通过账号密码来搜索用户
	public Map<String, String> getUser(String username, String password) {
		String sql = "select * from user where signinname =? and password =?";
		String[] params = { username, password };
		return db.getMap(sql, params);
	}

//	通过手机号和密码来搜索
	public Map<String, String> getUserByTel(String tel, String password) {
		String sql = "select * from user where telephone =? and password =?";
		String[] params = { tel, password };
		return db.getMap(sql, params);
	}

//	通过手机号来搜索
	public Map<String, String> getUserByTel(String tel) {
		String sql = "select * from user where telephone =?";
		String[] params = { tel };
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

//	添加用户
	public int add(String username, String password, String tel) {
		String sql = "insert into user values(null,?,?,0,?,0,?,?,?)";
		String params[] = { username, password, tel, username, "0", username };
		return db.update(sql, params);
	}

//	更新用户的登录名+昵称+性别
	public int Update(String signinname, String sex, String nickname, String userid) {
		String sql = "update user set signinname=?,sex=?,nickname=? where id =?";
		String params[] = { signinname, sex, nickname, userid };
		return db.update(sql, params);
	}

//	更新用户的某一条
	public int Update(String mode, String userid, String value) {
		String sql = "update user set " + mode + " = ? where id = ?";
		String[] params = { value, userid };
		return db.update(sql, params);
	}

//	通过id获得
	public Map<String, String> getUser(String userid) {
		String sql = "select * from user where id = ?";
		String[] params = { userid };
		return db.getMap(sql, params);
	}
}