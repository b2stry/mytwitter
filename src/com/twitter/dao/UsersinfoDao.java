package com.twitter.dao;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.twitter.pojo.Users;
import com.twitter.pojo.Usersall;
import com.twitter.pojo.Usersinfo;
import com.twitter.util.DBUtil;

public class UsersinfoDao {
	public List<Usersall> fenye(int page, int size, Object... objects) {
		StringBuffer sql = new StringBuffer("select * from usersall ");
		List<Usersall> usersalls = new ArrayList<Usersall>();
		if (objects[0] != null && objects[0].toString().trim() != "") {
			sql.append("where urealname like ? or uaite like ? limit ?,?");
			usersalls = DBUtil.query(Usersall.class, sql.toString(), "%" + objects[0] + "%", "%" + objects[0] + "%",
					(page - 1) * size, size);
		} else {
			sql.append(" limit ?, ?");
			usersalls = DBUtil.query(Usersall.class, sql.toString(), (page - 1) * size, size);
		}
		if (usersalls.size() > 0)
			return usersalls;
		return null;
	}

	public int getCount(Object... objects) {
		StringBuffer sql = new StringBuffer("select count(*) from usersall ");
		if (objects[0] != null && objects[0].toString().trim() != "") {
			sql.append("where urealname like ? or uaite like ?");
			return DBUtil.uniqueQuery(sql.toString(), "%" + objects[0] + "%", "%" + objects[0] + "%");
		}
		return DBUtil.uniqueQuery(sql.toString());
	}

	public int updateData(int uid, String urealname, String uaite, String uabout, Timestamp udate) {
		String sql = "update users a, usersinfo b set a.urealname=?,a.uaite=?,b.uabout=?,b.udate=? where a.uid =? and b.uid=?";
		int n = DBUtil.update(sql, urealname, uaite, uabout, udate, uid, uid);
		return n;
	}

	public int updateBg(int uid, String picName) {
		String sql = "update usersinfo set ubg=? where uid=?";
		int n = DBUtil.update(sql, picName, uid);
		return n;
	}

	public int updateDate(int uid, Timestamp udate) {
		String sql = "update usersinfo set udate=? where uid=?";
		int n = DBUtil.update(sql, udate, uid);
		return n;
	}

	public int updateAbout(int uid, String uabout) {
		String sql = "update usersinfo set uabout=? where uid=?";
		int n = DBUtil.update(sql, uabout, uid);
		return n;
	}

	public int updateUlogo(int uid, String ulogo) {
		String sql = "update usersinfo set ulogo = ? where uid = ?";
		int n = DBUtil.update(sql, ulogo, uid);
		return n;
	}

	public List<Usersall> selTuiJian(int uid, List uidList) {
		List<Usersall> list = new ArrayList<Usersall>();
		String sql = "select uid, uname, urealname, uaite, ustate, utime, uonline, uaddress,  uabout, udate, ubg,ulogo, ufans, utweet,ufollow ,ucolor  from usersall where uid!=?";
		if (uidList != null) {
			for (int i = 0; i < uidList.size(); i++) {
				sql += " and uid != ?";
			}
			sql += " order by rand() LIMIT 3";
			list = DBUtil.query(Usersall.class, sql, uid, uidList);
		} else {
			sql += " order by rand()  LIMIT 3";
			list = DBUtil.query(Usersall.class, sql, uid);
		}

		if (list.size() > 0) {
			return list;
		}
		return null;
	}

	public Usersinfo getInfos(int uid) {
		String sql = "select id, uid, uaddress,  uabout, udate, ubg,ulogo, ufans, utweet,ufollow ,ucolor  from usersinfo where uid=?  limit 1";
		List<Usersinfo> list = DBUtil.query(Usersinfo.class, sql, uid);
		if (list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	public Usersall searchWho(String uid) {
		String sql = "select uid, uname,   urealname, uaite, ustate, utime, uonline, uaddress,  uabout, udate, ubg,ulogo, ufans, utweet,ufollow ,ucolor  from usersall where uid=? limit 1";
		List<Usersall> list = DBUtil.query(Usersall.class, sql, uid);
		if (list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	public int addUserinfo(int uid) {
		String sql = "insert into usersinfo(uid) values(?)";
		int n = DBUtil.update(sql, uid);
		return n;
	}

	public int addTweetsNum(int uid) {
		String sql = "update usersinfo set utweet = (utweet + 1) where uid = ?";
		int n = DBUtil.update(sql, uid);
		return n;
	}

	public int delTweetsNum(int uid) {
		String sql = "update usersinfo set utweet = (utweet - 1) where uid = ?";
		int n = DBUtil.update(sql, uid);
		return n;
	}

	public int addFansNum(int uid, int state) {
		String sql = null;
		if (state == 1)
			sql = "update usersinfo set ufans = (ufans + 1) where uid = ?";
		else
			sql = "update usersinfo set ufans = (ufans - 1) where uid = ?";

		int n = DBUtil.update(sql, uid);
		return n;
	}

	public int addFollowNum(int uid, int state) {
		String sql = null;
		if (state == 1)
			sql = "update usersinfo set ufollow = (ufollow + 1) where uid = ?";
		else
			sql = "update usersinfo set ufollow = (ufollow - 1) where uid = ?";
		int n = DBUtil.update(sql, uid);
		return n;
	}

	public List<Usersall> searchWord(String word, int pagenum) {
		String sql = "select uid, uname,  urealname, uaite, ustate, utime, uonline, uaddress,  uabout, udate, ubg,ulogo, ufans, utweet,ufollow ,ucolor  from usersall where urealname like ? or uaite like ? order by uid  limit ?, 9";
		List<Usersall> list = DBUtil.query(Usersall.class, sql, "%" + word + "%", "%" + word + "%", pagenum);
		if (list.size() > 0) {
			return list;
		}
		return null;
	}

	public List<Usersall> searchWord(String word, List uidList, int pagenum) {
		List<Usersall> list = new ArrayList<Usersall>();
		String sql = "select uid, uname, urealname, uaite, ustate, utime, uonline, uaddress,  uabout, udate, ubg,ulogo, ufans, utweet,ufollow ,ucolor  from usersall where (urealname like ? or uaite like ?)";
		if (uidList.size() > 0) {
			sql += " and ( uid=0";
			for (int i = 0; i < uidList.size(); i++) {
				sql += " or uid=?";
			}
			sql += ")";
			sql += " order by uid  limit ?, 9";
			list = DBUtil.query(Usersall.class, sql, "%" + word + "%", uidList, pagenum);
		} else {
			sql += "order by uid  limit ?, 9";
			list = DBUtil.query(Usersall.class, sql, "%" + word + "%", "%" + word + "%", pagenum);
		}
		if (list.size() > 0) {
			return list;
		}
		return null;
	}

	public List<Usersall> searchWord(String word) {
		String sql = "select uid, uname, urealname, uaite, ustate, utime, uonline, uaddress,  uabout, udate, ubg,ulogo, ufans, utweet,ufollow ,ucolor  from usersall where urealname like ? or uaite like ? order by uid  limit 6";
		List<Usersall> list = DBUtil.query(Usersall.class, sql, "%" + word + "%", "%" + word + "%");
		if (list.size() > 0) {
			return list;
		}
		return null;
	}

	public Usersall getInfo(int uid) {
		String sql = "select uid, uname, urealname, uaite, ustate, utime, uonline, uaddress,  uabout, udate, ubg,ulogo, ufans, utweet,ufollow ,ucolor  from usersall where uid=? limit 1";
		List<Usersall> list = DBUtil.query(Usersall.class, sql, uid);
		if (list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	public Usersall getInfotwo(int uid) {
		String sql = "select uid, uname, urealname, uaite, uonline, uabout, ubg,ulogo, ufans, utweet,ufollow ,ucolor  from usersall where uid=? limit 1";
		List<Usersall> list = DBUtil.query(Usersall.class, sql, uid);
		if (list.size() > 0) {
			return list.get(0);
		}
		return null;
	}
}
