package com.example.anesi.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.anesi.mapper.ProductMapper;
import com.example.anesi.model.Category;
import com.example.anesi.model.Product;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductMapper productMapper;
	
	@Override
	public List<Category> searchCategoryList() {
		// TODO Auto-generated method stub
		return productMapper.selectCategoryList();
	}
	@Override
	public List<Product> selectCartProductList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return productMapper.selectCartProductList(map);
	}


}
