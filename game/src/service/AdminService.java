package service;

import java.util.List;
import java.util.Map;

import util.DBUtil;

public class AdminService {
	private DBUtil db = new DBUtil();

//	通过username和password找到admin
	public Map<String, String> getAdmin(String username, String password) {
		String sql = "SELECT * FROM admin WHERE username=? and password=?";
		String[] params = { username, password };
		return db.getMap(sql, params);
	}

//	搜索全部用户
	public List<Map<String, String>> getAdmin() {
		String sql = "select * from admin";
		return db.getList(sql);
	}

//	通过名字来搜索
	public List<Map<String, String>> getAdmin(String search) {
		String sql = "select * from admin where username like ?";
		String[] params = { "%" + search + "%" };
		return db.getList(sql, params);
	}

//	删除管理员
	public int del(String id) {
		String sql = "delete from admin where id=?";
		String[] params = { id };
		return db.update(sql, params);
	}

//	更新用户最后登录时间
	public int update(String adminid) {
		String sql = "update admin set lastlogtime = SYSDATE() where id = ?";
		String[] params = { adminid };
		return db.update(sql, params);
	}
}
