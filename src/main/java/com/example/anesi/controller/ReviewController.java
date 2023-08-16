package com.example.anesi.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.anesi.model.Order;
import com.example.anesi.model.Product;
import com.example.anesi.service.ReviewService;
import com.google.gson.Gson;

@Controller
public class ReviewController {
	@Autowired
	ReviewService reviewService;
	
	// 상품 별점 검색
		  @RequestMapping(value = "/csatSearch.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		   @ResponseBody
		   public String avg(Model model,  @RequestParam HashMap<String, Object> map) throws Exception {
		       HashMap<String, Object> resultMap = new HashMap<String, Object>();
		       Product csat = reviewService.searchCsatAvg(map);

		       resultMap.put("csat", csat);
		       return new Gson().toJson(resultMap);
		   }
		// 리뷰
		  @RequestMapping(value = "/reviewSearch.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		   @ResponseBody
		   public String review(Model model,  @RequestParam HashMap<String, Object> map) throws Exception {
		       HashMap<String, Object> resultMap = new HashMap<String, Object>();
		       int startNum = Integer.parseInt(String.valueOf(map.get("startNum")));
		       int lastNum = Integer.parseInt(String.valueOf(map.get("lastNum")));
		       map.put("startNum", startNum);
		       map.put("lastNum", lastNum);
		       resultMap=reviewService.searchReview(map);
		       return new Gson().toJson(resultMap);
		   }
		// 리뷰
		  @RequestMapping(value = "/reviewCntSearch.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		   @ResponseBody
		   public String reviewCnt(Model model,  @RequestParam HashMap<String, Object> map) throws Exception {
		       HashMap<String, Object> resultMap = new HashMap<String, Object>();
		       resultMap = reviewService.searchReviewCnt(map);
		       return new Gson().toJson(resultMap);
		   }
		// 상품 구매 확인(리뷰)
		  @RequestMapping(value = "/reviewUserSearch.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		   @ResponseBody
		   public String reviewUser(Model model,  @RequestParam HashMap<String, Object> map) throws Exception {
		       HashMap<String, Object> resultMap = new HashMap<String, Object>();
		       List<Order> user = reviewService.searchReviewUser(map);
		       resultMap.put("user", user);			   
		       return new Gson().toJson(resultMap);
		   }
		  // 리뷰 등록
		  @RequestMapping(value = "/reviewAdd.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
			@ResponseBody
			public String add(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
				HashMap<String, Object> resultMap = new HashMap<String, Object>();
				resultMap = reviewService.addReview(map);
				return new Gson().toJson(resultMap);
			}
}
