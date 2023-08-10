package com.example.anesi.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;


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
	
}
