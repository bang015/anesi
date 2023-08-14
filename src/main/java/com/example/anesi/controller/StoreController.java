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
import com.example.anesi.model.Category;
import com.example.anesi.model.Product;
import com.example.anesi.model.Scrapbook;
import com.example.anesi.service.ProductService;
import com.example.anesi.service.StoreService;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class StoreController {
	
	@Autowired
	StoreService storeService;
	
	@Autowired
	ProductService productService;
	
	@RequestMapping("/product/ontop_category.do") 
	public String productMain_ontop(Model model) throws Exception{
		return "/product_store_main_ontop_category";
	}
	
	@RequestMapping("/product/storemain.do") 
	public String productMain(Model model) throws Exception{
		return "/product_store_main";
	}
	//가구페이지로
	@RequestMapping("/product/storemain_byCategory.do") 
	public String storemain_furniture(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		return "/product_store_main_byCategory";
	}


	@RequestMapping(value = "/product/store_main.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String storeMain(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Product> list = storeService.searchProduct(map);
		resultMap.put("list", list);
		List<Category> list2 = storeService.searchCategoryList();
		resultMap.put("list2", list2);
		return new Gson().toJson(resultMap);
	}
	
	//유저 장바구니에 상품담기
	@RequestMapping(value = "/product/insertCart.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String insertCart(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		storeService.addCartUser(map);
		resultMap.put("success", "장바구니등록완료");
		return new Gson().toJson(resultMap);
	}
	
	//스크랩북에 상품담기
	@RequestMapping(value = "/product/insertScrap.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String insertScrap(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		storeService.addScrapbook(map);
		resultMap.put("success", "스크랩북등록완료");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/product/selectScrapCnt.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String selectScrapCnt(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Scrapbook> list = storeService.searchScrapbookCnt(map);
		resultMap.put("success", "스크랩북개수확인");
		resultMap.put("list", list);
	
		
		return new Gson().toJson(resultMap);
	}

	
	  // 상품 썸네일 이미지
	  @RequestMapping(value = "/imgThumbnailSearch_1.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	   @ResponseBody
	   public String storeimage(Model model,  @RequestParam HashMap<String, Object> map) throws Exception {
	       HashMap<String, Object> resultMap = new HashMap<String, Object>();
	       List<Scrapbook> img = productService.searchThumbnailImg(map);

	       resultMap.put("img", img);
	       return new Gson().toJson(resultMap);
	   }

	
}
