package com.dbinc.pgm.vo;

public class MonthlyJobStatusVO {
	int gubun;
	String wkdate;
	int van, teu;

	public void setWkdate(String wkdate) {
		this.wkdate = wkdate;
	}

	public String getWkdate() {
		return wkdate;
	}

	public int getGubun() {
		return gubun;
	}

	public void setGubun(int gubun) {
		this.gubun = gubun;
	}

	public int getVan() {
		return van;
	}

	public void setVan(int van) {
		this.van = van;
	}

	public int getTeu() {
		return teu;
	}

	public void setTeu(int teu) {
		this.teu = teu;
	}
}