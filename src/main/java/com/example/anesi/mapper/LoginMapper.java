package com.example.anesi.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface LoginMapper {
	// 로그인
	int selectUser(HashMap<String, Object> map);
	// 로그인 아이디 존재 확인
	int userCnt(HashMap<String, Object> map);
}
