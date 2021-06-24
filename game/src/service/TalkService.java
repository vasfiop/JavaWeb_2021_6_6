package service;

import java.util.*;
import util.DBUtil;

public class TalkService {
	private DBUtil db = new DBUtil();

//	添加评论
	public int add(String talk, String userid, String adminid) {
		String sql = "insert into talk values(null,?,?,?,0)";
		String[] params = { talk, userid, adminid };
		return db.update(sql, params);
	}

//	通过某一列找评论
	public List<Map<String, String>> getTalk(String mode, String value) {
		String sql = "select * from talk where " + mode + " = ?";
		String[] params = { value };
		return db.getList(sql, params);
	}

//	删除
	public int del(String mode, String value) {
		String sql = "delete from talk where " + mode + " = ?";
		String[] params = { value };
		return db.update(sql, params);
	}

	public List<Map<String, String>> getTalkCount() {
		String sql = "select userid,count(userid) count from talk GROUP BY userid";
		return db.getList(sql);
	}
}
