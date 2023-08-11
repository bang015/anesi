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
import com.example.anesi.model.User;
import com.example.anesi.service.StoreService;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class StoreController {
	
	@Autowired
	StoreService storeService;
	
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
		storeService.searchAddCartUser(map);
		resultMap.put("success", "장바구니등록완료");
		return new Gson().toJson(resultMap);
	}
	
	
}
