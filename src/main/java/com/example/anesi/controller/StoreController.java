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
import com.example.anesi.service.StoreService;
import com.google.gson.Gson;

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
	

	@RequestMapping(value = "/product/store_main.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String storeMain(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Product> list = storeService.searchProduct(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
}
