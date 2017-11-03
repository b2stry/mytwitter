package com.twitter.util;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

public class DBUtil {
	static Vector<Connection> conPool = new Vector<Connection>();

	static {
		for (int i = 0; i < 20; i++) {
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mytwitter", "root", "root");
				conPool.add(con);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public static Connection getConnection() {
		Connection con = conPool.get(0);
		conPool.remove(0);
		return con;
	}

	public static void releaseConnection(Connection con) {
		conPool.add(con);
	}

	public static List query(Class<?> c, String sql, Object... obj) {
		Connection con = getConnection();
		List<Object> list = new ArrayList<Object>();

		try {
			PreparedStatement pre = con.prepareStatement(sql);
			for (int i = 0; i < obj.length; i++) {
				pre.setObject(i + 1, obj[i]);
			}
			ResultSet rs = pre.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData();
			int count = rsmd.getColumnCount();

			while (rs.next()) {
				Object object = c.newInstance();
				for (int i = 1; i <= count; i++) {
					String filedName = rsmd.getColumnLabel(i);
					Field field = c.getDeclaredField(filedName);
					field.setAccessible(true);
					field.set(object, rs.getObject(i));
				}
				list.add(object);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			releaseConnection(con);
		}
		return list;
	}

	public static List query(Class<?> c, String sql, int uid, List olist) {
		Connection con = getConnection();
		List<Object> list = new ArrayList<Object>();

		try {
			PreparedStatement pre = con.prepareStatement(sql);
			pre.setObject(1, uid);
			for (int i = 1; i <= olist.size(); i++) {
				pre.setObject(i + 1, olist.get(i - 1));
			}
			ResultSet rs = pre.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData();
			int count = rsmd.getColumnCount();

			while (rs.next()) {
				Object object = c.newInstance();
				for (int i = 1; i <= count; i++) {
					String filedName = rsmd.getColumnLabel(i);
					Field field = c.getDeclaredField(filedName);
					field.setAccessible(true);
					field.set(object, rs.getObject(i));
				}
				list.add(object);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			releaseConnection(con);
		}
		return list;
	}

	public static List query(Class<?> c, String sql, int uid, List olist, int tid) {
		Connection con = getConnection();
		List<Object> list = new ArrayList<Object>();
		try {
			int i = 1;
			PreparedStatement pre = con.prepareStatement(sql);
			pre.setObject(1, uid);
			if (olist != null) {
				for (i = 1; i <= olist.size(); i++) {
					pre.setObject(i + 1, olist.get(i - 1));
				}
			}
			pre.setObject(i + 1, tid);
			ResultSet rs = pre.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData();
			int count = rsmd.getColumnCount();

			while (rs.next()) {
				Object object = c.newInstance();
				for (int j = 1; j <= count; j++) {
					String filedName = rsmd.getColumnLabel(j);
					Field field = c.getDeclaredField(filedName);
					field.setAccessible(true);
					field.set(object, rs.getObject(j));
				}
				list.add(object);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			releaseConnection(con);
		}
		return list;
	}

	public static List query(Class<?> c, String sql, String word, List olist, int tid) {
		Connection con = getConnection();
		List<Object> list = new ArrayList<Object>();
		try {
			int i = 1;
			PreparedStatement pre = con.prepareStatement(sql);
			pre.setObject(1, word);
			pre.setObject(2, word);
			if (olist != null) {
				for (i = 1; i <= olist.size(); i++) {
					pre.setObject(i + 2, olist.get(i - 1));
				}
			}
			pre.setObject(i + 2, tid);
			ResultSet rs = pre.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData();
			int count = rsmd.getColumnCount();

			while (rs.next()) {
				Object object = c.newInstance();
				for (int j = 1; j <= count; j++) {
					String filedName = rsmd.getColumnLabel(j);
					Field field = c.getDeclaredField(filedName);
					field.setAccessible(true);
					field.set(object, rs.getObject(j));
				}
				list.add(object);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			releaseConnection(con);
		}
		return list;
	}

	public static int query(String cn) {
		Connection con = getConnection();
		int n = 0;
		String sql = "select count(*) from utweets where tcontent != ''  and (urealname like ? or uaite like ? or tcontent like ?)";
		try {
			PreparedStatement pre = con.prepareStatement(sql);
			if (cn != null) {
				pre.setObject(1, "%" + cn + "%");
				pre.setObject(2, "%" + cn + "%");
				pre.setObject(3, "%" + cn + "%");
			} else {
				pre.setObject(1, "%");
				pre.setObject(2, "%");
				pre.setObject(3, "%");
			}
			ResultSet rs = pre.executeQuery();
			if (rs.next()) {
				n = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			releaseConnection(con);
		}
		return n;
	}

	public static int queryUserNum() {
		Connection con = getConnection();
		int n = 0;
		String sql = "select count(*) from users where ustate != 0 ";
		try {
			PreparedStatement pre = con.prepareStatement(sql);
			ResultSet rs = pre.executeQuery();
			if (rs.next()) {
				n = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			releaseConnection(con);
		}
		return n;
	}

	public static int update(String sql, Object... obj) {

		int n = 0;
		Connection con = getConnection();
		try {
			PreparedStatement pre = con.prepareStatement(sql);
			for (int i = 0; i < obj.length; i++) {
				pre.setObject(i + 1, obj[i]);
			}
			n = pre.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			releaseConnection(con);
		}
		return n;
	}

	public static int uniqueQuery(String sql, Object... p) {
		Connection connection = getConnection();
		int n = 0;
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			for (int i = 0; i < p.length; i++) {
				ps.setObject(i + 1, p[i]);
			}
			ResultSet rs = ps.executeQuery();
			rs.next();
			n = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			releaseConnection(connection);
		}
		return n;

	}
}
