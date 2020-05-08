package com.itbank.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.dao.QuestionVO;
import com.itbank.service.InquiryService;

@Controller
public class InquiryController { // 문의 등록 시 동작
	@Autowired
	private InquiryService inquiryService;

	// 데이터 입력 후 submit 시
	@RequestMapping(value = "/inquiry", method = RequestMethod.POST)
	public ModelAndView inquiry(QuestionVO question) {
		ModelAndView mv = new ModelAndView("redirect:/detail");
		inquiryService.registInquiry(question);

		return mv;
	}
	
	// 팝업 창으로 문의 form 띄움
	@RequestMapping(value = "/inquiry", method = RequestMethod.GET)
	public ModelAndView inquiry() {
		ModelAndView mv = new ModelAndView("inquiry");

		return mv;
	}
}