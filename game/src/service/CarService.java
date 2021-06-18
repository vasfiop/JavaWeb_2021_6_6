package service;

import util.DBUtil;
import java.util.*;

public class CarService {
	private DBUtil db = new DBUtil();

//	ͨ��userid�����������¼
	public List<Map<String, String>> getCarByUserId(String userid) {
		String sql = "SELECT s.shopname,s.title,s.price,s.picture,s.comment,c.id,c.count FROM car c JOIN shop s on c.shopid = s.id WHERE c.userid = ?";
		String params[] = { userid };

		return db.getList(sql, params);
	}

//	ɾ����id�µ�car
	public int del(String id) {
		String sql = "delete from car where id = ?";
		String params[] = { id };
		return db.update(sql, params);
	}

	public int delByUserId(String userid) {
		String sql = "DELETE FROM car WHERE userid = ?";
		String params[] = { userid };
		return db.update(sql, params);
	}
}
