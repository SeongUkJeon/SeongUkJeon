package com.itbank.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itbank.dao.BasketListVO;
import com.itbank.dao.BasketVO;
import com.itbank.dao.MemberVO;
import com.itbank.dao.ProductVO;
import com.itbank.service.BasketService;
import com.itbank.service.ProductService;

@Controller
public class BasketController { // 장바구니 기능
	@Autowired private BasketService basketService;
	@Autowired private ProductService productService;
	
	// 장바구니 담기
	@ResponseBody
	@RequestMapping(value = "/detail/addBasket", method = RequestMethod.POST)
	public int addBasket(BasketVO basket, HttpSession session) {		
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		String userid = "";
		int result = 0;
		
		try{
			userid = loginuser.getUserid();
		} catch(NullPointerException e) {}
		
		if(loginuser != null) {
			basket.setUserid(userid);
			basketService.addBasket(basket);
			session.setAttribute("basketcnt", basketService.basketGetCountById(userid));
			result = 1;
		}
		
		return result;
	}
	
	// 장바구니 목록
	@RequestMapping(value = "basketList", method = RequestMethod.GET)
	public void getBasketList(HttpSession session, Model model) {
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		String userid = "";
		
		try{
			userid = loginuser.getUserid();
		} catch(NullPointerException e) {}
		
		List<BasketListVO> basketList = basketService.basketList(userid);
			
		model.addAttribute("basketList", basketList);
		model.addAttribute("flag", "0");
	}
	
	// 즉시 구매
	@RequestMapping(value = "buyNow", method = RequestMethod.POST)
	public String buyNow(BasketVO basket, HttpSession session, Model model) {
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		String userid = "";
		
		try{
			userid = loginuser.getUserid();
		} catch(NullPointerException e) {}
		
		ProductVO pvo = productService.detailView(basket.getProduct_code());

		BasketListVO bvo = new BasketListVO();
		bvo.setBasketnum(basket.getBasketnum());
		bvo.setBasketstock(basket.getBasketstock());
		bvo.setProductcode(basket.getProduct_code());
		bvo.setProductdetail1(pvo.getProduct_detail1());
		bvo.setProductdetail2(pvo.getProduct_detail2());
		bvo.setProductimage1(pvo.getProduct_image1());
		bvo.setProductname(pvo.getProduct_name());
		bvo.setProductprice(pvo.getProduct_price());
		bvo.setUserid(userid);
		
		model.addAttribute("basketList", bvo);
		model.addAttribute("flag", "1");
		
		return "basketList";
	}
	
	// 장바구니 삭제
	@ResponseBody
	@RequestMapping(value = "deleteBasket", method = RequestMethod.POST)
	public int deleteCart(HttpSession session, @RequestParam(value = "chbox[]") List<String> chArr, BasketVO basket) {		 
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		String userid = "";
		
		try{
			userid = loginuser.getUserid();
		} catch(NullPointerException e) {}
				
		int result = 0;
		int basketnum = 0;
		 
		if(loginuser != null) {
			basket.setUserid(userid);
			  
			for(String i : chArr) {
				basketnum = Integer.parseInt(i);
				basket.setBasketnum(basketnum);
				basketService.deleteBasket(basket);
				session.setAttribute("basketcnt", basketService.basketGetCountById(userid));
			}   
			result = 1;
		}  
		return result;  
	}
}