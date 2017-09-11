package com.twitter.dao;

import java.sql.Timestamp;
import java.util.List;

import com.twitter.pojo.Messageall;
import com.twitter.pojo.Usersall;
import com.twitter.util.DBUtil;

public class MessageDao {
	public int delFriend(int fuid, String suid) {
		String sql = "delete from message where ( fuid=? and suid=?) or (fuid=? and suid=?)";
		int n = DBUtil.update(sql, fuid, suid, suid, fuid);
		return n;
	}

	public List<Usersall> addFriend(int fuid) {
		String sql = "SELECT * FROM usersall where uid in(select s_uid from concern where f_uid=?);";
		List<Usersall> list = DBUtil.query(Usersall.class, sql, fuid);
		if (list != null)
			return list;
		return null;
	}

	public List<Messageall> shuaXin(int fuid, String mid, String suid) {
		String sql = "select * from messageall where (( fuid=? and suid=?) or (fuid=? and suid=?)) and mid>?";
		List<Messageall> list = DBUtil.query(Messageall.class, sql, fuid, suid, suid, fuid, mid);
		if (list != null)
			return list;
		return null;
	}

	public int toRead(int fuid, String suid) {
		String sql = "update message set mread = 1 where  (fuid=? and suid=?) and mread = 0";
		int n = DBUtil.update(sql, suid, fuid);
		return n;
	}

	public int hasNew(int fuid) {
		String sql = "select * from messageall where suid=? and mread=0";
		List<Messageall> list = DBUtil.query(Messageall.class, sql, fuid);
		if (list != null)
			return list.size();
		return 0;
	}

	public int addMsg(int fuid, int suid, String mcontent, Timestamp mtime, int mread) {
		String sql = "insert into message(fuid, suid, mcontent, mtime, mread) values(?,?,?,?,?)";
		int n = DBUtil.update(sql, fuid, suid, mcontent, mtime, mread);
		return n;
	}

	public List<Messageall> findById(int uid, int num) {
		String sql = null;
		if (num == 1)
			sql = "select * from messageall where mtime in(select max(mtime) from messageall GROUP BY suid) and fuid = ?";
		else
			sql = "select * from messageall where mtime in(select max(mtime) from messageall GROUP BY fuid) and suid = ?";
		List<Messageall> list = DBUtil.query(Messageall.class, sql, uid);
		if (list != null)
			return list;
		return null;
	}

	public List<Messageall> findByTwoId(String fuid, int suid) {
		String sql = "select * from messageall where (fuid=? and suid=?) or (fuid=? and suid=?) ORDER BY mtime";
		List<Messageall> list = DBUtil.query(Messageall.class, sql, fuid, suid, suid, fuid);
		if (list != null)
			return list;
		return null;
	}
}
