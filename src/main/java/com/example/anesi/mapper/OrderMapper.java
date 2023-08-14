package com.example.anesi.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.anesi.model.Order;

@Mapper
public interface OrderMapper {
	// 쿠폰 리스트
	List<Order> selectCouponList(HashMap<String, Object> map);
	// 주소 입력
	int insertAddr(HashMap<String, Object> map);
	// 주소 검색
	List<Order> selectAddrList(HashMap<String, Object> map);
}
