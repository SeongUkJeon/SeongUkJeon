package com.itbank.controller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.dao.MemberRequest;
import com.itbank.service.MemberService;

@Controller
public class MemberController {
	@Autowired private MemberService memberService;
	
	ModelAndView mv;
	
	// 약관 동의 후 회원가입 클릭 시
	@RequestMapping(value="memberJoin", method=RequestMethod.POST)
	public String memberJoin() {
		return "memberJoin";
	}
	
	// 회원가입 정보 입력 후 버튼 클릭 시
	@RequestMapping(value="memberJoin2", method=RequestMethod.POST)
	public ModelAndView memberJoin(MemberRequest joinRequest) throws Exception {
		mv = new ModelAndView("redirect:/");
		int row = 0;
		try {			
			row = memberService.joinMember(joinRequest);
		} catch(SQLException e) {
			mv.addObject("result", "중복 된 ID입니다.");
			mv.setViewName("memberJoin");
		}
		
		if(row == 1) {
			return mv;
		} else {
			mv.setViewName("memberJoin");
			return mv;
		}	
	}
	
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.GET)
	public int idCheck(@RequestParam("userid") String userid) { // ID 중복확인
		int data = 0;
		try {			
			if(memberService.userIdCheck(userid).getUserid().equals(userid)) data = 1;
		} catch(NullPointerException e) {}
		return data;
	}
}