package com.twitter.pojo;

import java.sql.Timestamp;

public class Admins {
	private int aid;
	private String aname;
	private String apwd;
	private Timestamp atime;
	private int astate;
	private int apower;

	public int getAid() {
		return aid;
	}

	public void setAid(int aid) {
		this.aid = aid;
	}

	public String getAname() {
		return aname;
	}

	public void setAname(String aname) {
		this.aname = aname;
	}

	public String getApwd() {
		return apwd;
	}

	public void setApwd(String apwd) {
		this.apwd = apwd;
	}

	public Timestamp getAtime() {
		return atime;
	}

	public void setAtime(Timestamp atime) {
		this.atime = atime;
	}

	public int getApower() {
		return apower;
	}

	public void setApower(int apower) {
		this.apower = apower;
	}

	public int getAstate() {
		return astate;
	}

	public void setAstate(int astate) {
		this.astate = astate;
	}

}
