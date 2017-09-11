package com.twitter.pojo;

import java.sql.Timestamp;

public class Likes {
	private int lid;
	private int uid;
	private int tid;
	private Timestamp ltime;

	public int getLid() {
		return lid;
	}

	public void setLid(int lid) {
		this.lid = lid;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

	public Timestamp getLtime() {
		return ltime;
	}

	public void setLtime(Timestamp ltime) {
		this.ltime = ltime;
	}

}
