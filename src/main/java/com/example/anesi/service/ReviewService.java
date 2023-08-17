package com.example.anesi.service;

import java.util.HashMap;
import java.util.List;

import com.example.anesi.model.Order;
import com.example.anesi.model.Product;

public interface ReviewService {
		// 상품 별점 검색
		Product searchCsatAvg(HashMap<String, Object> map);
		// 리뷰
		HashMap<String, Object>searchReview(HashMap<String, Object> map);
		// 리뷰 별점 개수
		HashMap<String, Object>searchReviewCnt(HashMap<String, Object> map);
		// 상품 구매 확인(리뷰)
		List<Order> searchReviewUser(HashMap<String, Object> map);
		// 리뷰 등록
		HashMap<String, Object> addReview(HashMap<String, Object> map);
		// 리뷰 이미지 등록
		int addReviewImg(HashMap<String, Object> map);
}
