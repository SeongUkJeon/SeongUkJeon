package com.itbank.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.common.Pagination;
import com.itbank.dao.AnswerVO;
import com.itbank.dao.InquiryVO;
import com.itbank.dao.OrderListVO;
import com.itbank.dao.OrdersVO;
import com.itbank.dao.ProductRequest;
import com.itbank.dao.ProductVO;
import com.itbank.service.InquiryService;
import com.itbank.service.MemberService;
import com.itbank.service.OrdersService;
import com.itbank.service.ProductService;

@Controller
@RequestMapping("/admin")
// 관리자가 로그인 했을 때 사용되는 컨트롤러
public class AdminController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private ProductService productService;
	@Autowired
	private OrdersService ordersService;
	@Autowired
	private InquiryService inquiryService;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Model model) { // 관리자 메인 페이지 각 카테고리 별 개수 출력
		int productInquiry = inquiryService.getCategoryTypeCnt("상품");
		int exchangeInquiry = inquiryService.getCategoryTypeCnt("교환");
		int refundInquiry = inquiryService.getCategoryTypeCnt("환불");
		int returnInquiry = inquiryService.getCategoryTypeCnt("반품");
		
		int readyShipCnt = ordersService.getDeliveryTypeCnt("배송준비");
		int shippingCnt = ordersService.getDeliveryTypeCnt("배송중");
		int deliComplCnt = ordersService.getDeliveryTypeCnt("배송완료");
		
		model.addAttribute("productCnt", productInquiry);
		model.addAttribute("exchangeCnt", exchangeInquiry);
		model.addAttribute("refundCnt", refundInquiry);
		model.addAttribute("returnCnt", returnInquiry);			
		model.addAttribute("readyShipCnt", readyShipCnt);
		model.addAttribute("shippingCnt", shippingCnt);			
		model.addAttribute("deliComplCnt", deliComplCnt);			
		
		return "/admin/main";
	}
	
	// 관리자 메인 페이지에서 문의 목록 눌렀을 때
	@RequestMapping(value = "/inquiryList", method = RequestMethod.GET)
	public ModelAndView inquiryList(@RequestParam(value="category", required=false) String category, @RequestParam(value="type", required=false) String type) {
		ModelAndView mv = new ModelAndView("/admin/inquiryList");
		List<InquiryVO> list = null;
		try { // 전체 목록 눌렀을때, 카테고리 별 목록 눌렀을때 구분
			if(category.equals("전체") && type.equals("전체")) list = inquiryService.allInquiryList();
			else if(category.equals("전체") == false && type.equals("전체")) list = inquiryService.inquiryListByCategory(category);
			else if(category.equals("전체") && type.equals("답변대기")) list = inquiryService.getNoAnswerList();
			else if(category.equals("전체") == false && type.equals("답변대기")) list = inquiryService.getNoAnswerList(category);
		} catch(NullPointerException e) {
			category = "전체";
			list = inquiryService.allInquiryList();
		}

		mv.addObject("inquiryList", list);
		mv.addObject("category", category);

		return mv;
	}

	// 상품문의 페이지에서 삭제버튼 클릭 시
	@RequestMapping(value = "/inquiryList", method = RequestMethod.POST)
	public String inquiryList(int inquirynum, Model model) {
		inquiryService.deleteInquiry(inquirynum);
		
		model.addAttribute("category", "전체");

		return "redirect:/admin/inquiryList";
	}

	// 질문 리스트 중 하나를 선택했을 때
	@RequestMapping(value = "/inquiry", method = RequestMethod.GET)
	public ModelAndView inquiry(@RequestParam Map<String, Object> map) {
		ModelAndView mv = new ModelAndView("/admin/inquiry");

		mv.addObject("inquiry", inquiryService.getNoAnswer(map));

		return mv;
	}

	// 질문에 대한 답글을 달았을때
	@RequestMapping(value = "/inquiry", method = RequestMethod.POST)
	public ModelAndView inquiry(AnswerVO answer) {
		ModelAndView mv = new ModelAndView("redirect:/admin/inquiryList");

		inquiryService.setAnswer(answer);

		return mv;
	}

	// 관리자가 볼 수 있는 회원 목록
	@RequestMapping("/memberList")
	public ModelAndView memberList(@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "type", required = false) String type,
			@RequestParam(value = "search", required = false) String search) {

		ModelAndView mv = new ModelAndView("/admin/memberList");
		if (nowPage == null || nowPage.equals("0")) {
			// 처음 들어올때는 빈 값이니 1로 지정
			nowPage = "1";
		}

		mv.addObject("type", type);
		mv.addObject("search", search);

		// 만약 검색을 했다면 검색을 한 total이 나올것이고 아니라면 관리자를 제외한 모든 회원 목록을 가져 옴
		int total = memberService.getCountMember(type, search);

		// 페이징 관련 vo, 생성자 초기화 동작
		Pagination vo = new Pagination(Integer.parseInt(nowPage), total);

		// view 페이지에서 사용될 pagination을 보냄
		mv.addObject("paging", vo);
		mv.addObject("list", "memberList");

		// 검색결과에 맞는 memberList를 만들어서 보냄(검색이 아니라면 모든 목록을 memberList로 만들어서 보냄)
		mv.addObject("memberList", memberService.selectMember(vo.getStart(), vo.getEnd(), type, search));

		return mv;
	}

	// 관리자가 볼 수 있는 상품목록
	@RequestMapping("/productList")
	public ModelAndView productList(@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "type", required = false) String type,
			@RequestParam(value = "search", required = false) String search) {

		ModelAndView mv = new ModelAndView("/admin/productList");
		if (nowPage == null || nowPage.equals("0")) {
			nowPage = "1";
			// 처음 들어올때는 빈 값이니까 1이라고 지정해둔다
		}

		mv.addObject("type", type);
		mv.addObject("search", search);

		int total = productService.getCountProduct(type, search);
		// 만약 검색을 했다면 검색을 한 total이 나올것이고 아니라면 모든 상품 목록을 가져온다

		Pagination vo = new Pagination(Integer.parseInt(nowPage), total);
		// 페이징 관련

		mv.addObject("paging", vo);
		// view 페이지에서 사용될 pagination을 보낸다
		mv.addObject("list", "productList");

		mv.addObject("productList", productService.selectProduct(vo.getStart(), vo.getEnd(), type, search));
		// 검색결과에 맞는 productList를 만들어서 보낸다 (단, 검색이 아니라면 모든 제품을 productList로 만들어서 보낸다)

		return mv;
	}

	// aside에 있는 a태그 클릭 시
	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public ModelAndView productInsert() {
		ModelAndView mv = new ModelAndView("/admin/upload");
		return mv;
	}

	// 데이터 입력후 submit 시
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public ModelAndView productInsert(MultipartHttpServletRequest mpRequest, ProductRequest pr) throws Exception {
		ModelAndView mv = new ModelAndView("/admin/main");
		Map<String, MultipartFile> map = mpRequest.getFileMap();

		productService.productInsert(map, pr);

		return mv;
	}

	// 상품 목록에서 상품 이름이나 이미지 클릭 시
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void getProductView(@RequestParam("n") int product_code, Model model) {
		ProductVO product = productService.detailView(product_code);

		model.addAttribute("product", product);
	}

	// view페이지에서 수정 클릭 시
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public ModelAndView modify(@RequestParam("n") int product_code, Model model) {
		ModelAndView mv = new ModelAndView("/admin/modify");
		mv.addObject("product", productService.detailView(product_code));

		return mv;
	}

	// 수정 페이지에서 데이터 입력 후 submit 시
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public ModelAndView modify(MultipartHttpServletRequest mpRequest, ProductRequest pr) throws Exception {
		ModelAndView mv = new ModelAndView("/admin/productList");
		Map<String, MultipartFile> map = mpRequest.getFileMap();

		MultipartFile mpFile = mpRequest.getFile("product_image1");
		if (mpFile.isEmpty() == false)
			productService.productModify(map, pr);

		return mv;
	}

	// view 페이지에서 삭제 클릭 시
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String productDelete(@RequestParam("n") int product_code) {
		productService.productDelete(product_code);

		return "/admin/productList";
	}

	// 주문 목록
	@RequestMapping(value = "/orderList", method = RequestMethod.GET)
	public String getOrderList(Model model, @RequestParam(value="type", required=false)String type) {
		try {			
			if(type.equals("") == false) {
				List<OrdersVO> deliveryTypeOrderList = ordersService.deliveryTypeOrderList(type);
				model.addAttribute("orderList", deliveryTypeOrderList);
			}
		} catch(NullPointerException e) {
			List<OrdersVO> allOrderList = ordersService.allOrderList();
			model.addAttribute("orderList", allOrderList);
		}

		return "/admin/shop/orderList";
	}

	// 주문 상세 목록
	@RequestMapping(value = "/orderView", method = RequestMethod.GET)
	public String getOrderList(@RequestParam("n") String id, Model model) {
		List<OrderListVO> orderView = null;
		
		char[] a = id.toCharArray();
		
		for(char b : a) {
			if(b == '@') {
				orderView = ordersService.orderViewFromUserid(id);
				model.addAttribute("id", "userid");
			}
			if(b == '_') {
				orderView = ordersService.orderViewFromOrderid(id);
				model.addAttribute("id", "orderid");
			}
		}
		
		model.addAttribute("orderView", orderView);
		
		return "/admin/shop/orderView";
	}

	// 주문 상세 목록 - 상태 변경
	@RequestMapping(value = "/orderView", method = RequestMethod.POST)
	public String delivery(OrdersVO orders) {
		ordersService.delivery(orders);

		List<OrderListVO> orderView = ordersService.orderViewFromOrderid(orders.getOrderid());

		ProductVO product = new ProductVO();

		for (OrderListVO i : orderView) {
			product.setProductcode(i.getProduct_code());
			product.setProductquantity(i.getBasketstock());
			productService.changeQuantity(product);
		}
		return "redirect:/admin/orderView?n=" + orders.getOrderid();
	}
}