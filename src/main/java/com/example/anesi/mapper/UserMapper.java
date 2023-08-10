package com.example.anesi.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface UserMapper {

	int userJoin(HashMap<String, Object> map);
	
	int joinCnt(HashMap<String, Object> map);
	
	int nickCnt(HashMap<String, Object> map);
	
	int phoneCnt(HashMap<String, Object> map);
	
}
