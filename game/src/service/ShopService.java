package service;

import java.util.List;
import java.util.Map;

import util.DBUtil;

public class ShopService {
	private DBUtil db = new DBUtil();

//	ͨ��typeid�ҵ�5����Ʒ
	public List<Map<String, String>> getShopByTypeId(String id) {
		String sql = "SELECT * FROM shop WHERE type = ? LIMIT 5";
		String params[] = { id };

		return db.getList(sql, params);
	}

//	ͨ��Sortid�ҵ�ÿ����Ӧ��5����Ʒ
	public List<Map<String, String>> getShopBySortId(String id) {
		String sql = "select s.* from shop s join shoptype st on s.type=st.id where st.typeid=?";
		String params[] = { id };
		
		return db.getList(sql, params);
	}

}
