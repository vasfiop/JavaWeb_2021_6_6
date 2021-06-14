package service;

import java.util.List;
import java.util.Map;

import util.DBUtil;

public class SortService {
	private DBUtil db = new DBUtil();

//	�ҵ����з���
	public List<Map<String, String>> getSortName() {
		String sql = "select * from shopsort";

		return db.getList(sql);
	}

//	ͨ��id���ҷ�������
	public Map<String, String> getSortNameById(String id) {
		String sql = "select * from shopsort where id = ?";
		String params[] = { id };

		return db.getMap(sql, params);
	}

//	ͨ�����ֲ���sort
	public List<Map<String, String>> getsortByName(String name) {
		String sql = "SELECT * FROM shopsort WHERE sortname LIKE ?";
		String params[] = { "%" + name + "%" };

		return db.getList(sql, params);
	}

//	���
	public int add(String name) {
		String sql = "insert into shopsort values(null,?)";
		String params[] = { name };

		return db.update(sql, params);
	}
	
//	ɾ��
	public int delSortById(String id) {
		String sql = "delete from shopsort where id=?";
		String params[] = { id };
		return db.update(sql, params);
	}
}
