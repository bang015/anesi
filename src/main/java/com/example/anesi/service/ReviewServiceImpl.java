package com.example.anesi.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.anesi.mapper.ReviewMapper;
import com.example.anesi.model.Order;
import com.example.anesi.model.Product;
import com.example.anesi.model.Review;

@Service
public class ReviewServiceImpl implements ReviewService{
	@Autowired
	ReviewMapper reviewMapper;
	
	@Override
	public Product searchCsatAvg(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return reviewMapper.selectCsatAvg(map);
	}

	@Override
	public HashMap<String, Object> searchReview(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("reviewList", reviewMapper.selectReview(map));
		resultMap.put("cnt", reviewMapper.selectCnt(map));
		return resultMap;
	}

	@Override
	public HashMap<String, Object> searchReviewCnt(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object>resultMap = new HashMap<String, Object>();
		List<Review> reviewCntList=reviewMapper.selectReviewCnt(map);
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
	public List<Order> searchReviewUser(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return reviewMapper.selectReviewUser(map);
	}

	@Override
	public HashMap<String, Object> addReview(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		reviewMapper.insertReview(map);
		resultMap.put("idx", map.get("idx"));
		return resultMap;
	}

	@Override
	public int addReviewImg(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return reviewMapper.insertReviewImg(map);
	}

	@Override
	public HashMap<String, Object> editHelp(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object>resultMap = new HashMap<String, Object>();
		int help1=reviewMapper.insertHelp(map);
		int help2=reviewMapper.updateHelp(map);
		resultMap.put("help1", help1);
		return resultMap;
	}

	@Override
	public List<Review> searchHelpUser(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return reviewMapper.selectHelpUser(map);
	}

	@Override
	public int editHelp2(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		reviewMapper.deleteHelp(map);
		return reviewMapper.updateHelp2(map);
	}
	
}
 