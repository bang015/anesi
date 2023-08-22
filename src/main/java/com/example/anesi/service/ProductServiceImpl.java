package com.example.anesi.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.anesi.mapper.ProductMapper;
import com.example.anesi.model.Category;
import com.example.anesi.model.Order;
import com.example.anesi.model.Product;
import com.example.anesi.model.Review;
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
	@Override
	public List<Product> searchProduct(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return productMapper.searchProduct(map);
	}
	@Override
	public List<Scrapbook> searchcontentImg2(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return productMapper.selectcontentImg2(map);
	}
 
		@Override
			public List<Product> selectCartList(HashMap<String, Object> map) {
				// TODO Auto-generated method stub
				List<Product> list = null;
				if (!map.get("userNo").equals("")) {
					list = productMapper.selectCartList(map);
				} else {
					list =productMapper.selectNonCartList(map);
				}
				return list;
		}
		@Override
		public int addProduct(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			return productMapper.insertPorduct(map);
		}
		@Override
		public Product insertSearchProduct(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			return productMapper.insertSelectPorduct(map);
		}
		@Override
		public int addOption(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			return productMapper.insertOption(map);
		}
		@Override
		public int deleteCartlist(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			return productMapper.deleteCartlist(map);
		}
		@Override
		public List<Product> searchBarProductList(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			return productMapper.searchBarProductList(map);
		}
		@Override
		public int deleteAllCartItems(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			return productMapper.deleteAllCartItems(map);
		}
		@Override
		public List<Product> selectLatest(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			return productMapper.selectLatest(map);
		}
		@Override
		public List<Product> selectCate(String categoryName) {
		    return productMapper.selectCate(categoryName);
		}
		@Override
		public List<Product> selectCateList(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			return productMapper.selectCateList(map);
		}
		@Override
				public List<Category> searchCategory(HashMap<String, Object> map) {
					// TODO Auto-generated method stub
					return productMapper.selectCategory(map);
					
				}
	
}
