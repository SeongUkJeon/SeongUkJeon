package com.itbank.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.itbank.dao.MemberVO;

public class AdminInterceptor extends HandlerInterceptorAdapter { // 관리자 id로 로그인 하지 않고 관리자 페이지 접근 시 인터셉트
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object obj) throws Exception {
		HttpSession session = req.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");

		if (loginuser == null) {
			res.sendRedirect(req.getContextPath() + "/login");
			return false;
		}

		if (loginuser == null || loginuser.getWithdrawal() != 2) {
			res.sendRedirect(req.getContextPath() + "/");
			return false;
		}

		return true;
	}
}