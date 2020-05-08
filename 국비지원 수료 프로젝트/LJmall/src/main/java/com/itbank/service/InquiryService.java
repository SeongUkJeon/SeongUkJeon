package com.itbank.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.dao.AnswerVO;
import com.itbank.dao.InquiryDAO;
import com.itbank.dao.InquiryListVO;
import com.itbank.dao.InquiryVO;
import com.itbank.dao.QuestionVO;

@Service
public class InquiryService { // 문의 dao와 연동
	@Autowired
	private InquiryDAO dao;

	public void registInquiry(QuestionVO question) {
		dao.registInquiry(question);
	}

	public List<InquiryListVO> inquiryList(int product_code) {
		return dao.inquiryList(product_code);
	}
	

	public List<InquiryVO> inquiryListByCategory(String category) {
		return dao.inquiryListByCategory(category);
	}
	
	public List<InquiryVO> allInquiryList() {
		return dao.allInquiryList();
	}

	// 상품 문의에 답글이 없는 리스트
	public List<InquiryVO> getNoAnswerList() {
		return dao.getNoAnswerList();
	}

	// 상품 문의에 답글이 없는 리스트(카테고리 별)
	public List<InquiryVO> getNoAnswerList(String category) {
		return dao.getNoAnswerList(category);
	}

	// 상품 문의에 답글을 달았을때 수정
	public void setAnswer(AnswerVO answer) {
		dao.setAnswer(answer);
	}

	public InquiryVO getNoAnswer(Map<String, Object> map) {
		return dao.getNoAnswer(map);
	}
	
	public void deleteInquiry(int inquirynum) {
		dao.deleteInquiry(inquirynum);
	}
	
	public int getCategoryTypeCnt(String category) {
		return dao.getCategoryTypeCnt(category);
	}
	
	public List<InquiryVO> getInquiry(String userid) {
		return dao.getInquiry(userid);
	}
	
	public Integer getNum(Map<String, String> asdf) {
		return dao.getNum(asdf);
	}
	
	public List<InquiryVO> getInquiry1(Map<String, String> map) {
		return dao.getInquiry1(map);
	}
}