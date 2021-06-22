package service;

import java.util.List;
import java.util.Map;

import util.DBUtil;

public class ShopService {
	private DBUtil db = new DBUtil();

//	��Ʒ�ĸ���
	public int Update(String id, String name, String title, String type, String price, String pic, String comm) {
		String sql = "update shop set shopname=?,title=?,type=?,price=?,picture=?,comment=? where id=?";
		String[] params = { name, title, type, price, pic, comm, id };
		return db.update(sql, params);
	}

//	ͨ��id�ҵ���Ʒ
	public Map<String, String> getShopByid(String id) {
		String sql = "SELECT * FROM shop WHERE id = ?";
		String params[] = { id };
		return db.getMap(sql, params);
	}

//	ɾ��ͨ��id��Ʒ
	public int delShopById(String id) {
		String sql = "delete from shop where id=?";
		String params[] = { id };
		return db.update(sql, params);
	}

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

//	ͨ��������ɱ�ҵ���Ʒ
	public List<Map<String, String>> getShopByKill() {
		String sql = "SELECT * FROM shop WHERE comment != 0";
		return db.getList(sql);
	}

//	�����Ʒ
	public int addShop(String name, String title, String type, String price, String pic, String comm) {
		String sql = "insert into shop values(null,?,?,?,?,?,?)";
		String params[] = { name, title, type, price, pic, comm };

		return db.update(sql, params);
	}

}
