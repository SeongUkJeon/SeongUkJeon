package com.itbank.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.common.LoginUtil;
import com.itbank.dao.InquiryVO;
import com.itbank.dao.MemberRequest;
import com.itbank.dao.MemberVO;
import com.itbank.dao.OrdersVO;
import com.itbank.dao.ProductVO;
import com.itbank.service.InquiryService;
import com.itbank.service.MemberService;
import com.itbank.service.OrdersService;
import com.itbank.service.ProductService;

@Controller
@RequestMapping("/myPage")
public class MyPageController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private InquiryService inquiryService;
	@Autowired
	private ProductService productService;
	@Autowired
	private OrdersService ordersService;

	ModelAndView mv = new ModelAndView();

	// 마이페이지 열리면서 주문내역을 바로 보여줌
	@RequestMapping(value = { "", "/" }, method = RequestMethod.GET)
	public ModelAndView myPage(HttpSession session, OrdersVO orders, Model model) {
		mv = new ModelAndView("/myPage/main");

		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		
		if (loginuser.getWithdrawal() == 2) {
			mv.setViewName("/admin/main");
			return mv;
		}
		
		String userid = loginuser.getUserid();

		orders.setUserid(userid);

		List<OrdersVO> orderList = ordersService.orderList(orders);

		model.addAttribute("orderList", orderList);

		return mv;
	}

	// 회원정보를 수정 완료 되었을 때
	@RequestMapping(value = { "", "/" }, method = RequestMethod.POST)
	public ModelAndView myPage(MemberRequest joinRequest, HttpSession session) throws Exception {

		if (joinRequest.isSamePassword() == false) {
			// 수정완료 시 입력한 비번 값이 서로 다르면 팝업으로 알려주고 페이지 다시 보여줌
			mv.setViewName("/myPage/modify1");
			mv.addObject("msg", "비밀번호 확인이 틀렸습니다.");
			mv.addObject("returnUrl", "/myPage/modify");
			return mv;
		}

		if (memberService.modifyMember(joinRequest) == 1) {
			// 수정 완료 시 DB에 정보가 바뀌면서 팝업으로 바꼈다고 알려주고 myPage 메인창으로 이동한다
			MemberVO vo = memberService.userIdCheck(joinRequest.getUserid());
			session.setAttribute("loginuser", vo);
			mv.addObject("msg", "수정이 완료 되었습니다");
			mv.addObject("returnUrl", "/myPage/main");

			mv.setViewName("/myPage/main");

		}

		return mv;
	}

	// myPage 메인창에서 회원정보 수정을 눌렀을 때 다시 한번 더 pw를 물어보는 창으로 이동
	@RequestMapping(value = "/memberModify", method = RequestMethod.GET)
	public ModelAndView memberModify() {
//		mv = new ModelAndView("/myPage/modify");
		mv.setViewName("/myPage/modify");
		return mv;
	}

	// myPage 메인창에서 회원정보 수정을 눌렀을 때 다시 한번 pw를 입력 완료 했을 때
	@RequestMapping(value = "/memberModify", method = RequestMethod.POST)
	public ModelAndView memberModify(@RequestParam String userpw, HttpSession session) throws Exception {
		MemberVO vo = (MemberVO) session.getAttribute("loginuser");

		String encode_pw = LoginUtil.encryptPassword(vo.getUserid(), userpw);

		if (vo.getUserpw().equals(encode_pw)) {
			// 다시 입력한 pw가 로그인한 회원이랑 동일하다면 창 이동
			mv.setViewName("/myPage/modify1");
			mv.addObject("vo", vo);
			mv.addObject("msg", "");
		} else {
			// 다시 입력한 pw가 로그인한 회원이랑 동일하지 않으면 팝업을 띄우고 다시 입력하는 창으로 이동
			mv.setViewName("/myPage/modify");
			mv.addObject("msg", "비밀번호가 일치하지 않습니다.");
		}

		return mv;
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public ModelAndView memberDelete(HttpSession session) {
		MemberVO vo = (MemberVO) session.getAttribute("loginuser");
		mv.addObject("msg", "");
		mv.setViewName("/myPage/delete");
		mv.addObject("vo", vo);
		return mv;
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public ModelAndView memberDelete(@RequestParam String userid, @RequestParam String userpw, HttpSession session)
			throws Exception {

		MemberVO vo = memberService.getMemberById(userid);
		String encode_pw = LoginUtil.encryptPassword(userid, userpw);

		if (vo.getUserpw().equals(encode_pw)) {
			// 다시 입력한 pw가 로그인한 회원이랑 동일하다면 창 이동
			memberService.deleteMember(userid);
			mv.setViewName("/myPage/delete");
			session.removeAttribute("loginuser");
			mv.addObject("msg", "회원 탈퇴가 성공적으로 이루어졌습니다");
			mv.addObject("url", "/");
		} else {
			// 다시 입력한 pw가 로그인한 회원이랑 동일하지 않으면 팝업을 띄우고 다시 입력하는 창으로 이동
			mv.setViewName("/myPage/delete");
			mv.addObject("msg", "비밀번호가 일치하지 않습니다.");
		}

		return mv;

	}

	@RequestMapping("/inquiryList")
	public ModelAndView inquiry(HttpSession session) throws Exception {

		MemberVO vo = (MemberVO) session.getAttribute("loginuser");
		List<ProductVO> productList = new ArrayList<ProductVO>();
		List<InquiryVO> inquiryList = inquiryService.getInquiry(vo.getUserid());

		for (InquiryVO inquiry : inquiryList) {
			if (productList.isEmpty()) {
				productList.add(productService.detailView(inquiry.getProduct_code()));
			} else {
				for (ProductVO product : productList) {
					if (product.getProduct_code() == inquiry.getProduct_code()) {
						break;
					} else {
						productList.add(productService.detailView(inquiry.getProduct_code()));
						break;
					}
				}
			}
		}

		Map<String, String> asdf = new HashMap<String, String>();
		Map<Integer, Integer> num = new HashMap<Integer, Integer>();

		for (ProductVO product : productList) {
			asdf.put("product_code", product.getProduct_code() + "");
			asdf.put("userid", vo.getUserid());

			num.put(product.getProduct_code(), inquiryService.getNum(asdf));
		}

		productList.clear();

		for (int qw : num.keySet()) {
			productList.add(productService.detailView(qw));
		}

		mv.addObject("num", num);
		mv.addObject("productList", productList);
		mv.setViewName("/myPage/inquiryList");

		return mv;
	}

	@RequestMapping("/inquiry")
	public ModelAndView inquiry(@RequestParam("n") int product_code, HttpSession session) {
		mv.setViewName("/myPage/inquiry");
		MemberVO vo = (MemberVO) session.getAttribute("loginuser");
		Map<String, String> map = new HashMap<String, String>();
		map.put("product_code", product_code + "");
		map.put("userid", vo.getUserid());

		List<InquiryVO> inquiryList = inquiryService.getInquiry1(map);

		mv.addObject("inquiryList", inquiryList);

		return mv;
	}

}
