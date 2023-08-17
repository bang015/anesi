package com.example.anesi.service;

import java.util.HashMap;
import java.util.List;

import com.example.anesi.model.Inquiry;

public interface InquiryService {
	// 문의 리스트
	List<Inquiry> searchInqiryList(HashMap<String, Object> map);
	// 문의 개수
	int searchInqiryCnt(HashMap<String, Object> map);
}
