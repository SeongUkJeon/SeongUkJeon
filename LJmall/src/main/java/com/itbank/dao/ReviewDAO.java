package com.itbank.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAO {
	@Autowired
	private SqlSessionTemplate template;

	public void registReview(ReviewVO review) { // 리뷰 등록
		template.insert("registReview", review);
	}

	public List<ReviewListVO> reviewList(int product_code) { // 모든 리뷰 목록
		return template.selectList("reviewList", product_code);
	}

	public void deleteReview(ReviewVO review) { // 리뷰 삭제
		template.delete("deleteReview", review);
	}

	public void modifyReview(ReviewVO review) { // 리뷰 수정
		template.update("modifyReview", review);
	}

	public int reviewGetCount(int product_code) { // 리뷰 row 개수 불러 옴
		return template.selectOne("reviewGetCount", product_code);
	}
}