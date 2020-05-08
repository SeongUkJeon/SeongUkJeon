package com.itbank.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InquiryDAO { // 문의 관련 필요한 DB연동
	@Autowired
	private SqlSessionTemplate template;

	public void registInquiry(QuestionVO question) { // 문의 등록
		template.insert("registInquiry", question);
	}

	public List<InquiryListVO> inquiryList(int product_code) { // 상품번호별 문의 목록
		return template.selectList("inquiryList", product_code);
	}

	public List<InquiryVO> inquiryListByCategory(String category) { // 카테고리별 문의 목록
		return template.selectList("inquiryListByCategory", category);
	}

	public List<InquiryVO> allInquiryList() { // 모든 문의 목록
		return template.selectList("allInquiryList");
	}

	public List<InquiryVO> getNoAnswerList() { // 답변 달지 않은 전체 문의 목록
		return template.selectList("getNoAnswer");
	}

	public List<InquiryVO> getNoAnswerList(String category) { // 답별 달지 않은 카테고리별 문의 목록
		return template.selectList("getNoAnswer2", category);
	}

	public void setAnswer(AnswerVO answer) { // 답변 등록
		template.update("setAnswer", answer);
	}

	public InquiryVO getNoAnswer(Map<String, Object> map) { // 문의 목록 중 하나의 row
		return template.selectOne("oneQuestion", map);
	}

	public void deleteInquiry(int inquirynum) { // 문의 삭제
		template.delete("deleteInquiry", inquirynum);
	} 

	public int getCategoryTypeCnt(String category) { // 카테고리 별 row 개수
		return template.selectOne("getCategoryTypeCnt", category);
	}

	public List<InquiryVO> getInquiry(String userid) { // userid별 문의 목록
		return template.selectList("getInquiry", userid);
	}

	public Integer getNum(Map<String, String> asdf) { // userid와 상품번호로 문의 목록 개수 검색
		return template.selectOne("getNum", asdf);
	}

	public List<InquiryVO> getInquiry1(Map<String, String> map) { // userid와 상품번호로 문의 목록 불러 옴
		return template.selectList("getInquiry1", map);
	}
}