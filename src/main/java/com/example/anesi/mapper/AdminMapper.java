package com.example.anesi.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.anesi.model.Inquiry;
import com.example.anesi.model.Product;
import com.example.anesi.model.Review;
import com.example.anesi.model.Statistics;
import com.example.anesi.model.Used;
import com.example.anesi.model.User;
import com.example.anesi.model.UserOrder;

@Mapper
public interface AdminMapper {
	//상품 리스트
	List<Product> adminProductList(HashMap<String, Object> map);
	//상품&옵션
	List<Product> adminProductInfo(HashMap<String, Object> map);
	//상품 업데이트
	int adminUpdateProduct(HashMap<String, Object> map);
	//옵션 업데이트
	int adminOptionUpdate(HashMap<String, Object> map);
	//옵션 추가
	int adminInsertOption(HashMap<String, Object> map);
	//상품 상태 업데이트
	int adminProductSituation(HashMap<String, Object> map);
	//옵션 삭제
	int adminDeleteOption(HashMap<String, Object> map);
	//주문 검색
	List<UserOrder> selectDeliveryList(HashMap<String, Object> map);
	
	//배송상태 업데이트
	int updateDelivery(HashMap<String, Object> map);
	//배송상태 업데이트2
	int updateNonDelivery(HashMap<String, Object> map);
	//배송 검색
	List<UserOrder> selectSearchList(HashMap<String, Object> map);
	// 문의 내역 조회
	List<Inquiry> selectAdminInquiryList(HashMap<String, Object> map);
	// 답변 등록
	int updateAdminInquiry(HashMap<String, Object> map);
	// 리뷰 검색
	List<Review> selectAdminReviewList(HashMap<String, Object> map);
	// 리뷰 삭제
	int deleteAdminReview(HashMap<String, Object> map);
	// 리뷰 이미지 삭제
	int deleteAdminReviewImg(HashMap<String, Object> map);
	
	
	//고객 리스트검색
	List<User> selectUserList(HashMap<String, Object> map);
	//고객 상세정보검색
	User selectUserInfo(HashMap<String, Object> map);
	//고객상세정보 업데이트
	int updateUser(HashMap<String, Object> map);
	//고객 삭제
	int deleteUser(HashMap<String, Object> map);
	// 고객 로그인 횟수 초기화
	int adminResetUserCnt(HashMap<String, Object> map);
	
	// 알람 목록 불러오기
	List<User> selectAlarmAll(HashMap<String, Object> map);
	// 알람개수
	int alarmCnt(HashMap<String, Object> map);
	// 알람 등록
	int insertAlarm(HashMap<String, Object> map);
	// 알람 삭제
	int deleteAlarm(HashMap<String, Object> map);
	
	//중고 물품 검색
	List<Used> selectUsedList(HashMap<String, Object> map);
	// 토탈 판매금액 + 판매수량, 금일 판매금액 + 판매수량
	Statistics selectStatisticsProduct(HashMap<String, Object> map);
	// 주간 매출
	List<Statistics> selectWeeklySales(HashMap<String, Object> map);
	
	
	//관리자메인 오더리스트
	List<UserOrder> mainOrderList (HashMap<String, Object> map);
	//관리자메인 중고상품리스트
	List<Used> mainUsedList (HashMap<String, Object> map);
	//관리자메인 리뷰리스트
	List<Review> mainReviewList (HashMap<String, Object> map);
	//관리자메인 상품리스트
	List<Product> mainProductDel (HashMap<String, Object> map);
	List<Product> mainProductDis (HashMap<String, Object> map);
	//관리자메인 문의리스트
	List<Inquiry> mainInquiryCnt (HashMap<String, Object> map);
	List<Inquiry> mainInquiryList (HashMap<String, Object> map);
	//관리자메인 상품차트
	List<Statistics> mainChart (HashMap<String, Object> map);
	//관리자메인 만족도 차트
	List<Statistics> mainChartCsat (HashMap<String, Object> map);
	
	//중고주문 리스트
	List<Used> selectUsedDeliveryList(HashMap<String, Object> map);
	//중고주문검색
	List<Used> selectUsedSearch(HashMap<String, Object> map);
	//중고배송상태변경
	int updateUsedDelivery(HashMap<String, Object> map);

}
