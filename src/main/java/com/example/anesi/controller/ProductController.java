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
import com.example.anesi.service.ProductService;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class ProductController {
	
	@Autowired
	ProductService productService;
	
	@RequestMapping("/product/add.do") 
	public String login(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		return "/product_add";
		
	}
	@RequestMapping("/product/cart.do") 
	public String cart(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		return "/cart";
		
	}
	
	@RequestMapping(value = "/product/category.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String storeMain(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Category> list = productService.searchCategoryList();
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
}
