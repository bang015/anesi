package com.example.anesi.service;

import java.util.HashMap;
import java.util.List;

import com.example.anesi.model.Order;
import com.example.anesi.model.Product;
import com.example.anesi.model.Review;

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
		// 도움이돼요!
		HashMap<String, Object> editHelp(HashMap<String, Object> map);
		// 도움이돼요 중복체크
		List<Review> searchHelpUser(HashMap<String, Object> map);
		// 도움이 돼요 해제/삭제
		int editHelp2(HashMap<String, Object> map);
}
