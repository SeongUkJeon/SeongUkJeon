package com.itbank.dao;

import java.sql.Date;

public class OrderListVO { // 주문 목록 출력 시 사용
	private String orderid, userid, orderrec, useraddr1, useraddr2, useraddr3, orderphone, product_name, product_image1, delivery, product_detail1, product_detail2;
	private int amount, orderdetailnum, product_code, basketstock, product_price, invoicenum;
	private Date orderDate;

	public String getOrderid() {
		return orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getOrderrec() {
		return orderrec;
	}

	public void setOrderrec(String orderrec) {
		this.orderrec = orderrec;
	}

	public String getUseraddr1() {
		return useraddr1;
	}

	public void setUseraddr1(String useraddr1) {
		this.useraddr1 = useraddr1;
	}

	public String getUseraddr2() {
		return useraddr2;
	}

	public void setUseraddr2(String useraddr2) {
		this.useraddr2 = useraddr2;
	}

	public String getUseraddr3() {
		return useraddr3;
	}

	public void setUseraddr3(String useraddr3) {
		this.useraddr3 = useraddr3;
	}

	public String getOrderphone() {
		return orderphone;
	}

	public void setOrderphone(String orderphone) {
		this.orderphone = orderphone;
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

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getOrderdetailnum() {
		return orderdetailnum;
	}

	public void setOrderdetailnum(int orderdetailnum) {
		this.orderdetailnum = orderdetailnum;
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

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getDelivery() {
		return delivery;
	}

	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}

	public int getInvoicenum() {
		return invoicenum;
	}

	public void setInvoicenum(int invoicenum) {
		this.invoicenum = invoicenum;
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