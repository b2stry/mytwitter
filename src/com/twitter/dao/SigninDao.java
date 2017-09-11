package com.twitter.dao;

import java.sql.Timestamp;
import java.util.List;

import com.twitter.pojo.Signin;
import com.twitter.util.DBUtil;

public class SigninDao {
	public Signin getLastSignin(int uid) {
		String sql = "select * from signin where uid = ? order by stime desc limit 1";
		List<Signin> list = DBUtil.query(Signin.class, sql, uid);
		if (list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	public int addUp(int uid, Timestamp stime) {
		String sql = "insert into signin(uid, stime,sdtime) values(?,?,?)";
		int n = DBUtil.update(sql, uid, stime, stime);
		return n;
	}

	public Signin selSignal(int uid, Timestamp stime) {
		String sql = "select sid,uid,stime,sdtime from signin where uid=? and stime=?";
		List<Signin> list = DBUtil.query(Signin.class, sql, uid, stime);
		if (list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	public int updateSignin(int sid, Timestamp sdtime) {
		String sql = "update signin set sdtime=? where sid=? ";
		int n = DBUtil.update(sql, sdtime, sid);
		return n;
	}
}
