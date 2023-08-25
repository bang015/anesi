package com.example.anesi.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.anesi.model.Order;
import com.example.anesi.model.Product;
import com.example.anesi.model.Review;

@Mapper
public interface ReviewMapper {
		// 상품 별점 검색
		Product selectCsatAvg(HashMap<String, Object> map);
		// 리뷰
		List<Review>selectReview(HashMap<String, Object> map);
		// 리뷰 페이지 카운트
		int selectCnt(HashMap<String, Object> map);
		// 리뷰 개수 검색
		List<Review>selectReviewCnt(HashMap<String, Object> map);
		// 상품 구매 확인(리뷰)
		List<Order> selectReviewUser(HashMap<String, Object> map);
		// 리뷰 등록
		int insertReview(HashMap<String, Object> map);
		// 리뷰 이미지 등록
		int insertReviewImg(HashMap<String, Object> map);
		// 도움이돼요!
		int updateHelp(HashMap<String, Object> map);
		// 도움이돼요를 누른 유저
		int insertHelp(HashMap<String, Object> map);
		// 도움이돼요 중복체크
		List<Review> selectHelpUser(HashMap<String, Object> map);
		// 도움이돼요 해제
		int updateHelp2(HashMap<String, Object> map);
		// 도움이돼요 유저 삭제
		int deleteHelp(HashMap<String, Object> map);
		// 리뷰 중복 체크
		int selectReviewCheck(HashMap<String, Object> map);
}
