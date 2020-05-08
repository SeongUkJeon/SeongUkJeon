package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.dao.BasketDAO;
import com.itbank.dao.BasketListVO;
import com.itbank.dao.BasketVO;

@Service
public class BasketService { // 장바구니 dao와 연동
	@Autowired private BasketDAO dao;
	
	public void addBasket(BasketVO basket) {
		dao.addBasket(basket);
	}
	
	public List<BasketListVO> basketList(String userid) {
		return dao.basketList(userid);
	}
	
	public void deleteBasket(BasketVO basket) {
		dao.deleteBasket(basket);
	}
	
	public void basketAllDelete(String userid) {
		dao.basketAllDelete(userid);
	}
	
	public int basketGetCountById(String userid) {
		return dao.basketGetCountById(userid);
	}
}