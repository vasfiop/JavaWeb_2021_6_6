package service;

import java.util.Map;

import util.DBUtil;

public class UserService {
	private DBUtil db = new DBUtil();

//	�����û������ֺ�������в�ѯ
	public Map<String, String> getUserByNameAndPass(String username, String password) {
		String sql = "select * from user where username =? and password =?";
		String[] params = { username, password };

		return db.getMap(sql, params);
	}

//	ע��
	public int register(String un, String pw, String tel, String addr) {
		String sql = "insert into user values(null,?,?,'0',?,?)";
		String[] params = { un, pw, tel, addr };

		return db.update(sql, params);
	}

//	����id��ȡ�û���Ϣ
	public Map<String, String> getUserById(String id) {
		String sql = "select * from user where id =?";

		String[] params = { id };
		return db.getMap(sql, params);
	}

//	�û��޸ĸ�����Ϣ
	public int upDate(String pw, String dh, String addr, String id) {
		String sql = "update user set password=?,telephone=?,address=? where id=?";
		String[] params = { pw, dh, addr, id };
		return db.update(sql, params);
	}
}
