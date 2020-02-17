package com.itbank.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.itbank.dao.ProductDAO;
import com.itbank.dao.ProductRequest;
import com.itbank.dao.ProductVO;

@Service
public class ProductService { // 상품 dao 연동
	@Autowired
	private ProductDAO dao;
	private static final String filePath = "/images/";

	public void productInsert(Map<String, MultipartFile> map, ProductRequest pr) { //상품 등록
		Map<String, Object> map1 = new HashMap<String, Object>(); // 상품 데이터 map에 저장
		map1.put("product_code", pr.getProduct_code());
		map1.put("product_desc", pr.getProduct_desc());
		map1.put("product_detail2", pr.getProduct_detail2());
		map1.put("product_detail1", pr.getProduct_detail1());
		map1.put("product_name", pr.getProduct_name());
		map1.put("product_price", pr.getProduct_price());
		map1.put("product_quantity", pr.getProduct_quantity());

		try {
			for (String key : map.keySet()) {
				File file = new File(filePath + pr.getProduct_detail1() + "/" + pr.getProduct_detail2() + "/"
						+ map.get(key).getOriginalFilename()); // 카테고리로 폴더 구분
				if (map.get(key).getOriginalFilename().equals("") == false)
					map.get(key).transferTo(file);
				map1.put(key, map.get(key).getOriginalFilename());
			}
			dao.productInsert(map1);
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}

	public ProductVO detailView(int product_code) {
		return dao.detailView(product_code);
	}

	// 2차 분류로 상품 분류
	public List<ProductVO> getList(Map<String, String> category) {
		return dao.selectList(category);
	}

	public List<ProductVO> getNewList() {
		return dao.selectNewList();
	}

	public void productModify(Map<String, MultipartFile> map, ProductRequest pr) {
		Map<String, Object> map1 = new HashMap<String, Object>(); // 수정 할 데이터 map에 저장
		map1.put("product_code", pr.getProduct_code());
		map1.put("product_desc", pr.getProduct_desc());
		map1.put("product_detail2", pr.getProduct_detail2());
		map1.put("product_detail1", pr.getProduct_detail1());
		map1.put("product_name", pr.getProduct_name());
		map1.put("product_price", pr.getProduct_price());
		map1.put("product_quantity", pr.getProduct_quantity());

		try {
			for (String key : map.keySet()) {
				File file = new File(filePath + pr.getProduct_detail1() + "/" + pr.getProduct_detail2() + "/"
						+ map.get(key).getOriginalFilename()); // 카테고리로 폴더 구분
				if (map.get(key).getOriginalFilename().equals("") == false)
					map.get(key).transferTo(file);
				map1.put(key, map.get(key).getOriginalFilename());
			}
			dao.productModify(map1);
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}

	public void productDelete(int product_code) {
		dao.productDelete(product_code);
	}

	public void changeQuantity(ProductVO product) {
		dao.changeQuantity(product);
	}

//	등록된 상품의 갯수 받아오기
	public int getCountProduct(String type, String search) {
		Map<String, String> map = new HashMap<String, String>();

		if (type == null || type.equals("")) {
			return dao.getCountProduct();
//			등록된 모든 상품의 수
		} else {
			map.put("type", type);
			map.put("search", search);
//			검색에 해당된 상품의 수
		}
		return dao.getCountProduct(map);
	}

//	등록된 상품 vo로 만들어서 list로 만듦
	public List<ProductVO> selectProduct(int start, int end, String type, String search) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("start", start + "");
		map.put("end", end + "");
//		페이지당 해당하는 시작 점 과 끝 점 입력

		if (type == null || type.equals("")) {
			return dao.selectProduct1(map);
//			검색을 하지 않은 상태(즉, 모든 상품들을 vo로 만들어서 list로 만듦)
		} else {
			map.put("type", type);
			map.put("search", search);
//			검색에 해당하는 상품들을 vo로 만들어서 list로 만듦
		}
		return dao.selectProduct(map);
	}

	public void decQuantity(int product_code, int cnt) {
		Map<Integer, Integer> map = new HashMap<Integer, Integer>();
		map.put(cnt, cnt);
		map.put(product_code, product_code);
		dao.decQuantity(map);
	}
}