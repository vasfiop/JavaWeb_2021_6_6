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

//	通过名字查找sort
	public List<Map<String, String>> getsortByName(String name) {
		String sql = "SELECT * FROM shopsort WHERE sortname LIKE ?";
		String params[] = { "%" + name + "%" };

		return db.getList(sql, params);
	}

//	添加
	public int add(String name) {
		String sql = "insert into shopsort values(null,?)";
		String params[] = { name };

		return db.update(sql, params);
	}
	
//	删除
	public int delSortById(String id) {
		String sql = "delete from shopsort where id=?";
		String params[] = { id };
		return db.update(sql, params);
	}
}
