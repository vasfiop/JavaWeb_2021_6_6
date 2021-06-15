package service;

import util.DBUtil;
import java.util.*;

public class CarService {
	private DBUtil db = new DBUtil();

//	通过userid来搜索购买记录
	public List<Map<String, String>> getCarByUserId(String userid) {
		String sql = "SELECT * FROM car WHERE userid = ?";
		String params[] = { userid };
		
		return db.getList(sql, params);
	}
}
