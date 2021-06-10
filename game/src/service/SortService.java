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

}
