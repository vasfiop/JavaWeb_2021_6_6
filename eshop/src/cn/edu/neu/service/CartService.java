package cn.edu.neu.service;

import java.util.List;
import java.util.Map;

import cn.edu.neu.dao.DBUtil;

public class CartService {
	private static DBUtil db = new DBUtil();

//	通过地址id找到地址
	public static Map<String, Object> get_address_by_id(String address_id) {
		String sql = "SELECT * FROM t_address WHERE addr_id = ?";
		String[] params = { address_id };
		return db.getMap(sql, params);
	}

//	添加订单
	public int add_order(String order_code, String user_id, String status, String address_str) {
		String sql = "INSERT INTO t_order VALUES(NULL,?,?,2,?,?,SYSDATE(),null,NULL)";
		String[] params = { order_code, user_id, address_str, status };
		db.update(sql, params);

		return get_max_order_id(user_id);
	}

	public int get_max_order_id(String user_id) {
		String sql = "SELECT max(order_id) max FROM t_order WHERE user_id = ?";
		String[] params = { user_id };

		return (int) db.getMap(sql, params).get("max");
	}

//	添加订单详细页面
	@SuppressWarnings("unchecked")
	public int add_order_detail(int order_id, Map<String, Object> carts) {
		for (Map.Entry<String, Object> entry : carts.entrySet()) {
			String goods_id = entry.getKey();
			Map<String, Object> goods = (Map<String, Object>) entry.getValue();
			String goods_name = (String) goods.get("goods_name");
			String goods_price = (String) goods.get("goods_price");
			String goods_count = (String) goods.get("goods_count");
			String goods_pic = (String) goods.get("goods_pic");
			String sql = "INSERT INTO t_orderdetail VALUES(NULL,?,?,?,?,?,?)";
			String[] params = { String.valueOf(order_id), goods_id, goods_name, goods_price, goods_count, goods_pic };
			if (db.update(sql, params) == 0)
				return 0;
		}
		return 1;
	}

	public List<Map<String, Object>> get_orders(String user_id) {
		String sql = "SELECT * FROM t_order WHERE user_id = ?";
		String sql_order_goods = "SELECT * FROM t_orderdetail WHERE order_id = ?";
		String[] params = { user_id };
		List<Map<String, Object>> orders = db.getList(sql, params);
		for (Map<String, Object> map : orders) {
			int order_id = (int) map.get("order_id");
			map.put("goods", db.getList(sql_order_goods, new Object[] { order_id }));
		}
		return orders;
	}

//	修改订单（去付款，取消订单）
	public int change_order_mode(String order_id, String mode) {
		String sql = "update t_order set order_status=" + mode + " where order_id =?";
		String[] params = { order_id };
		return db.update(sql, params);
	}

//	删除orderdatail
	public int del_orderdetail(String order_id) {
		String sql = "delete from t_orderdetail where order_id = ?";
		String[] params = { order_id };

		return db.update(sql, params);
	}

//	删除订单
	public int del_order(String order_id) {
		String sql = "delete from t_order where order_id = ?";
		String[] params = { order_id };
		return db.update(sql, params);
	}

}