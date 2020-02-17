package com.itbank.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.dao.MemberVO;
import com.itbank.dao.ReviewDAO;
import com.itbank.dao.ReviewListVO;
import com.itbank.dao.ReviewVO;

@Service
public class ReviewService { // 리뷰 dao와 연동
	@Autowired private ReviewDAO dao;
	
	public void registReview(ReviewVO review) {
		dao.registReview(review);
	}
	
	public List<ReviewListVO> reviewList(int product_code) { // 로그인 안했을 경우 리뷰 목록(수정, 삭제 버튼 X)
		return dao.reviewList(product_code);
	}
	
	public List<ReviewListVO> reviewList(int product_code, MemberVO loginuser) { // 로그인 했을 경우 리뷰 목록(자신이 남긴 리뷰만 수정, 삭제 버튼 O)
		List<ReviewListVO> reply = dao.reviewList(product_code); // 상품 번호로 리뷰 목록 불러와서
		List<ReviewListVO> reply2 = new ArrayList<ReviewListVO>();
		
		for(ReviewListVO vo : reply) {
			if(loginuser.getUserid().equals(vo.getUserid())) { // 로그인한 사용자 userid와 리뷰 남긴 userid가 같으면
				vo.setLoginuser(loginuser.getUserid());
			}				
			reply2.add(vo);
		}
		return reply2;
	}
	
	public void deleteReview(ReviewVO review) {
		dao.deleteReview(review);
	}
	
	public void modifyReview(ReviewVO review) {
		dao.modifyReview(review);
	}
	
	public int reviewGetCount(int product_code) {
		return dao.reviewGetCount(product_code);
	}
}