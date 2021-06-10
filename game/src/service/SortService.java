package service;

import java.util.List;
import java.util.Map;

import util.DBUtil;

public class SortService {
	private DBUtil db = new DBUtil();

//	找到所有分类
	public List<Map<String, String>> getSortName() {
		String sql = "select * from shopsort";

		return db.getList(sql);
	}

//	通过id查找分类名称
	public Map<String, String> getSortNameById(String id) {
		String sql = "select * from shopsort where id = ?";
		String params[] = { id };

		return db.getMap(sql, params);
	}

}
