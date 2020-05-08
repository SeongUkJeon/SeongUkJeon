package com.itbank.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itbank.dao.MemberVO;
import com.itbank.dao.ReviewListVO;
import com.itbank.dao.ReviewVO;
import com.itbank.service.ReviewService;

@Controller
public class ReviewController {
	@Autowired
	private ReviewService reviewService;
	
	// 리뷰 목록
	@ResponseBody
	@RequestMapping(value = "/detail/reviewList", method = RequestMethod.GET)
	public List<ReviewListVO> getReviewList(@RequestParam("n")int product_code, HttpSession session) {
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		List<ReviewListVO> reply = null;
		if(loginuser == null) {
			reply = reviewService.reviewList(product_code);
		} else {	
			reply = reviewService.reviewList(product_code, loginuser);
		}
		
		return reply;
	}
	
	// 상품 소감(댓글) 작성
	@ResponseBody
	@RequestMapping(value = "/detail/registReview", method = RequestMethod.POST)
	public void registReview(ReviewVO review, HttpSession session) { 
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		review.setUserid(loginuser.getUserid());
		 
		reviewService.registReview(review);
	} 
	
	// 상품 소감(댓글) 삭제
	@ResponseBody
	@RequestMapping(value = "/detail/deleteReview", method = RequestMethod.POST)
	public void getReviewList(ReviewVO review,  HttpSession session) {
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		review.setUserid(loginuser.getUserid());
		
		reviewService.deleteReview(review);
	}
	
	// 상품 소감(댓글) 수정
	@ResponseBody
	@RequestMapping(value = "/detail/modifyReview", method = RequestMethod.POST)
	public void modifyReply(ReviewVO review, HttpSession session) throws Exception {
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		review.setUserid(loginuser.getUserid());
		
		reviewService.modifyReview(review);
	}
}