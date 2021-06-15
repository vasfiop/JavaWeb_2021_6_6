package service;

import java.util.List;
import java.util.Map;

import util.DBUtil;

public class UserService {
	private DBUtil db = new DBUtil();

//	ͨ���˺������������û�
	public Map<String, String> getUser(String username, String password) {
		String sql = "select * from user where username =? and password =?";
		String[] params = { username, password };
		return db.getMap(sql, params);
	}

//	ͨ���ֻ��ź�����������
	public Map<String, String> getUserByTel(String tel, String password) {
		String sql = "select * from user where telephone =? and password =?";
		String[] params = { tel, password };
		return db.getMap(sql, params);
	}

//	ͨ���ֻ���������
	public Map<String, String> getUserByTel(String tel) {
		String sql = "select * from user where telephone =?";
		String[] params = { tel };
		return db.getMap(sql, params);
	}

//	�����û�
	public List<Map<String, String>> getUsers() {
		String sql = "select * from user";
		return db.getList(sql);
	}

//	ͨ���û�������
	public List<Map<String, String>> getUserByName(String name) {
		String sql = "select * from user where username like ?";
		String[] params = { "%" + name + "%" };
		return db.getList(sql, params);
	}

//	ɾ�����û�
	public int delUserById(String id) {
		String sql = "delete from user where id=?";
		String params[] = { id };
		return db.update(sql, params);
	}

//	�û�״̬�ĸ���
	public int Update(String id, String mode) {
		String sql = "update user set frozen=? where id=?";
		String[] params = { mode, id };
		return db.update(sql, params);
	}

//	����û�
	public int add(String username, String password, String tel) {
		String sql = "insert into user values(null,?,?,0,?,0)";
		String params[] = { username, password, tel };

		return db.update(sql, params);
	}

}
