package com.example.anesi.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.anesi.model.Scrapbook;
import com.example.anesi.model.User;


@Mapper
public interface UserMapper {
	//회원가입
	int userJoin(HashMap<String, Object> map);
	//이메일 중복체크
	int joinCnt(HashMap<String, Object> map);
	//닉네임 중복체크
	int nickCnt(HashMap<String, Object> map);
	//전화번호 중복체크
	int phoneCnt(HashMap<String, Object> map);
	//스크랩북 리스트
	List<Scrapbook> selectScrapbookList(HashMap<String, Object> map);
	//스크랩북 삭제
	int deleteScrapbook(HashMap<String, Object> map);
	//유저 정보
	User selectUserNickname(HashMap<String, Object> map);
}
