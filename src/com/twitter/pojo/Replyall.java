package com.twitter.pojo;

import java.sql.Timestamp;

public class Replyall {
	private int rid;
	private int uid;
	private int tid;
	private String rcontent;
	private String uname;
	private String urealname;
	private String uaite;
	private String ulogo;
	private Timestamp rtime;
	private String time;

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public Timestamp getRtime() {
		return rtime;
	}

	public void setRtime(Timestamp rtime) {
		this.rtime = rtime;
	}

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
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

	public String getRcontent() {
		return rcontent;
	}

	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUrealname() {
		return urealname;
	}

	public void setUrealname(String urealname) {
		this.urealname = urealname;
	}

	public String getUaite() {
		return uaite;
	}

	public void setUaite(String uaite) {
		this.uaite = uaite;
	}

	public String getUlogo() {
		return ulogo;
	}

	public void setUlogo(String ulogo) {
		this.ulogo = ulogo;
	}

}
