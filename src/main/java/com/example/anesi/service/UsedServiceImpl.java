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
	
	//중고매입문의리스트
	@Override
	public HashMap<String, Object> purchaseList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", usedMapper.purchaseList(map));
		resultMap.put("cnt", usedMapper.selectPurchaseCnt(map));
		return resultMap;
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
	
	// 중고 문의 게시글 뷰 사진 포함
	@Override
	public List<UsedPurchase> usedInquireView(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return usedMapper.usedInquireView(map);
	}
	
	//문의글 뷰
	@Override
	public UsedPurchase usedInquireView1(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return usedMapper.usedInquireView1(map);
	}
	
	//문의글 뷰 사진
	@Override
	public List<UsedPurchase> usedInquireViewImg(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return usedMapper.usedInquireViewImg(map);
	}
	

	// 답변등록
	@Override public int answerInsert(HashMap<String, Object> map) { 
		// TODO Auto-generated method stub
		return usedMapper.answerInsert(map);
	}
	
	// 답변여부
	@Override
	public int answerUpdate(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return usedMapper.answerUpdate(map);
	}

	// 답변정보
	@Override
	public UsedPurchase answerSelect(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return usedMapper.answerSelect(map);
	}

	@Override
	public int usedInquireDelete(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return usedMapper.usedInquireDelete(map);
	}

	@Override
	public int usedInquireImgDelete(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return usedMapper.usedInquireImgDelete(map);
	}

	@Override
	public int usedInquireAnsDelete(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return usedMapper.usedInquireAnsDelete(map);
	}

	@Override
	public int answerEdit(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return usedMapper.answerEdit(map);
	}

	//내 중고 게시글 
	@Override
	public List<UsedPurchase> myPurchaseList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return usedMapper.myPurchaseList(map);
	}

	@Override
	public List<UsedPurchase> purchaseYList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return usedMapper.purchaseYList(map);
	}

	@Override
	public int updatePurchaseInquire(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return usedMapper.updatePurchaseInquire(map);
	}

	
}
