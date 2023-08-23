package com.example.anesi.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.anesi.model.UsedPurchase;

@Mapper
public interface UsedMapper {
	//매입게시판 리스트
	List<UsedPurchase> purchaseList(HashMap<String, Object> map);
	//중고 문의 등록
	int insertUsedInquire(HashMap<String, Object> map);
	//중고 문의 사진 등록
	int insertUsedInquireImg(HashMap<String, Object> map);
	//문의글 뷰
	List<UsedPurchase> usedInquireView(HashMap<String, Object> map);
}
