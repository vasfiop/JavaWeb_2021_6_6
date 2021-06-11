package service;

import java.util.List;
import java.util.Map;

import util.DBUtil;

public class FoodService {
	private DBUtil db = new DBUtil();

//	�������Ʋ���or������Ҳ�Ʒ��Ϣ
	public List<Map<String, String>> getFood(String cond, String value) {
		String sql = "select f.*,ft.typename from food f join foodtype ft on f.type=ft.id where f.id = ? where f."
				+ cond + " list ?";
		String[] params = { "%" + value + "%" };

		return db.getList(sql, params);
	}

//	�������Ʋ����ͷ�����Ҳ�Ʒ��Ϣ
	public List<Map<String, String>> getFood(String cond, String s_fn, String s_type) {
		String sql = "select f.*,ft.typename from food f join foodtype ft on f.type=ft.id where f.foodname like ? and f.type like ?";
		String[] params = { "%" + s_fn + "%", "%" + s_type + "%" };

		return db.getList(sql, params);
	}

//	����id��ȡ��Ʒ��Ϣ
	public Map<String, String> getFoodById(String id) {
		String sql = "select f.*,ft.typename from food f join foodtype ft on f.type=ft.id where f.id = ? ";
		String[] params = { id };

		return db.getMap(sql, params);
	}

	public int addFodd(String fn, String feo, String mat, String price, String type, String pic, String comm) {
		String sql = "insert into food values(null,?,?,?,?,?,?,'0',?)";
		String[] params = { fn, feo, mat, price, type, pic, comm };

		return db.update(sql, params);
	}

//	��ȡ�ȵ��Ʒ
	public List<Map<String, String>> getHot() {
		String sql = "select * from food order by hits desc limit 0,3";
		return db.getList(sql);
	}

//	��ȡ�����ؼ�
	public List<Map<String, String>> getCheap() {
		String sql = "select * from food where comment>0 order by hits desc limit 0,3";
		return db.getList(sql);
	}

//	��ȡ��ʦ�Ƽ�
	public List<Map<String, String>> getCook() {
		String sql = "select * from food where comment=0 order by hits desc limit 0,3";
		return db.getList(sql);
	}

//	��ȡ����food
	public List<Map<String, String>> getFood() {
		String sql = "select f.*,ft.typename from food f join foodtype ft on f.type=ft.id";

		return db.getList(sql);
	}
}
