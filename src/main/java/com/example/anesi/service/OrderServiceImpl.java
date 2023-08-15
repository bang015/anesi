package com.example.anesi.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.anesi.mapper.OrderMapper;
import com.example.anesi.model.Order;
import com.example.anesi.model.ProductOption;
import com.example.anesi.model.UserAddress;

@Service
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	OrderMapper orderMapper;
	
	//쿠폰 리스트
	@Override
	public List<Order> searchCouponListt(HashMap<String, Object> map) {
		return orderMapper.selectCouponList(map);
	}
	// 주소 입력
	@Override
	public int addAddr(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return orderMapper.insertAddr(map);
	}
	// 주소 검색
	@Override
	public List<UserAddress> searchAddrList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return orderMapper.selectAddrList(map);
	}
	// 입력 주소 검색
	@Override
	public UserAddress searchAddr(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return orderMapper.selectAddr(map);
	}
	@Override
	public ProductOption searchOptionInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return orderMapper.selectOptionInfo(map);
	}
	//주문 입력
	@Override
	public int addOrder(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return orderMapper.insertOrder(map);
	}
	@Override
	public int removeCoupon(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return orderMapper.deleteCoupon(map);
	}
	@Override
	public int editAddr(HashMap<String, Object> map) {
		orderMapper.updateAddr1(map);
		orderMapper.updateAddr2(map);
		return 1;
	}
	// 당일 주문량 조회
	@Override
	public int searchOrderCnt(HashMap<String, Object> map) {
		return orderMapper.selectOrderCnt(map);
	}
	
	
	
	
}
