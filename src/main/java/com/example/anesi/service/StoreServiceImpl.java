package com.example.anesi.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.anesi.mapper.ProductMapper;
import com.example.anesi.model.Category;
import com.example.anesi.model.Product;



@Service
public class StoreServiceImpl implements StoreService{
	
	@Autowired
	ProductMapper productMapper;
	

	@Override
	public List<Product> searchProduct(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		return productMapper.selectProduct(map);
	
	}


	@Override
	public List<Category> searchCategoryList() {
		return productMapper.selectCategoryList();
	}


	@Override
	public int searchAddCartUser(HashMap<String, Object> map) {
		return productMapper.insertCartUser(map);
	}

}
