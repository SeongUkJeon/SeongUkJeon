package com.itbank.dao;

import java.util.Date;

public class BasketVO { // 장바구니 추가 시 사용
	private int basketnum, product_code, basketstock;
	private String userid;
	private Date adddate;

	public int getBasketnum() {
		return basketnum;
	}

	public void setBasketnum(int basketnum) {
		this.basketnum = basketnum;
	}

	public int getProduct_code() {
		return product_code;
	}

	public void setProduct_code(int product_code) {
		this.product_code = product_code;
	}

	public int getBasketstock() {
		return basketstock;
	}

	public void setBasketstock(int basketstock) {
		this.basketstock = basketstock;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public Date getAdddate() {
		return adddate;
	}

	public void setAdddate(Date adddate) {
		this.adddate = adddate;
	}

}