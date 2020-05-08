package com.itbank.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.common.LoginUtil;
import com.itbank.dao.MemberVO;
import com.itbank.service.BasketService;
import com.itbank.service.MemberService;

@Controller
public class LoginController {
	@Autowired private BasketService basketService;
	@Autowired private MemberService memberService;
	
	ModelAndView mv;
	
	// 메인 페이지에서 로그인 클릭 시
	@RequestMapping(value="login", method=RequestMethod.GET)
	public String test(@CookieValue(value="userid", required=false)Cookie userid, @CookieValue(value="JSESSIONID", required=false)Cookie sessionid, HttpServletRequest request, HttpSession session, String next) {
		// 자동 로그인 체크 했으면 저장되어있는 쿠키 정보를 받아서 POST로 넘어가지 않고 로그인 정보 저장
		try {
			if(session.getAttribute("loginuser") != null) return "redirect:/"; // interceptor로 넘어왔을 경우

			if(sessionid.getValue().equals(session.getId())) { // 쿠키에 저장된 JSESSIONID와 SESSION의 JSESSIONID가 같으면
				MemberVO vo = memberService.userIdCheck(userid.getValue());

				HttpSession session2 = request.getSession();
				session2.setAttribute("loginuser", vo);
				session2.setAttribute("basketcnt", basketService.basketGetCountById(vo.getUserid()));

				return "redirect:/";
			}
			
			return "login";
		} catch(NullPointerException e) { // 자동 로그인 체크 안 했을 시
			return "login";
		}
	}
	
	// ID, PW 입력 후 로그인 클릭 시
	@RequestMapping(value="login", method=RequestMethod.POST)
	public ModelAndView test(@CookieValue(value="saveid", required=false)Cookie saveidc, String userid, String userpw, String autologin, String saveid, HttpServletResponse response, Model model, HttpServletRequest request, String next) throws Exception {
		MemberVO vo = null;
		mv = new ModelAndView();

		boolean flag = false;
		String encode_pw = LoginUtil.encryptPassword(userid, userpw);
		try{
			vo = memberService.userIdCheck(userid); // 회원 여부 확인
			flag = vo.getUserpw().equals(encode_pw); // 회원 DB에 저장된 PW와 입력한 PW가 같은지 확인
		} catch(NullPointerException e) {
			mv.addObject("msg", "가입되지 않은 회원입니다.");
		}
		
		mv.setViewName("login"); // 입력한 PW가 일치하지 않으면 다시 login.jsp로 이동
		
		if(flag && vo.getWithdrawal() != 1) { // PW가 일치 하면
			HttpSession session = request.getSession();
			session.setAttribute("loginuser", vo); // 로그인 정보 SESSION에 저장
			session.setAttribute("basketcnt", basketService.basketGetCountById(vo.getUserid()));

			if(vo.getWithdrawal() == 2) {
				mv.addObject("admin", "admin");
				mv.setViewName("redirect:/admin/main");
			} else mv.setViewName(next == null ? "redirect:/" : "redirect:" + next); // interceptor로 넘어왔으면 next에 저장된 페이지로 이동

			try {
				if(autologin.equals("autologin")) { // 자동 로그인 체크 했으면 ID와 JSESSIONID 쿠키에 저장
		            Cookie idcookie = new Cookie("userid", vo.getUserid());
		            idcookie.setMaxAge(60*60*24*7);
		            response.addCookie(idcookie);
		            
		            Cookie jscookie = new Cookie("JSESSIONID", session.getId());
		            jscookie.setMaxAge(60*60*24*7);
		            response.addCookie(jscookie);
				}
			} catch(NullPointerException e) {} // 체크 안했으면
			
			try {
				if(saveid.equals("saveid")) { // ID저장 체크 했으면 쿠키에 ID저장
					Cookie saveidCookie = new Cookie("saveid", vo.getUserid());
					saveidCookie.setMaxAge(60 * 60 * 24 * 7);
					response.addCookie(saveidCookie);
				} 
			} catch(NullPointerException e) {} // 체크 안했으면

			try {
				if(saveid == null) { // ID저장 체크 안 했으면 쿠키 삭제
					Cookie saveidCookie = new Cookie("saveid", null);
					saveidCookie.setMaxAge(0);
					response.addCookie(saveidCookie);
				}
			} catch(NullPointerException e) {}
			
			return mv;
		} else {
			if(vo != null) mv.addObject("msg", "비밀번호가 일치하지 않습니다.");
			if(vo.getWithdrawal() == 1) mv.addObject("msg", "가입되지 않은 회원입니다.");

			return mv;
		}
	}
	
	// 로그아웃 클릭 시 모든 쿠키 삭제 및 세션 초기화
	@RequestMapping("logout")
	public String logout(@CookieValue(value="userid", required=false)Cookie userid, @CookieValue(value="JSESSIONID", required=false)Cookie sessionid, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();		
		session.invalidate();

		if(userid != null) {
			userid.setValue(null);
			userid.setMaxAge(0);
			response.addCookie(userid);
			
			sessionid.setValue(null);
			sessionid.setMaxAge(0);
			response.addCookie(sessionid);
		}
		
		return "redirect:/" ;		
	}
}