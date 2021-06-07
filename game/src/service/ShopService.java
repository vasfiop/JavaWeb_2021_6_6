package service;

import java.util.List;
import java.util.Map;

import util.DBUtil;

public class ShopService {
	private DBUtil db = new DBUtil();

	public List<Map<String, String>> getShopname() {
		String sql = "select * from shoptypne";
		return db.getList(sql);
	}

}
