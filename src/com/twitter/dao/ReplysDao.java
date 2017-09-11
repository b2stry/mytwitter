package com.twitter.dao;

import java.sql.Timestamp;
import java.util.List;

import com.twitter.pojo.Replyall;
import com.twitter.util.DBUtil;

public class ReplysDao {
	public int addReplys(int tid, String neirong, int uid, Timestamp rtime) {
		String sql = "insert into replys(uid,tid,rcontent,rtime) values(?,?,?,?)";
		int n = DBUtil.update(sql, uid, tid, neirong, rtime);
		return n;
	}

	public List<Replyall> getAllReply(int tid, int page) {
		String sql = "select rid,uid,tid,rcontent,rtime,uname,urealname,ulogo,uaite from replyall where tid=? order by rtime desc limit ?,6";
		List<Replyall> list = DBUtil.query(Replyall.class, sql, tid, page);
		if (list.size() > 0) {
			return list;
		}
		return null;
	}
}
