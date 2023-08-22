package com.example.anesi.service;

import java.util.HashMap;
import java.util.List;

import com.example.anesi.model.Cart;
import com.example.anesi.model.Category;
import com.example.anesi.model.Product;
import com.example.anesi.model.Scrapbook;



public interface StoreService {
	//상품리스트조회
	HashMap<String, Object> searchProduct (HashMap<String, Object> map);
	//베스트상품리스트조회
	List<Product> bestProduct (HashMap<String, Object> map);
	
	
	List<Category> searchCategoryList();
	//회원 상품 장바구니에 추가
	int addCartUser(HashMap<String, Object> map);
	
	//회원 상품 장바구니 수량증가
	int updateCartCnt(HashMap<String, Object> map);
	
	//회원 상품 스크랩북에 추가
	int addScrapbook (HashMap<String, Object> map);
	
	//회원 상품 스크랩북에 추가
	int removeScrapbook (HashMap<String, Object> map);
	
	//회원 상품 스크랩북 리스트
	List<Scrapbook> searchScrapbookList (HashMap<String, Object> map);
	
	//회원 상품 장바구니 리스트
	List<Cart> userCartList (HashMap<String, Object> map);
	
	// 상품 썸네일 이미지 
	List<Scrapbook> searchThumbnailImg(HashMap<String, Object> map);
	//비회원 장바구니 등록
	int nonUserCartInsert(HashMap<String, Object> map);
	
}
