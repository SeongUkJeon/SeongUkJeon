package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.dao.OrderDetailVO;
import com.itbank.dao.OrderListVO;
import com.itbank.dao.OrdersDAO;
import com.itbank.dao.OrdersVO;

@Service
public class OrdersService { // 주문 dao 연동
	@Autowired private OrdersDAO dao;
	
	public void orderInfo(OrdersVO orders) {
		dao.orderInfo(orders);
	}
	
	public void orderInfo_Detail(OrderDetailVO orderDetail) {
		dao.orderInfo_Detail(orderDetail);
	}
	
	public List<OrdersVO> orderList(OrdersVO orders) {
		return dao.orderList(orders);
	}
	
	public List<OrdersVO> allOrderList() {
		return dao.allOrderList();
	}

	public List<OrdersVO> deliveryTypeOrderList(String delivery) {
		return dao.deliveryTypeOrderList(delivery);
	}
	
	public void delivery(OrdersVO orders) {
		dao.delivery(orders);
	}

	public List<OrderListVO> orderViewFromUserid(String userid) {
		return dao.orderViewFromUserid(userid);
	}
	
	public List<OrderListVO> orderViewFromOrderid(String orderid) {
		return dao.orderViewFromOrderid(orderid);
	}

	public void orderInfo_Detail2(OrderDetailVO orderDetail) {
		dao.orderInfo_Detail2(orderDetail);
	}
	
	public void deleteOrder(String orderid) {
		dao.deleteOrder(orderid);
	}
	
	public int getDeliveryTypeCnt(String delivery) {
		return dao.getDeliveryTypeCnt(delivery);
	}
}