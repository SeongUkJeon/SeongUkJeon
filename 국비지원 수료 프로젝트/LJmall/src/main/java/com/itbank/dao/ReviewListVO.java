package com.itbank.dao;

import java.sql.Date;

public class ReviewListVO { // 리뷰 목록 출력 시 사용
	private int product_code, revnum, rating;
	private String userid, revcon, username, loginuser;
	private Date revdate;

	public int getProduct_code() {
		return product_code;
	}

	public void setProduct_code(int product_code) {
		this.product_code = product_code;
	}

	public int getRevnum() {
		return revnum;
	}

	public void setRevnum(int revnum) {
		this.revnum = revnum;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getRevcon() {
		return revcon;
	}

	public void setRevcon(String revcon) {
		this.revcon = revcon;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Date getRevdate() {
		return revdate;
	}

	public void setRevdate(Date revdate) {
		this.revdate = revdate;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getLoginuser() {
		return loginuser;
	}

	public void setLoginuser(String loginuser) {
		this.loginuser = loginuser;
	}
}