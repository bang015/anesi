package com.example.anesi.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.anesi.model.NonUserOrder;
import com.example.anesi.model.Order;
import com.example.anesi.model.ProductOption;
import com.example.anesi.model.UsedOrder;
import com.example.anesi.model.UserAddress;

@Mapper
public interface OrderMapper {
	// 쿠폰 리스트
	List<Order> selectCouponList(HashMap<String, Object> map);
	// 주소 입력
	int insertAddr(HashMap<String, Object> map);
	// 비회원 주소 입력
	int insertNonAddr(HashMap<String, Object> map);
	// 주소 검색
	List<UserAddress> selectAddrList(HashMap<String, Object> map);
	// 주소 한개 검색
	UserAddress selectAddr(HashMap<String, Object> map);
	// 옵션 상세 검색
	ProductOption selectOptionInfo(HashMap<String, Object> map);
	// 주문 입력
	int insertOrder(HashMap<String, Object> map);
	// 비회원 주문 입력
	int insertNonOrder(HashMap<String, Object> map);
	// 쿠폰 업데이트
	int deleteCoupon(HashMap<String, Object> map);
	// 주소 업데이트1
	int updateAddr1(HashMap<String, Object> map);
	// 주소 업데이트2
	int updateAddr2(HashMap<String, Object> map);
	// 오늘 주문량 검색
	int selectOrderCnt(HashMap<String, Object> map);
	// 오늘 비회원 주문량 검색
	int selectNonOrderCnt(HashMap<String, Object> map);
	// 재고 업데이트
	int updateOptionStock(HashMap<String, Object> map);
	// 비회원 주문 조회 확인
	int selectNonUserOrderCheck(HashMap<String, Object> map);
	// 비회원 주문 조회
	List<NonUserOrder> selectNonUserOrder(HashMap<String, Object> map);
	// 비회원 주문 수정
	int updateNonUserOrder(HashMap<String, Object> map);
	// 비회원 주소 수정
	int updateNonUserOrderAddr(HashMap<String, Object> map);
	// 중고 상품 정보
	UsedOrder selectUsedOrder(HashMap<String, Object> map);
	// 중고 상품 결제
	int insertUsedOrder(HashMap<String, Object> map);
	// 주소 제거
	int deleteAddress(HashMap<String, Object> map);
}
