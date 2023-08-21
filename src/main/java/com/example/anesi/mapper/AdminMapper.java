package com.example.anesi.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.anesi.model.Inquiry;
import com.example.anesi.model.Product;
import com.example.anesi.model.Review;
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
	//고객 리스트검색
	List<User> selectUserList(HashMap<String, Object> map);
	//고객 상세정보검색
	List<User> selectUserInfo(HashMap<String, Object> map);

}
