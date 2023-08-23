package com.example.anesi.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.anesi.mapper.UsedMapper;
import com.example.anesi.model.UsedPurchase;


@Service
public class UsedServiceImpl implements UsedService{

	@Autowired
	UsedMapper usedMapper;

	@Override
	public List<UsedPurchase> purchaseList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return usedMapper.purchaseList(map);
	}
	
	// 중고 문의 등록
	@Override
	public HashMap<String, Object> insertUsedInquire(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int usedPNo = usedMapper.insertUsedInquire(map);
		System.out.println(map.get("usedPNo"));
		resultMap.put("usedPNo", map.get("usedPNo"));
		return resultMap;
	}

	// 중고 문의 이미지 등록
	@Override
	public int insertUsedInquireImg(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return usedMapper.insertUsedInquireImg(map);
	}
	
	// 중고 문의 게시글 뷰
	@Override
	public List<UsedPurchase> usedInquireView(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return usedMapper.usedInquireView(map);
	}
	
}
