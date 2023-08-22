package com.example.anesi.service;

import java.util.HashMap;
import java.util.List;

import com.example.anesi.model.Inquiry;
import com.example.anesi.model.Product;
import com.example.anesi.model.Review;
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
	int editAdminInquiry(HashMap<String, Object> map);
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

}

