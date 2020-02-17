package com.itbank.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAO {
	@Autowired
	private SqlSessionTemplate template;

	public void productInsert(Map<String, Object> map) { // 상품 등록
		template.insert("productInsert", map);
	}

	public ProductVO detailView(int product_code) { // 상품 번호로 상품 하나 불러 옴
		return template.selectOne("detailView", product_code);
	}

	public List<ProductVO> selectList(Map<String, String> category) { // 카테고리1, 카테고리2로 상품 목록 불러 옴
		return template.selectList("list", category);
	}

	public List<ProductVO> selectNewList() { // 가장 최근에 등록된 상품 3개를 불러 옴
		return template.selectList("newList");
	}

	public void productModify(Map<String, Object> map) { // 상품 수정 시 업데이트
		template.update("productModify", map);
	}

	public void productDelete(int product_code) { // 상품 삭제 시 db는 유지하고 product_delete 업데이트
		template.update("productDelete", product_code);
	}

	public void changeQuantity(ProductVO product) { // 상품 수량 수정
		template.update("changeQuantity", product);
	}

	// 등록된 상품 중 검색에 해당하는 상품들의 개수
	public int getCountProduct(Map<String, String> map) {
		return template.selectOne("getCountProduct", map);
	}

	// 등록된 모든 상품들의 개수
	public int getCountProduct() {
		return template.selectOne("getCountProduct1");
	}

	// 검색 키워드로 상품 목록 불러 옴
	public List<ProductVO> selectProduct(Map<String, String> map) {
		return template.selectList("selectProduct", map);
	}

	// 페이징 당 출력 개수만큼 상품 목록 불러 옴
	public List<ProductVO> selectProduct1(Map<String, String> map) {
		return template.selectList("selectProduct1", map);
	}

	public void decQuantity(Map<Integer, Integer> map) {
		template.update("decQuantity", map);
	}
}