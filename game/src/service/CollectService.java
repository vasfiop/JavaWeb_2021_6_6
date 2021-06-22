package service;

import java.util.List;
import java.util.Map;

import util.DBUtil;

public class CollectService {
	private DBUtil db = new DBUtil();

//	ͨ��userid��shopid���ҵ���һ��Ʒ
	public Map<String, String> getCollect(String userid, String shopid) {
		String sql = "SELECT * FROM collect WHERE userid=? AND shopid = ?";
		String[] params = { userid, shopid };

		return db.getMap(sql, params);
	}

//	���
	public int add(String userid, String shopid) {
		String sql = "insert into collect values(null,?,?)";
		String[] params = { userid, shopid };
		return db.update(sql, params);
	}

//	ɾ��
	public int del(String userid, String shopid) {
		String sql = "delete from collect where userid = ? and shopid = ?";
		String[] params = { userid, shopid };
		return db.update(sql, params);
	}

	public List<Map<String, String>> getCollect(String userid) {
		String sql = "SELECT s.* FROM collect c JOIN shop s on c.shopid = s.id WHERE c.userid = ?";
		String[] params = { userid };
		return db.getList(sql, params);
	}
}
