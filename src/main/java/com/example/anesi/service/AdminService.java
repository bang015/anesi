package com.example.anesi.service;

import java.util.HashMap;
import java.util.List;

import com.example.anesi.model.Inquiry;
import com.example.anesi.model.Product;
import com.example.anesi.model.Review;
import com.example.anesi.model.Statistics;
import com.example.anesi.model.Used;
import com.example.anesi.model.User;
import com.example.anesi.model.UserOrder;

public interface AdminService {

	// 상품 검색
	List<Product> adminProductList(HashMap<String, Object> map);
	//상품 상세 검색
	List<Product> adminProductInfo(HashMap<String, Object> map);
	// 상품 업데이트
	int adminEditProduct(HashMap<String, Object> map);
	// 옵션 업데이트
	int adminEditOption(HashMap<String, Object> map);
	// 옵션 추가
	int adminAddOption(HashMap<String, Object> map);
	// 상품 상태 업데이트
	int adminEditProductSituation(HashMap<String, Object> map);
	//옵션 삭제
	int adminRemoveOption(HashMap<String, Object> map);
	// 주문 정보 검색
	List<UserOrder> selectDeliveryList(HashMap<String, Object> map);
	// 배송상태 변경
	int editDelivery(HashMap<String, Object> map);
	// 배송 검색 구현
	List<UserOrder> searchSearchList(HashMap<String, Object> map);
	// 문의 리스트 검색
	List<Inquiry> searchAdminInquiriesList(HashMap<String, Object> map);
	//문의 답변
	HashMap<String, Object> editAdminInquiry(HashMap<String, Object> map);
	//리뷰 검색
	List<Review> searchAdminReviewList(HashMap<String, Object> map);
	//리뷰 삭제
	int removeAdminReview(HashMap<String, Object> map);
	
	//고객리스트 검색
	List<User> searchUserList(HashMap<String, Object> map);
	//고객상세정보 검색
	User searchUserInfo(HashMap<String, Object> map);
	//고객상세정보 업데이트
	int editUser(HashMap<String, Object> map);
	//고객상세정보 업데이트
	int removeUser(HashMap<String, Object> map);
	// 고객 로그인 횟수 초기화
	int adminResetUserCnt(HashMap<String, Object> map);
	
	
	//알림 정보 검색
	List<User> searchAlarmAll(HashMap<String, Object> map);
	// 알람 등록
	int addAlarm(HashMap<String, Object> map);
	// 알람 삭제
	int removeAlarm(HashMap<String, Object> map);

	// 중고 물품 검색
	List<Used> searchUsedList(HashMap<String, Object> map);
	// 토탈 판매금액 + 판매수량, 금일 판매금액 + 판매수량
	Statistics searchStatisticsProduct(HashMap<String, Object> map);
	// 주간 매출
	List<Statistics> searchWeeklySales(HashMap<String, Object> map);
	
	//관리자페이지메인
	HashMap<String, Object> adminMain(HashMap<String, Object> map);
	//관리자페이지메인의 문의리스트
	List<Inquiry> adminMainInquiry(HashMap<String, Object> map);
	//관리자페이지메인의 리뷰
	List<Review> adminMainReview(HashMap<String, Object> map);
}

