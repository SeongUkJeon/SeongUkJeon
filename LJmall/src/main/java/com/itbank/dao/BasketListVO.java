package com.itbank.dao;

public class BasketListVO { // 장바구니 목록 출력 시 사용
	private int basketnum, product_code, basketstock, product_price;
	private String userid, product_name, product_image1, product_detail1, product_detail2;

	public int getBasketnum() {
		return basketnum;
	}

	public void setBasketnum(int basketnum) {
		this.basketnum = basketnum;
	}

	public int getProduct_code() {
		return product_code;
	}

	public void setProductcode(int product_code) {
		this.product_code = product_code;
	}

	public int getBasketstock() {
		return basketstock;
	}

	public void setBasketstock(int basketstock) {
		this.basketstock = basketstock;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProductprice(int product_price) {
		this.product_price = product_price;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProductname(String product_name) {
		this.product_name = product_name;
	}

	public String getProduct_image1() {
		return product_image1;
	}

	public void setProductimage1(String product_image1) {
		this.product_image1 = product_image1;
	}

	public String getProduct_detail1() {
		return product_detail1;
	}

	public void setProductdetail1(String product_detail1) {
		this.product_detail1 = product_detail1;
	}

	public String getProduct_detail2() {
		return product_detail2;
	}

	public void setProductdetail2(String product_detail2) {
		this.product_detail2 = product_detail2;
	}
}