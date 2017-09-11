package com.twitter.pojo;

import java.sql.Timestamp;

public class Users {
	private int uid;
	private String uname;
	private String upwd;
	private String urealname;
	private String uaite;
	private int ustate;
	private Timestamp utime;
	private int uonline;

	public int getUonline() {
		return uonline;
	}

	public void setUonline(int uonline) {
		this.uonline = uonline;
	}

	public int getUstate() {
		return ustate;
	}

	public void setUstate(int ustate) {
		this.ustate = ustate;
	}

	public Timestamp getUtime() {
		return utime;
	}

	public void setUtime(Timestamp utime) {
		this.utime = utime;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUpwd() {
		return upwd;
	}

	public void setUpwd(String upwd) {
		this.upwd = upwd;
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

}
