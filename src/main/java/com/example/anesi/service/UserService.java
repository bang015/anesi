package com.example.anesi.service;

import java.util.HashMap;
import java.util.List;

import com.example.anesi.model.Scrapbook;



public interface UserService {
	//회원가입
	int userJoin(HashMap<String, Object> map);
	//이메일 중복체크
	int joinCnt(HashMap<String, Object> map);
	//닉네임 중복체크
	int nickCnt(HashMap<String, Object> map);
	//전화번호 중복체크
	int phoneCnt(HashMap<String, Object> map);
	//스크랩북 리스트
	List<Scrapbook> searchScrapbookList(HashMap<String, Object> map);
}
