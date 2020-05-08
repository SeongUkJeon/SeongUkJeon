package com.itbank.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.itbank.dao.MemberVO;

public class BuyNowInterceptor extends HandlerInterceptorAdapter { // 로그인 하지 않고 즉시 구매 누르면 인터셉트
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object obj) throws Exception {
		HttpSession session = req.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		String n = req.getParameter("n");

		if(loginuser == null) {
			res.sendRedirect(req.getContextPath() + "/login?next=/detail?n=" + n);
			return false;
		}
		
		return true;
	}
}