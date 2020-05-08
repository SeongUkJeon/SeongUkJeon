package com.itbank.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrdersDAO { // 주문 관련 DB 연동
	@Autowired private SqlSessionTemplate template;
	
	public void orderInfo(OrdersVO orders) { // 주문 정보 입력
		template.insert("orderInfo", orders);
	}

	public void orderInfo_Detail(OrderDetailVO orderDetail) { // 장바구니 구매 시 주문 상세 입력
		template.insert("orderInfo_Detail", orderDetail);
	}
	
	public List<OrdersVO> orderList(OrdersVO orders) { // userid별 주문 목록
		return template.selectList("orderList", orders);
	}
	
	public List<OrdersVO> allOrderList() { // 모든 주문 목록
		return template.selectList("allOrderList");
	}
	
	public List<OrdersVO> deliveryTypeOrderList(String delivery) { // 배송 상태 별 주문 목록
		return template.selectList("deliveryTypeOrderList", delivery);
	}
	
	public void delivery(OrdersVO orders) { // 배송 상태 업데이트
		template.update("delivery", orders);
	}

	public List<OrderListVO> orderViewFromUserid(String userid) { // userid별 주문 목록
		return template.selectList("orderViewFromUserid", userid);
	}
	
	public List<OrderListVO> orderViewFromOrderid(String Orderid) { // orderid별 주문 목록
		return template.selectList("orderViewFromOrderid", Orderid);
	}

	public void orderInfo_Detail2(OrderDetailVO orderDetail) { // 즉시 구매 시 주문 상세 입력
		template.insert("orderInfo_Detail2", orderDetail);
	}
	
	public void deleteOrder(String orderid) { // orderid로 주문 내역과 주문 상세 삭제
		template.delete("deleteOrder", orderid);
		template.delete("deleteOrderDetail", orderid);
	}
	
	public int getDeliveryTypeCnt(String delivery) { // 배송 상태 별 row 개수 불러 옴
		return template.selectOne("getDeliveryTypeCnt", delivery);
	}
}
