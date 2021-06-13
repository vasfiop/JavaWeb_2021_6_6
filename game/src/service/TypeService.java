package service;

import java.util.List;
import java.util.Map;

import util.DBUtil;

public class TypeService {
	private DBUtil db = new DBUtil();

//	通过分类id找到type
	public List<Map<String, String>> getTypeNameeById(String id) {
		String sql = "SELECT * FROM shoptype where typeid = ?;";
		String params[] = { id };

		return db.getList(sql, params);
	}

	public List<Map<String, String>> getType() {
		String sql = "SELECT * FROM shoptype";
		
		return db.getList(sql);
	}

}
