package service;

import java.util.List;
import java.util.Map;

import util.DBUtil;

public class FoodService {
	private DBUtil db = new DBUtil();

//	按照名称菜名or分类查找菜品信息
	public List<Map<String, String>> getFood(String cond, String value) {
		String sql = "select f.*,ft.typename from food f join foodtype ft on f.type=ft.id where f.id = ? where f."
				+ cond + " list ?";
		String[] params = { "%" + value + "%" };

		return db.getList(sql, params);
	}

//	按照名称菜名和分类查找菜品信息
	public List<Map<String, String>> getFood(String cond, String s_fn, String s_type) {
		String sql = "select f.*,ft.typename from food f join foodtype ft on f.type=ft.id where f.foodname like ? and f.type like ?";
		String[] params = { "%" + s_fn + "%", "%" + s_type + "%" };

		return db.getList(sql, params);
	}

//	根据id读取菜品信息
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

//	读取热点菜品
	public List<Map<String, String>> getHot() {
		String sql = "select * from food order by hits desc limit 0,3";
		return db.getList(sql);
	}

//	读取今日特价
	public List<Map<String, String>> getCheap() {
		String sql = "select * from food where comment>0 order by hits desc limit 0,3";
		return db.getList(sql);
	}

//	读取厨师推荐
	public List<Map<String, String>> getCook() {
		String sql = "select * from food where comment=0 order by hits desc limit 0,3";
		return db.getList(sql);
	}

//	读取所有food
	public List<Map<String, String>> getFood() {
		String sql = "select f.*,ft.typename from food f join foodtype ft on f.type=ft.id";

		return db.getList(sql);
	}
}
