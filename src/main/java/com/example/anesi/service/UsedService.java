package com.example.anesi.service;

import java.util.HashMap;
import java.util.List;

import com.example.anesi.model.Board;
import com.example.anesi.model.BoardComment;
import com.example.anesi.model.UsedPurchase;

public interface UsedService {
	//매입게시판 리스트
	HashMap<String, Object> purchaseList(HashMap<String, Object> map);
	//문의 등록
	HashMap<String, Object> insertUsedInquire(HashMap<String, Object> map);
	//중고 문의 사진 등록
	int insertUsedInquireImg(HashMap<String, Object> map);
	//문의글 뷰 사진 포함
	List<UsedPurchase> usedInquireView(HashMap<String, Object> map);
	//문의글 뷰
	UsedPurchase usedInquireView1(HashMap<String, Object> map);
	//문의글 뷰 사진
	List<UsedPurchase> usedInquireViewImg(HashMap<String, Object> map);
	//문의 답변 등록 
	int answerInsert(HashMap<String, Object> map);
	//문의 답변 여부
	int answerUpdate(HashMap<String, Object> map);
	//답변 정보
	UsedPurchase answerSelect(HashMap<String, Object> map);
	//중고 문의 삭제
	int usedInquireDelete(HashMap<String, Object> map);
	//중고 문의 사진 삭제
	int usedInquireImgDelete(HashMap<String, Object> map);
	//중고 문의 답변 삭제
	int usedInquireAnsDelete(HashMap<String, Object> map);
	//답변수정
	int answerEdit(HashMap<String, Object> map);
	//나의 매입게시판 리스트
	List<UsedPurchase> myPurchaseList(HashMap<String, Object> map);
	//매입 물품 리스트
	List<UsedPurchase> purchaseYList(HashMap<String, Object> map);
	//문의 수정
	int updatePurchaseInquire(HashMap<String, Object> map);
	// 판매 물품 리스트
	HashMap<String, Object> purchaseYList2(HashMap<String, Object> map);
	// 판매 물품 상세 정보
	List<UsedPurchase> purchaseView(HashMap<String, Object> map);
	// 판매등록리스트
	HashMap<String, Object> usedSellYList(HashMap<String, Object> map);
	// 판매미등록리스트
	List<UsedPurchase> usedSellNList(HashMap<String, Object> map);
	// 중고매입사례등록
	UsedPurchase usedSellAdd(HashMap<String, Object> map);
	// 매입사례등록
	int addPurchaseEx(HashMap<String, Object> map);
}
