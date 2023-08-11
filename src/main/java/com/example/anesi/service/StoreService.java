package com.example.anesi.service;

import java.util.HashMap;
import java.util.List;

import com.example.anesi.model.Category;
import com.example.anesi.model.Product;



public interface StoreService {
	
	List<Product> searchProduct (HashMap<String, Object> map);
	List<Category> searchCategoryList();
	//회원 상품 장바구니에 추가
	int searchAddCartUser(HashMap<String, Object> map);

	
}
