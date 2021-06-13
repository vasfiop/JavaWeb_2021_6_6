package service;

import java.util.List;
import java.util.Map;

import util.DBUtil;

public class ShopService {
	private DBUtil db = new DBUtil();

//	��������or sort����
	public List<Map<String, String>> getShops(String mode, String value) {
		String sql = "select s.*,st.typename,ss.sortname FROM (shop s JOIN shoptype st on s.type = st.id) LEFT JOIN shopsort ss on ss.id = st.typeid WHERE s."
				+ mode + " LIKE ?";
		String params[] = { "%" + value + "%" };
		return db.getList(sql, params);
	}

//	ͨ��typeid����������
	public List<Map<String, String>> getShopBySort_and_name(String s_name, String s_sort) {
		String sql = "select s.*,st.typename,ss.sortname FROM (shop s JOIN shoptype st on s.type = st.id) LEFT JOIN shopsort ss on ss.id = st.typeid WHERE s.shopname LIKE ? AND st.typeid = ?";
		String params[] = { "%" + s_name + "%", s_sort };

		return db.getList(sql, params);
	}

//	ͨ��typeid�ҵ�5����Ʒ
	public List<Map<String, String>> getShopByTypeId(String id) {
		String sql = "SELECT * FROM shop WHERE type = ? LIMIT 5";
		String params[] = { id };

		return db.getList(sql, params);
	}

//	�ҵ�������Ʒ
	public List<Map<String, String>> getShops() {
		String sql = "select s.*,st.typename,ss.sortname FROM (shop s JOIN shoptype st on s.type = st.id) LEFT JOIN shopsort ss on ss.id = st.typeid";

		return db.getList(sql);
	}

//	�����Ʒ
	public int addShop(String name, String title, String type, String price, String pic, String comm) {
		String sql = "insert into shop values(null,?,?,?,?,?,?)";
		String params[] = { name, title, type, price, pic, comm };

		return db.update(sql, params);
	}

}
