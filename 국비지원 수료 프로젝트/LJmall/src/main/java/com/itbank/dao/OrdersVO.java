package com.itbank.dao;

import java.util.Date;

public class OrdersVO { // 주문 관련 DB 연동
	private String orderid, userid, orderrec, useraddr1, useraddr2, useraddr3, orderphone, delivery;
	private int amount, invoicenum;
	private Date orderdate;

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

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public Date getOrderdate() {
		return orderdate;
	}

	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}

	public String getOrderphone() {
		return orderphone;
	}

	public void setOrderphone(String orderphone) {
		this.orderphone = orderphone;
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
}