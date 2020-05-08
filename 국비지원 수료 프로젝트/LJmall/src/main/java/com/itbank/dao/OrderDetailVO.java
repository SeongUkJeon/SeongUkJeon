package com.itbank.dao;

public class OrderDetailVO { // 주문 상세 내용 출력 시 사용
	private int orderdetailnum, product_code, basketstock;
	private String orderid;

	public int getOrderdetailnum() {
		return orderdetailnum;
	}

	public void setOrderdetailnum(int orderdetailnum) {
		this.orderdetailnum = orderdetailnum;
	}

	public String getOrderid() {
		return orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}

	public int getBasketstock() {
		return basketstock;
	}

	public void setBasketstock(int basketstock) {
		this.basketstock = basketstock;
	}

	public int getProduct_code() {
		return product_code;
	}

	public void setProductcode(int product_code) {
		this.product_code = product_code;
	}
}