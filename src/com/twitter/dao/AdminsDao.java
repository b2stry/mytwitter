package com.twitter.dao;

import java.util.List;

import com.twitter.pojo.Admins;
import com.twitter.util.DBUtil;

public class AdminsDao {
	public Admins checkLogin(String username, String password) {
		String sql = "select aid,aname,apwd,atime,astate,apower from admins where aname=? and apwd=?";
		List<Admins> list = DBUtil.query(Admins.class, sql, username, password);
		if (list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	public int updateOnline(int astate, int aid) {
		String sql = "update admins set astate=? where aid=?";
		int n = DBUtil.update(sql, astate, aid);
		return n;
	}

}
