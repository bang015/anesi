package com.example.anesi.service;

import java.util.HashMap;
import java.util.List;

import com.example.anesi.model.Order;
import com.example.anesi.model.ProductOption;
import com.example.anesi.model.UserAddress;

public interface OrderService {
	//쿠폰 리스트
	List<Order> searchCouponListt(HashMap<String, Object> map);
	//주소 입력
	int addAddr(HashMap<String, Object> map);
	//주소 검색
	List<UserAddress> searchAddrList(HashMap<String, Object> map);
	// 입력 주소 검색
	UserAddress searchAddr(HashMap<String, Object> map);
	// 옵션 상세 검색
	ProductOption searchOptionInfo(HashMap<String, Object> map);
	//주문 입력
	int addOrder(HashMap<String, Object> map);
	//쿠폰 삭제
	int removeCoupon(HashMap<String, Object> map);
	//주소 업데이트
	int editAddr(HashMap<String, Object> map);
	// 당일 주문량 검색
	int searchOrderCnt(HashMap<String, Object> map);
}
