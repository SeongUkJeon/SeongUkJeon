package com.itbank.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itbank.dao.ProductVO;
import com.itbank.service.ProductService;

@Controller
public class HomeController {
	@Autowired private ProductService productService;
	
	@RequestMapping("/") // 최초 url 접속 시
	public String home(Model model, HttpSession session) {
		List<ProductVO> newList = productService.getNewList();

		model.addAttribute("newList", newList);
		model.addAttribute("loginuser", session.getAttribute("loginuser")); // 로그인 시 로그인 정보 session 유지	
		
		return "index"; // index.jsp로 이동
	}
	
	// footer의 개인정보 처리방침 클릭 시
	@RequestMapping("privacy")
	public String privacy() {
		return "privacy";
	}
	
	// footer의 구매 이용약관 클릭 시
	@RequestMapping(value="terms", method=RequestMethod.GET)
	public String terms(String memberJoin, Model model) {
		try {			
			if(memberJoin.equals("1")) model.addAttribute("memberJoin", memberJoin);
		} catch (NullPointerException e) {}
		return "terms";
	}
}