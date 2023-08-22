package com.example.anesi.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.anesi.mapper.ProductMapper;
import com.example.anesi.model.Cart;
import com.example.anesi.model.Category;
import com.example.anesi.model.Product;
import com.example.anesi.model.Scrapbook;



@Service
public class StoreServiceImpl implements StoreService{
	
	@Autowired
	ProductMapper productMapper;
	

	@Override
	public HashMap<String, Object> searchProduct(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", productMapper.selectProduct(map));
		resultMap.put("cnt", productMapper.selectCnt(map));
		return resultMap;
	}
	

	@Override
	public List<Category> searchCategoryList() {
		return productMapper.selectCategoryList();
	}


	@Override
	public int addCartUser(HashMap<String, Object> map) {
		return productMapper.insertCartUser(map);
	}
	
	@Override
	public int addScrapbook(HashMap<String, Object> map) {
		return productMapper.insertScrapbook(map);
	}
	
	@Override
	public int removeScrapbook(HashMap<String, Object> map) {
		return productMapper.deleteScrapbook(map);
	}


	@Override
	public List<Scrapbook> searchScrapbookList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return productMapper.selectScrapbookList(map);
	}
	@Override
	public List<Cart> userCartList(HashMap<String, Object> map) {
		return productMapper.userCartList(map);
	}
	
	@Override
	public List<Scrapbook> searchThumbnailImg(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return productMapper.selectThumbnailImg(map);
	}


	@Override
	public int updateCartCnt(HashMap<String, Object> map) {
		return productMapper.updateCartCnt(map);
	}


	@Override
	public int nonUserCartInsert(HashMap<String, Object> map) {
		return productMapper.nonUserCartInsert(map);
	}


	@Override
	public List<Product> bestProduct(HashMap<String, Object> map) {
		return productMapper.bestProduct(map);
	}


	
	

}
