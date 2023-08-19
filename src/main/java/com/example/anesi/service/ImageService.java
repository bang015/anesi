package com.example.anesi.service;

import java.util.HashMap;

import com.example.anesi.model.Image;

public interface ImageService {
	//상품 이미지 등록
	int addPorductImage(HashMap<String, Object> map);
	//프로필 이미지
	Image searchProfileImg(HashMap<String, Object> map);
	//프로필 이미지 업데이트
	int editProfileImg(HashMap<String, Object> map);
}
