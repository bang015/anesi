package com.example.anesi.service;

import java.util.List;

import com.example.anesi.model.Category;

public interface ProductService {
	//카테고리 대분류 검색
	List<Category> searchCategoryList();
}
