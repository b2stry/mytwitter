package com.twitter.pojo;

import java.sql.Timestamp;

public class Tweets {
	private int tid;
	private int uid;
	private String tcontent;
	private Timestamp ttime;
	private String tpic;
	private String tvideo;
	private int treply;
	private int tforward;
	private int tlike;

	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getTcontent() {
		return tcontent;
	}

	public void setTcontent(String tcontent) {
		this.tcontent = tcontent;
	}

	public Timestamp getTtime() {
		return ttime;
	}

	public void setTtime(Timestamp ttime) {
		this.ttime = ttime;
	}

	public String getTpic() {
		return tpic;
	}

	public void setTpic(String tpic) {
		this.tpic = tpic;
	}

	public String getTvideo() {
		return tvideo;
	}

	public void setTvideo(String tvideo) {
		this.tvideo = tvideo;
	}

	public int getTreply() {
		return treply;
	}

	public void setTreply(int treply) {
		this.treply = treply;
	}

	public int getTforward() {
		return tforward;
	}

	public void setTforward(int tforward) {
		this.tforward = tforward;
	}

	public int getTlike() {
		return tlike;
	}

	public void setTlike(int tlike) {
		this.tlike = tlike;
	}

}
