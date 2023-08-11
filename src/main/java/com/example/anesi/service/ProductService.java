package com.example.anesi.service;

import java.util.HashMap;
import java.util.List;

import com.example.anesi.model.Category;
import com.example.anesi.model.Product;
import com.example.anesi.model.Scrapbook;

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
	// 상품 별점 검색
	Product searchCsatAvg(HashMap<String, Object> map);
	// 상품 옵션 검색
	List<Product> searchOption(HashMap<String, Object> map);
	// 상품 썸네일 이미지 
	List<Scrapbook> searchThumbnailImg(HashMap<String, Object> map);
	// 상품 콘텐츠 이미지 
	List<Scrapbook>searchProductImg(HashMap<String, Object> map);
	//상품 검색창 
	List<Product> searchProduct(HashMap<String, Object> map);
	// 상품 상세 이미지
	List<Scrapbook>searchcontentImg2(HashMap<String, Object> map);
}
