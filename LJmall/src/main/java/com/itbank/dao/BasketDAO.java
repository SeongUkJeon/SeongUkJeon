package com.itbank.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BasketDAO { // 장바구니 관련 필요한 DB연동
	@Autowired private SqlSessionTemplate template;
	
	public void addBasket(BasketVO basket) { // 장바구니 추가
		template.insert("addBasket", basket);
	}
	
	public List<BasketListVO> basketList(String userid) { // 장바구니 목록 불러 옴
		return template.selectList("basketList", userid);
	}
	
	public void deleteBasket(BasketVO basket) { // 장바구니 개별 삭제
		template.delete("deleteBasket", basket);
	}
	
	public void basketAllDelete(String userid) { // 장바구니 전체 삭제
		template.delete("basketAllDelete", userid);
	}

	public int basketGetCountById(String userid) { // 가입된 ID당 장바구니 개수
		return template.selectOne("basketGetCountById", userid);
	}
}