package com.twitter.pojo;

import java.sql.Timestamp;

public class Signin {
	private int sid;
	private int uid;
	private Timestamp stime;
	private Timestamp sdtime;

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public Timestamp getStime() {
		return stime;
	}

	public void setStime(Timestamp stime) {
		this.stime = stime;
	}

	public Timestamp getSdtime() {
		return sdtime;
	}

	public void setSdtime(Timestamp sdtime) {
		this.sdtime = sdtime;
	}

}
