package service;

import java.util.List;
import java.util.Map;

import util.DBUtil;

public class TypeService {
	private DBUtil db = new DBUtil();

//	删除分类信息
	public int delType(String id) {
		String sql = "delete from foodtype where id=?";
		String[] parames = { id };
		return db.update(sql, parames);
	}

//	读取分类列表
	public List<Map<String, String>> getTypes(String s_tn) {
		String sql = null;
		String[] params = null;
		if (s_tn == null || s_tn.equals("")) {
//			无条件搜索
			sql = "select * from foodtype order by id";
		} else {
//			条件查询
			sql = "select * from foodtype where typename like ? order by id";
			params = new String[] { "%" + s_tn + "%" };
		}

		return db.getList(sql, params);
	}

//	根据id查询分类信息
	public Map<String, String> getTypeById(String id) {
		String sql = "select * from foodtype where id=?";
		String[] params = { id };

		return db.getMap(sql, params);
	}

//	添加分类信息
	public int addType(String tn) {
		String sql = "insert into foodtype values(null,?)";
		String[] params = { tn };

		return db.update(sql, params);
	}

//	修改分类信息
	public int updateType(String id, String tn) {
		String sql = "update foodtype set typename=? where id=?";
		String[] params = { tn, id };

		return db.update(sql, params);
	}
}
