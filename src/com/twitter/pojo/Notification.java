package com.twitter.pojo;

import java.sql.Timestamp;

public class Notification {
	private int nid;
	private int nuid;
	private int ntype;
	private int nlikeuid;
	private int nliketid;
	private int nreuid;
	private int nretid;
	private int nuided;
	private int nhuiuid;
	private int nhuitid;
	private String nrcontent;
	private Timestamp ntime;
	private int nstate;
	private Utweets utweets;
	private Utweets utweetstwo;

	public int getNhuiuid() {
		return nhuiuid;
	}

	public void setNhuiuid(int nhuiuid) {
		this.nhuiuid = nhuiuid;
	}

	public int getNhuitid() {
		return nhuitid;
	}

	public void setNhuitid(int nhuitid) {
		this.nhuitid = nhuitid;
	}

	public String getNrcontent() {
		return nrcontent;
	}

	public void setNrcontent(String nrcontent) {
		this.nrcontent = nrcontent;
	}

	public Utweets getUtweetstwo() {
		return utweetstwo;
	}

	public void setUtweetstwo(Utweets utweetstwo) {
		this.utweetstwo = utweetstwo;
	}

	private Usersall user;
	private String time;

	public int getNreuid() {
		return nreuid;
	}

	public void setNreuid(int nreuid) {
		this.nreuid = nreuid;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public Utweets getUtweets() {
		return utweets;
	}

	public void setUtweets(Utweets utweets) {
		this.utweets = utweets;
	}

	public Usersall getUser() {
		return user;
	}

	public void setUser(Usersall user) {
		this.user = user;
	}

	public int getNid() {
		return nid;
	}

	public void setNid(int nid) {
		this.nid = nid;
	}

	public int getNuid() {
		return nuid;
	}

	public void setNuid(int nuid) {
		this.nuid = nuid;
	}

	public int getNtype() {
		return ntype;
	}

	public void setNtype(int ntype) {
		this.ntype = ntype;
	}

	public int getNlikeuid() {
		return nlikeuid;
	}

	public void setNlikeuid(int nlikeuid) {
		this.nlikeuid = nlikeuid;
	}

	public int getNliketid() {
		return nliketid;
	}

	public void setNliketid(int nliketid) {
		this.nliketid = nliketid;
	}

	public int getNretid() {
		return nretid;
	}

	public void setNretid(int nretid) {
		this.nretid = nretid;
	}

	public int getNuided() {
		return nuided;
	}

	public void setNuided(int nuided) {
		this.nuided = nuided;
	}

	public Timestamp getNtime() {
		return ntime;
	}

	public void setNtime(Timestamp ntime) {
		this.ntime = ntime;
	}

	public int getNstate() {
		return nstate;
	}

	public void setNstate(int nstate) {
		this.nstate = nstate;
	}

}
