package com.example.anesi.service;

import java.util.HashMap;
import java.util.List;

import com.example.anesi.model.Category;
import com.example.anesi.model.Order;
import com.example.anesi.model.Product;
import com.example.anesi.model.Review;
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
	// 리뷰
	HashMap<String, Object>searchReview(HashMap<String, Object> map);
	// 리뷰 별점 개수
	HashMap<String, Object>searchReviewCnt(HashMap<String, Object> map);
	// 상품 구매 확인(리뷰)
	List<Order> searchReviewUser(HashMap<String, Object> map);
	//상품 장바구니
	List<Product>selectCartList(HashMap<String, Object> map);
	// 상품등록
	int addProduct(HashMap<String, Object> map);
	// 상품등록후 검색
	Product insertSearchProduct(HashMap<String, Object> map);
	
	// 옵션등록
	int addOption(HashMap<String, Object> map);
	// 회원 장바구니 삭제
	int deleteCartlist (HashMap<String, Object> map);
	
	List<Product> searchBarProductList (HashMap<String, Object> map);
	
	
}

