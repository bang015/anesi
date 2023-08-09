package com.example.anesi.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.anesi.model.Category;



@Mapper
public interface ProductMapper {
	// 카테고리 검색
	List<Category> selectCategoryList();
}