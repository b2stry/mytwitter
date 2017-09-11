package com.twitter.dao;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.twitter.pojo.Tweets;
import com.twitter.pojo.Utweets;
import com.twitter.util.DBUtil;

public class TweetsDao {
	public int getTwettNum(String cn) {
		return DBUtil.query(cn);
	}

	public List<Utweets> getNewTweets(int uid, List uidList, String nowid) {
		List<Utweets> list = new ArrayList<Utweets>();
		if (nowid != null && "".equals(nowid) == false) {
			int tid = Integer.parseInt(nowid);
			String sql = "select tid,uid,uname,upwd,urealname,uaite,uonline,uabout,ulogo,ubg,ufans,utweet,ufollow,ucolor,tcontent, ttime, tpic, tvideo, treply, tforward, tlike,tzhuan   from utweets";

			if (uidList != null) {
				sql += " where  (tzhuan=1 or tcontent!='' ) and (uid=?";
				for (int i = 0; i < uidList.size(); i++) {
					sql = sql + " or uid=?";
				}
				sql += ")";
			} else {
				sql += " where  (tzhuan=1 or tcontent!='' ) and uid=?";
			}

			sql = sql + " and tid>? order by ttime desc";
			if (uidList != null)
				list = DBUtil.query(Utweets.class, sql, uid, uidList, tid);
			else
				list = DBUtil.query(Utweets.class, sql, uid, tid);
			if (list == null) {
				return null;
			}
			return list;
		} else {
			return null;
		}
	}

	public int delTweet(String tid) {
		String sql = "update tweets set tcontent='', tpic=null where tid=?";
		int n = DBUtil.update(sql, tid);
		return n;
	}

	public List<Utweets> getTweets(int uid, int page) {
		String sql = "select tid,uid,uname,upwd,urealname,uaite,uonline,uabout,ulogo,ubg,ufans,utweet,ufollow,ucolor,tcontent, ttime, tpic, tvideo, treply, tforward, tlike,tzhuan   from utweets where  (tzhuan=1 or tcontent!='' ) and uid=? order by ttime desc  limit ?, 20";
		List<Utweets> list = DBUtil.query(Utweets.class, sql, uid, page);
		if (list == null) {
			return null;
		}
		return list;
	}

	public List<Utweets> getTweets(int uid) {
		String sql = "select tid,uid,uname,upwd,urealname,uaite,uonline,uabout,ulogo,ubg,ufans,utweet,ufollow,ucolor,tcontent, ttime, tpic, tvideo, treply, tforward, tlike,tzhuan   from utweets where  (tzhuan=1 or tcontent!='') and uid=? order by ttime desc";
		List<Utweets> list = DBUtil.query(Utweets.class, sql, uid);

		if (list == null) {
			return null;
		}
		return list;
	}

	public List<Utweets> getAllTweets(int uid, List uidList, int page) {
		String sql = "select tid,uid,uname,upwd,urealname,uaite,uonline,uabout,ulogo,ubg,ufans,utweet,ufollow,ucolor,tcontent, ttime, tpic, tvideo, treply, tforward, tlike,tzhuan   from utweets where  (tzhuan=1 or tcontent!='' ) and (uid=?";
		for (int i = 0; i < uidList.size(); i++) {
			sql = sql + " or uid=?";
		}
		sql = sql + ") order by ttime desc limit ?, 20";
		List<Utweets> list = DBUtil.query(Utweets.class, sql, uid, uidList, page);
		if (list == null) {
			return null;
		}
		return list;
	}

	public List<Utweets> getAllTweets(int page, int size, String cn) {
		String sql = "select tid,uid,uname,upwd,urealname,uaite,uonline,uabout,ulogo,ubg,ufans,utweet,ufollow,ucolor,tcontent, ttime, tpic, tvideo, treply, tforward, tlike,tzhuan   from utweets where   tcontent!=''  and (urealname like ? or uaite like ? or tcontent like ?) order by ttime desc limit ?, ?";
		List<Utweets> list = new ArrayList<Utweets>();
		if (cn != null) {
			list = DBUtil.query(Utweets.class, sql, "%" + cn + "%", "%" + cn + "%", "%" + cn + "%", (page - 1) * size,
					size);
		} else {
			list = DBUtil.query(Utweets.class, sql, "%", "%", "%", (page - 1) * size, size);
		}
		if (list == null) {
			return null;
		}
		return list;
	}

	public List<Utweets> getTweet(int uid) {
		String sql = "select tid,uid,uname,upwd,urealname,uaite,uonline,uabout,ulogo,ubg,ufans,utweet,ufollow,ucolor,tcontent, ttime, tpic, tvideo, treply, tforward, tlike,tzhuan   from utweets where uid=? order by ttime desc limit 1";
		List<Utweets> list = DBUtil.query(Utweets.class, sql, uid);

		if (list == null) {
			return null;
		}
		return list;
	}

	public int addTweet(int uid, String tcontent, Timestamp ttime, int tzhuan) {
		String sql = "insert into tweets(uid, tcontent, ttime,tzhuan) values(?,?,?,?)";
		int n = DBUtil.update(sql, uid, tcontent, ttime, tzhuan);
		return n;
	}

	public int addPicTweet(int uid, String tcontent, Timestamp ttime, String tpic) {
		String sql = "insert into tweets(uid, tcontent, ttime,tpic,tzhuan) values(?,?,?,?,0)";
		int n = DBUtil.update(sql, uid, tcontent, ttime, tpic);
		return n;
	}

	public Utweets getTweetsByTid(int tid) {
		String sql = "select tid,uid,uname,upwd,urealname,uaite,uonline,uabout,ulogo,ubg,ufans,utweet,ufollow,ucolor,tcontent, ttime, tpic, tvideo, treply, tforward, tlike,tzhuan   from utweets where tid=?";
		List<Utweets> list = DBUtil.query(Utweets.class, sql, tid);

		if (list == null) {
			return null;
		}
		return list.get(0);
	}

	public int getTid(int uid, String tcontent, Timestamp time) {
		String sql = "select tid  from utweets where uid=? and tcontent=? and ttime=?";
		List<Utweets> list = DBUtil.query(Utweets.class, sql, uid, tcontent, time);

		if (list == null) {
			return 0;
		}
		return list.get(0).getTid();
	}

	public int addLikesNum(int tid, int state) {
		String sql = null;
		if (state == 1)
			sql = "update tweets set tlike = (tlike + 1) where tid = ?";
		else
			sql = "update tweets set tlike = (tlike - 1) where tid = ?";

		int n = DBUtil.update(sql, tid);
		return n;
	}

	public int addReplyNum(int tid, int state) {
		String sql = null;
		if (state == 1)
			sql = "update tweets set treply = (treply + 1) where tid = ?";
		else
			sql = "update tweets set treply = (treply - 1) where tid = ?";

		int n = DBUtil.update(sql, tid);
		return n;
	}

	public int addForwardNum(int tid, int state) {
		String sql = null;
		if (state == 1)
			sql = "update tweets set tforward = (tforward + 1) where tid = ?";
		else
			sql = "update tweets set tforward = (tforward - 1) where tid = ?";

		int n = DBUtil.update(sql, tid);
		return n;
	}
}
