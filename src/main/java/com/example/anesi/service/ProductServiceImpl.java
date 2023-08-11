package com.example.anesi.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.anesi.mapper.ProductMapper;
import com.example.anesi.model.Category;
import com.example.anesi.model.Product;
import com.example.anesi.model.Scrapbook;

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
	@Override
	public List<Category> searchCategoryList2(HashMap<String, Object> map) {
		String str = (String)map.get("no");
		map.put("no", str.subSequence(0, 1));
		return productMapper.selectCategoryList2(map);
	}
	@Override
	public Product searchProductList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return productMapper.selectProductList(map);
	}
	
	@Override
	public Product searchCsatAvg(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return productMapper.selectCsatAvg(map);
	}
	
	@Override
	public List<Product> searchOption(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return productMapper.selectOption(map);
	}
	@Override
	public List<Scrapbook> searchProductImg(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return productMapper.selectcontentImg(map);
	}
	@Override
	public List<Scrapbook> searchThumbnailImg(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return productMapper.selectThumbnailImg(map);
	}
	
	
}
