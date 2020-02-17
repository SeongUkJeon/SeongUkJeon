package com.itbank.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.dao.InquiryListVO;
import com.itbank.dao.ProductVO;
import com.itbank.service.InquiryService;
import com.itbank.service.ProductService;
import com.itbank.service.ReviewService;

@Controller
public class ProductController {
	@Autowired
	private ProductService productService;
	@Autowired
	private InquiryService inquiryService;
	@Autowired
	private ReviewService reviewService;

	@RequestMapping("view") // 상품 카테고리 클릭 시 목록 보여 줌
	public ModelAndView category(@RequestParam Map<String, String> category) {
		ModelAndView mv = new ModelAndView("productList");

		List<ProductVO> list = productService.getList(category);

		mv.addObject("list", list);

		return mv;
	}
	
	@RequestMapping(value = "detail", method = RequestMethod.GET) // 상품 이미지 클릭 시 상세 내용 출력
	public String getDetail(@RequestParam("n") int product_code, Model model) {
		ProductVO view = productService.detailView(product_code);
		model.addAttribute("view", view);

		List<InquiryListVO> inquiry = inquiryService.inquiryList(product_code);
		model.addAttribute("inquiry", inquiry);
		
		model.addAttribute("revCnt", reviewService.reviewGetCount(product_code));

		return "detail";
	}
}