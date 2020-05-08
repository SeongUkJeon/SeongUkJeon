package com.itbank.dao;

import java.sql.Timestamp;

public class ProductVO { // 상품 등록 시 사용
	private int product_code, product_price, product_quantity, product_delete;
	private String product_detail1, product_detail2, product_name, product_desc;
	private String product_image1, product_image2, product_image3, product_image4, product_image5;
	private Timestamp product_date;

	public Timestamp getProduct_date() {
		return product_date;
	}

	public void setProductdate(Timestamp product_date) {
		this.product_date = product_date;
	}

	public int getProduct_delete() {
		return product_delete;
	}

	public void setProductdelete(int product_delete) {
		this.product_delete = product_delete;
	}

	public int getProduct_code() {
		return product_code;
	}

	public void setProductcode(int product_code) {
		this.product_code = product_code;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProductprice(int product_price) {
		this.product_price = product_price;
	}

	public int getProduct_quantity() {
		return product_quantity;
	}

	public void setProductquantity(int product_quantity) {
		this.product_quantity = product_quantity;
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

	public String getProduct_name() {
		return product_name;
	}

	public void setProductname(String product_name) {
		this.product_name = product_name;
	}

	public String getProduct_desc() {
		return product_desc;
	}

	public void setProductdesc(String product_desc) {
		this.product_desc = product_desc;
	}

	public String getProduct_image1() {
		return product_image1;
	}

	public void setProductimage1(String product_image1) {
		this.product_image1 = product_image1;
	}

	public String getProduct_image2() {
		return product_image2;
	}

	public void setProductimage2(String product_image2) {
		this.product_image2 = product_image2;
	}

	public String getProduct_image3() {
		return product_image3;
	}

	public void setProductimage3(String product_image3) {
		this.product_image3 = product_image3;
	}

	public String getProduct_image4() {
		return product_image4;
	}

	public void setProductimage4(String product_image4) {
		this.product_image4 = product_image4;
	}

	public String getProduct_image5() {
		return product_image5;
	}

	public void setProductimage5(String product_image5) {
		this.product_image5 = product_image5;
	}
}