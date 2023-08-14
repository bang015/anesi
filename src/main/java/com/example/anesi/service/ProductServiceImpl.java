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
	public HashMap<String, Object> searchReview(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("reviewList", productMapper.selectReview(map));
		resultMap.put("cnt", productMapper.selectCnt(map));
		return resultMap;
	}
	@Override
	public HashMap<String, Object> searchReviewCnt(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object>resultMap = new HashMap<String, Object>();
		List<Review> reviewCntList=productMapper.selectReviewCnt(map);
	    int[] ratingCounts = new int[5]; 
	    for (Review review : reviewCntList) {
	        int csat = review.getCsat();
	        int csatCnt = review.getCsatCnt();
	        if (csat==5 && csatCnt > 0) {
	            ratingCounts[4]=csatCnt; 
	        }else if(csat==5 && csatCnt <0) {
	        	 ratingCounts[4]=0;
	        }
	        if (csat==4 && csatCnt > 0) {
	            ratingCounts[3]=csatCnt; 
	        }else if(csat==4 && csatCnt <0) {
	        	 ratingCounts[3]=0;
	        }
	        if (csat==3 && csatCnt > 0) {
	            ratingCounts[2]=csatCnt; 
	        }else if(csat==3 && csatCnt <0) {
	        	 ratingCounts[2]=0;
	        }
	        if (csat==2 && csatCnt > 0) {
	            ratingCounts[1]=csatCnt; 
	        }else if(csat==2 && csatCnt <0) {
	        	 ratingCounts[1]=0;
	        }
	        if (csat==1 && csatCnt > 0) {
	            ratingCounts[0]=csatCnt; 
	        }else if(csat==1 && csatCnt <0) {
	        	 ratingCounts[0]=0;
	        }
	    }
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
	
	
}
