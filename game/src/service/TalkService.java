package service;

import java.util.*;
import util.DBUtil;

public class TalkService {
	private DBUtil db = new DBUtil();

//	�������
	public int add(String talk, String userid, String adminid) {
		String sql = "insert into talk values(null,?,?,?,0)";
		String[] params = { talk, userid, adminid };
		return db.update(sql, params);
	}

//	ͨ��ĳһ��������
	public List<Map<String, String>> getTalk(String mode, String value) {
		String sql = "select * from talk where " + mode + " = ?";
		String[] params = { value };
		return db.getList(sql, params);
	}

//	ɾ��
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
