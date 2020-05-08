package com.itbank.dao;

import java.sql.Timestamp;

public class InquiryVO { // 문의 등록 시 사용
	private int product_code, inquirynum;
	private String question, answer, category, userid;
	private Timestamp cdate;

	public int getProduct_code() {
		return product_code;
	}

	public void setProductcode(int product_code) {
		this.product_code = product_code;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public Timestamp getCdate() {
		return cdate;
	}

	public void setCdate(Timestamp cdate) {
		this.cdate = cdate;
	}

	public int getInquirynum() {
		return inquirynum;
	}

	public void setInquirynum(int inquirynum) {
		this.inquirynum = inquirynum;
	}

}
