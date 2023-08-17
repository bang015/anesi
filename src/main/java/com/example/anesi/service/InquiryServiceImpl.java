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
	public List<Inquiry> searchInqiryList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return inquiryMapper.selectInqiryList(map);
	}
	@Override
	public int searchInqiryCnt(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return inquiryMapper.selectInqiryCnt(map);
	}

}
