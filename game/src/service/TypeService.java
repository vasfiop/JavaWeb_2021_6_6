package service;

import java.util.List;
import java.util.Map;

import util.DBUtil;

public class TypeService {
	private DBUtil db = new DBUtil();

//	ͨ��id�ҵ�type
	public Map<String, String> getTypeById(String id) {
		String sql = "SELECT * FROM shoptype where id =?";
		String params[] = { id };
		return db.getMap(sql, params);
	}

//	ͨ��sort id�ҵ�type
	public List<Map<String, String>> getTypeNameBySortId(String id) {
		String sql = "SELECT * FROM shoptype where typeid = ?;";
		String params[] = { id };

		return db.getList(sql, params);
	}

//	�ҵ�����type
	public List<Map<String, String>> getType() {
		String sql = "SELECT * FROM shoptype";

		return db.getList(sql);
	}

//	�ҵ�����type�����౾
	public List<Map<String, String>> getType(String mode) {
		String sql = "SELECT st.*,ss.sortname FROM shoptype st JOIN shopsort ss on st.typeid = ss.id ORDER BY st.typeid";

		return db.getList(sql);
	}

//	���������ҵ�type �����౾
	public List<Map<String, String>> getTypeByName(String mode, String name) {
		String sql = "SELECT st.*,ss.sortname FROM shoptype st JOIN shopsort ss on st.typeid = ss.id WHERE st.typename LIKE ?";
		String params[] = { "%" + name + "%" };
		return db.getList(sql, params);
	}

//	���һ����Ա
	public int add(String name, String typeid) {
		String sql = "insert into shoptype values(null,?,?)";
		String params[] = { typeid, name };

		return db.update(sql, params);
	}

//	ɾ��
	public int delTypeById(String id) {
		String sql = "delete from shoptype where id=?";
		String params[] = { id };
		return db.update(sql, params);
	}

//	����
	public int Update(String name, String typeid, String id) {
		String sql = "update shoptype set typename=?,typeid=? where id=?";
		String params[] = { name, typeid, id };

		return db.update(sql, params);
	}

//	ͨ��ָ�����������Ҹ���
	public List<Map<String, String>> getTypeByCount(String count) {
		String sql = "SELECT * FROM shoptype LIMIT " + count;
		return db.getList(sql);
	}
}
