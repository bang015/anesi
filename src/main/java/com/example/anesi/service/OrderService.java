package com.example.anesi.service;

import java.util.HashMap;
import java.util.List;

import com.example.anesi.model.Order;

public interface OrderService {
	//쿠폰 리스트
	List<Order> searchCouponListt(HashMap<String, Object> map);
	//주소 입력
	int addAddr(HashMap<String, Object> map);
	//주소 검색
	List<Order> searchAddrList(HashMap<String, Object> map);
}
