package com.example.anesi.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.anesi.mapper.ProductMapper;
import com.example.anesi.model.Category;
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
	@Override
	public List<Product> searchProduct(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return productMapper.selectProductListByKeyword(map);
	}
	@Override
	public List<Scrapbook> searchcontentImg2(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return productMapper.selectcontentImg2(map);
	}
	@Override
	public List<Review> searchReview(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return productMapper.selectReview(map);
	}
	@Override
	public HashMap<String, Object> searchReviewCnt(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object>resultMap = new HashMap<String, Object>();
		List<Review> reviewCntList=productMapper.selectReviewCnt(map);
		 // 별점 1점부터 5점까지의 개수를 담을 배열
	    int[] ratingCounts = new int[5]; // 인덱스 0부터 4까지 사용

	    // 각 별점의 개수를 세어 배열에 저장
	    for (Review review : reviewCntList) {
	        int csat = review.getCsat();
	        if (csat >= 1 && csat <= 5) {
	            ratingCounts[csat - 1]++; // 별점은 1부터 시작하므로 인덱스 조정
	        }
	    }

	    // 결과를 resultMap에 저장
	    for (int i = 0; i < 5; i++) {
	        resultMap.put("csat" + (i + 1), ratingCounts[i]);
	    }

	    return resultMap;
	}
	
	

	@Override
		public List<Product> selectCartList(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			return productMapper.selectCartList(map);
	}
	
	
}
