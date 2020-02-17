package com.itbank.dao;

public class ProductRequest { // 등록된 상품 내용 중 이미지 빼고 불러올 때 사용
	private int product_code, product_price, product_quantity;
	private String product_detail1, product_detail2, product_name, product_desc;

	public int getProduct_code() {
		return product_code;
	}

	public void setProduct_code(int product_code) {
		this.product_code = product_code;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	public int getProduct_quantity() {
		return product_quantity;
	}

	public void setProduct_quantity(int product_quantity) {
		this.product_quantity = product_quantity;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getProduct_desc() {
		return product_desc;
	}

	public void setProduct_desc(String product_desc) {
		this.product_desc = product_desc;
	}

	public String getProduct_detail2() {
		return product_detail2;
	}

	public void setProduct_detail2(String product_detail2) {
		this.product_detail2 = product_detail2;
	}

	public String getProduct_detail1() {
		return product_detail1;
	}

	public void setProduct_detail1(String product_detail1) {
		this.product_detail1 = product_detail1;
	}

}
