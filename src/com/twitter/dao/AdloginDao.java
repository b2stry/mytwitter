package com.twitter.dao;

import java.sql.Timestamp;
import java.util.List;

import com.twitter.pojo.Adlogin;
import com.twitter.pojo.Signin;
import com.twitter.util.DBUtil;

public class AdloginDao {
	public int addUp(int aid, Timestamp aditime) {
		String sql = "insert into adlogin(aid, aditime,adotime) values(?,?,?)";
		int n = DBUtil.update(sql, aid, aditime, aditime);
		return n;
	}

	public Adlogin selSignal(int aid, Timestamp aditime) {
		String sql = "select adid,aid,aditime,adotime from adlogin where aid=? and aditime=?";
		List<Adlogin> list = DBUtil.query(Adlogin.class, sql, aid, aditime);
		if (list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	public int updateSignin(int adid, Timestamp adotime) {
		String sql = "update adlogin set adotime=? where adid=? ";
		int n = DBUtil.update(sql, adotime, adid);
		return n;
	}
}
