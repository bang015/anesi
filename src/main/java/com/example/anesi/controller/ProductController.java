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
import com.example.anesi.service.ProductService;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class ProductController {
	
	@Autowired
	ProductService productService;
	
	//상품 등록 사이트
	@RequestMapping("/product/add.do") 
	public String login(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		return "/product_add";
		
	}
	
	//상품 메인
	@RequestMapping("/product/storemain.do") 
	public String productMain(Model model) throws Exception{
		return "/product_store_main";
	}
	
	//카테고리 대분류 검색
	@RequestMapping(value = "/product/category.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String reset(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Category> list = productService.searchCategoryList();
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
}
