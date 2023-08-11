package com.example.anesi.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.anesi.model.Category;
import com.example.anesi.model.Product;
import com.example.anesi.model.Scrapbook;



@Mapper
public interface ProductMapper {
	// Store서비스에 상품기본정보 가져오는 매퍼
	List<Product> selectProduct(HashMap<String, Object> map);
	

	// 카테고리 검색
	List<Category> selectCategoryList();
	List<Product> selectCartProductList(HashMap<String, Object> map);
	
	// 카테고리 소분류 검색
	List<Category> selectCategoryList2(HashMap<String, Object> map);
	
	// 상품 상세 정보 검색
	Product selectProductList(HashMap<String, Object> map);
	// 상품 별점 검색
	Product selectCsatAvg(HashMap<String, Object> map);
	// 상품 옵션 검색
	List<Product> selectOption(HashMap<String, Object> map);
	// 상품 썸네일 이미지
	List<Scrapbook> selectThumbnailImg(HashMap<String, Object> map);
	// 상품 컨텐츠 이미지
	List<Scrapbook>selectcontentImg(HashMap<String, Object> map);
	//상품 검색창 검색
		List<Product> selectProductListByKeyword(HashMap<String, Object> map);
}