package com.example.anesi.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.example.anesi.model.Image;

@Mapper
public interface ImageMapper {
	//상품 이미지 등록
	int insertPorductImage(HashMap<String, Object> map);
	//프로필 이미지
	Image selectProfileImg(HashMap<String, Object> map);
	//프로필 이미지 업데이트
	int updateProfileImg(HashMap<String, Object> map);
}
