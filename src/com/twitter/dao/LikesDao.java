package com.twitter.dao;

import java.sql.Timestamp;
import java.util.List;

import com.twitter.pojo.Likes;
import com.twitter.util.DBUtil;

public class LikesDao {
	public boolean selLike(int uid, int tid) {
		String sql = "select lid,tid,uid,ltime  from likes where uid=? and tid=? limit 1";
		List<Likes> list = DBUtil.query(Likes.class, sql, uid, tid);

		if (list.size() > 0) {
			return true;
		}

		return false;
	}

	public int addLikes(int uid, int tid, Timestamp ttime) {
		String sql = "insert into likes(uid, tid, ltime) values(?,?,?)";
		int n = DBUtil.update(sql, uid, tid, ttime);
		return n;
	}

	public int delLikes(int uid, int tid) {
		String sql = "delete from likes where uid=? and tid=?";
		int n = DBUtil.update(sql, uid, tid);
		return n;
	}
}
