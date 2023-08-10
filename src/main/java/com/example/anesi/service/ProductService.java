package com.example.anesi.service;

import java.util.HashMap;
import java.util.List;

import com.example.anesi.model.Category;
import com.example.anesi.model.Product;

public interface ProductService {
	//카테고리 대분류 검색
	List<Category> searchCategoryList();
	static List<Product> selectCartProductList() {
		// TODO Auto-generated method stub
		return null;
	}
	List<Product> selectCartProductList(HashMap<String, Object> map);
	
	//카테고리 소분류 검색
	List<Category> searchCategoryList2(HashMap<String, Object> map);
	
	// 상품 상세 정보 검색
	Product searchProductList(HashMap<String, Object> map);
}
