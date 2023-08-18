package com.example.anesi.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.anesi.mapper.InquiryMapper;
import com.example.anesi.model.Inquiry;

@Service
public class InquiryServiceImpl implements InquiryService{
	@Autowired
	InquiryMapper inquiryMapper;
	@Override
	public HashMap<String, Object> searchInqiryList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("inquiryList",inquiryMapper.selectInqiryList(map));
		resultMap.put("cnt", inquiryMapper.selectCnt1(map));
		return resultMap;
	}
	@Override
	public int searchInqiryCnt(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return inquiryMapper.selectInqiryCnt(map);
	}
	@Override
	public int addInquiry(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return inquiryMapper.insertInquiry(map);
	}

}
