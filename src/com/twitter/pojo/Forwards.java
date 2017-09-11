package com.twitter.pojo;

import java.sql.Timestamp;

public class Forwards {
	private int fid;
	private int stid;
	private int tid;
	private Timestamp ftime;
	private int uid;

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public Timestamp getFtime() {
		return ftime;
	}

	public void setFtime(Timestamp ftime) {
		this.ftime = ftime;
	}

	public int getFid() {
		return fid;
	}

	public void setFid(int fid) {
		this.fid = fid;
	}

	public int getStid() {
		return stid;
	}

	public void setStid(int stid) {
		this.stid = stid;
	}

	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

}
