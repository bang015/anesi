package com.example.anesi.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ImageMapper {
	//상품 이미지 등록
	int insertPorductImage(HashMap<String, Object> map);
}
