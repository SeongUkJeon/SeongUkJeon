package com.itbank.controller;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itbank.dao.MemberVO;
import com.itbank.dao.OrderDetailVO;
import com.itbank.dao.OrderListVO;
import com.itbank.dao.OrdersVO;
import com.itbank.service.BasketService;
import com.itbank.service.OrdersService;

@Controller
public class OrdersController {
	@Autowired private OrdersService ordersService;
	@Autowired private BasketService basketService;
	
	// 장바구니 목록 form에서 주문 submit 시
	@RequestMapping(value = "basketList", method = RequestMethod.POST)
	public String order(HttpSession session, OrdersVO orders, OrderDetailVO orderDetail, String flag, String product_code, String basketstock) {
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		String userid = loginuser.getUserid();

		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";

		for(int i = 1; i <= 6; i++) {
			subNum += (int)(Math.random() * 10);
		}

		String orderId = ymd + "_" + subNum;
		
		orders.setOrderid(orderId);
		orders.setUserid(userid);
				
		orderDetail.setOrderid(orderId);
		
		ordersService.orderInfo(orders);
		if(flag.equals("0")) {			
			ordersService.orderInfo_Detail(orderDetail);
			basketService.basketAllDelete(userid);
			session.setAttribute("basketcnt", basketService.basketGetCountById(userid));
		} else {
			orderDetail.setBasketstock(Integer.parseInt(basketstock));			
			orderDetail.setProductcode(Integer.parseInt(product_code));
			ordersService.orderInfo_Detail2(orderDetail);
		}
		
		return "redirect:/orderList";
	}
	
	// 주문 목록
	@RequestMapping(value = "orderList", method = RequestMethod.GET)
	public void getOrderList(HttpSession session, OrdersVO orders, Model model) {
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		String userid = loginuser.getUserid();
		
		orders.setUserid(userid);
		
		List<OrdersVO> orderList = ordersService.orderList(orders);
		
		model.addAttribute("orderList", orderList);
	}
	
	// 주문 목록에서 주문 번호 클릭 시
	@RequestMapping(value = "orderView", method = RequestMethod.GET)
	public void getOrderList(HttpSession session, @RequestParam("n") String orderid, Model model) {
		List<OrderListVO> orderView = ordersService.orderViewFromOrderid(orderid);		
		 
		model.addAttribute("orderView", orderView);
	}
	
	// 주문 취소
	@ResponseBody
	@RequestMapping(value = "deleteOrder", method = RequestMethod.POST)
	public int deleteOrder(HttpSession session, @RequestParam(value = "orderid") String orderid) {		 
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");

		int result = 0;
		 
		if(loginuser != null) {
			ordersService.deleteOrder(orderid);
			
			result = 1;
		}  
		return result;  
	}
}