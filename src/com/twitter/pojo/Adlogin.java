package com.twitter.pojo;

import java.sql.Timestamp;

public class Adlogin {
	private int adid;
	private int aid;
	private Timestamp aditime;
	private Timestamp adotime;

	public int getAdid() {
		return adid;
	}

	public void setAdid(int adid) {
		this.adid = adid;
	}

	public int getAid() {
		return aid;
	}

	public void setAid(int aid) {
		this.aid = aid;
	}

	public Timestamp getAditime() {
		return aditime;
	}

	public void setAditime(Timestamp aditime) {
		this.aditime = aditime;
	}

	public Timestamp getAdotime() {
		return adotime;
	}

	public void setAdotime(Timestamp adotime) {
		this.adotime = adotime;
	}
}
