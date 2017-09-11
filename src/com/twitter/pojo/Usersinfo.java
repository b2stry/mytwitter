package com.twitter.pojo;

import java.sql.Timestamp;

public class Usersinfo {
	private int id;
	private int uid;
	private String uaddress;
	private String uabout;
	private Timestamp udate;
	private String ulogo;
	private String ubg;
	private int ufans;
	private int utweet;
	private int ufollow;
	private String ucolor;

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getUcolor() {
		return ucolor;
	}

	public void setUcolor(String ucolor) {
		this.ucolor = ucolor;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUaddress() {
		return uaddress;
	}

	public void setUaddress(String uaddress) {
		this.uaddress = uaddress;
	}

	public String getUabout() {
		return uabout;
	}

	public void setUabout(String uabout) {
		this.uabout = uabout;
	}

	public Timestamp getUdate() {
		return udate;
	}

	public void setUdate(Timestamp udate) {
		this.udate = udate;
	}

	public String getUlogo() {
		return ulogo;
	}

	public void setUlogo(String ulogo) {
		this.ulogo = ulogo;
	}

	public String getUbg() {
		return ubg;
	}

	public void setUbg(String ubg) {
		this.ubg = ubg;
	}

	public int getUfans() {
		return ufans;
	}

	public void setUfans(int ufans) {
		this.ufans = ufans;
	}

	public int getUtweet() {
		return utweet;
	}

	public void setUtweet(int utweet) {
		this.utweet = utweet;
	}

	public int getUfollow() {
		return ufollow;
	}

	public void setUfollow(int ufollow) {
		this.ufollow = ufollow;
	}

}
