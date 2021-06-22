package service;

import util.DBUtil;
import java.util.*;

public class CarService {
	private DBUtil db = new DBUtil();

//	通过userid来搜索购买记录
	public List<Map<String, String>> getCarByUserId(String userid) {
		String sql = "SELECT s.shopname,s.title,s.price,s.picture,s.comment,c.* FROM car c JOIN shop s on c.shopid = s.id WHERE c.userid = ?";
		String params[] = { userid };

		return db.getList(sql, params);
	}

//	删除该id下的car
	public int del(String id) {
		String sql = "delete from car where userid = ?";
		String params[] = { id };
		return db.update(sql, params);
	}

//	删除用户的购物车
	public int delByUserId(String userid) {
		String sql = "DELETE FROM car WHERE userid = ?";
		String params[] = { userid };
		return db.update(sql, params);
	}

//	通过用户的id和商品的id来查找单一商品
	public Map<String, String> getCar(String userid, String shopid) {
		String sql = "SELECT * FROM car WHERE userid=? AND shopid = ?";
		String params[] = { userid, shopid };
		return db.getMap(sql, params);
	}

//	添加购物车
	public int add(String shopid, String userid) {
		String sql = "insert into car values(null,?,?,1)";
		String params[] = { userid, shopid };
		return db.update(sql, params);
	}

//	删除购物车
	public int del(String userid, String shopid) {
		String sql = "delete from car where userid = ? and shopid = ?";
		String[] params = { userid, shopid };
		return db.update(sql, params);
	}

	public int update(String mode, String id, String value) {
		String sql = "update car set " + mode + " = ? where id=?";
		String[] params = { value, id };
		return db.update(sql, params);
	}
}
