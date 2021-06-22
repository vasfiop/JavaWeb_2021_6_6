package service;

import java.util.List;
import java.util.Map;

import util.DBUtil;

public class TypeService {
	private DBUtil db = new DBUtil();

//	通过id找到type
	public Map<String, String> getTypeById(String id) {
		String sql = "SELECT * FROM shoptype where id =?";
		String params[] = { id };
		return db.getMap(sql, params);
	}

//	通过sort id找到type
	public List<Map<String, String>> getTypeNameBySortId(String id) {
		String sql = "SELECT * FROM shoptype where typeid = ?;";
		String params[] = { id };

		return db.getList(sql, params);
	}

//	找到所有type
	public List<Map<String, String>> getType() {
		String sql = "SELECT * FROM shoptype";

		return db.getList(sql);
	}

//	找到所有type链表坂本
	public List<Map<String, String>> getType(String mode) {
		String sql = "SELECT st.*,ss.sortname FROM shoptype st JOIN shopsort ss on st.typeid = ss.id ORDER BY st.typeid";

		return db.getList(sql);
	}

//	根据名字找到type 链表坂本
	public List<Map<String, String>> getTypeByName(String mode, String name) {
		String sql = "SELECT st.*,ss.sortname FROM shoptype st JOIN shopsort ss on st.typeid = ss.id WHERE st.typename LIKE ?";
		String params[] = { "%" + name + "%" };
		return db.getList(sql, params);
	}

//	添加一个成员
	public int add(String name, String typeid) {
		String sql = "insert into shoptype values(null,?,?)";
		String params[] = { typeid, name };

		return db.update(sql, params);
	}

//	删除
	public int delTypeById(String id) {
		String sql = "delete from shoptype where id=?";
		String params[] = { id };
		return db.update(sql, params);
	}

//	更新
	public int Update(String name, String typeid, String id) {
		String sql = "update shoptype set typename=?,typeid=? where id=?";
		String params[] = { name, typeid, id };

		return db.update(sql, params);
	}

//	通过指定数量来查找个数
	public List<Map<String, String>> getTypeByCount(String count) {
		String sql = "SELECT * FROM shoptype LIMIT " + count;
		return db.getList(sql);
	}
}
