package service;

import java.util.List;
import java.util.Map;

import util.DBUtil;

public class TypeService {
	private DBUtil db = new DBUtil();

//	ɾ��������Ϣ
	public int delType(String id) {
		String sql = "delete from foodtype where id=?";
		String[] parames = { id };
		return db.update(sql, parames);
	}

//	��ȡ�����б�
	public List<Map<String, String>> getTypes(String s_tn) {
		String sql = null;
		String[] params = null;
		if (s_tn == null || s_tn.equals("")) {
//			����������
			sql = "select * from foodtype order by id";
		} else {
//			������ѯ
			sql = "select * from foodtype where typename like ? order by id";
			params = new String[] { "%" + s_tn + "%" };
		}

		return db.getList(sql, params);
	}

//	����id��ѯ������Ϣ
	public Map<String, String> getTypeById(String id) {
		String sql = "select * from foodtype where id=?";
		String[] params = { id };

		return db.getMap(sql, params);
	}

//	���ӷ�����Ϣ
	public int addType(String tn) {
		String sql = "insert into foodtype values(null,?)";
		String[] params = { tn };

		return db.update(sql, params);
	}

//	�޸ķ�����Ϣ
	public int updateType(String id, String tn) {
		String sql = "update foodtype set typename=? where id=?";
		String[] params = { tn, id };

		return db.update(sql, params);
	}
}