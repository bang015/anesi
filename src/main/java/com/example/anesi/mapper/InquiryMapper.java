package com.example.anesi.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.anesi.model.Inquiry;

@Mapper
public interface InquiryMapper {
	// 문의 리스트
	List<Inquiry> selectInqiryList(HashMap<String, Object> map);
	// 문의 개수
	int selectInqiryCnt(HashMap<String, Object> map);
}
