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
	//가구페이지로
	@RequestMapping("/product/storemain_furniture.do") 
	public String storemain_furniture(Model model) throws Exception{
		return "/product_store_main_furniture";
	}
	
	//조명페이지로
	@RequestMapping("/product/storemain_light.do") 
	public String storemain_light(Model model) throws Exception{
		return "/product_store_main_light";
	}
	
	//가전페이지로
	@RequestMapping("/product/storemain_electronic.do") 
	public String storemain_electronic(Model model) throws Exception{
		return "/product_store_main_electronic";
	}
	//패브릭페이지로
	@RequestMapping("/product/storemain_fabric.do") 
	public String storemain_fabric(Model model) throws Exception{
		return "/product_store_main_fabric";
	}
	
	//데코/식물페이지로
	@RequestMapping("/product/storemain_deco_plant.do") 
	public String storemain_deco_plant(Model model) throws Exception{
		return "/product_store_main_deco_plant";
	}
	
	//반려동물페이지로
	@RequestMapping("/product/storemain_pet.do") 
	public String storemain_pet(Model model) throws Exception{
		return "/product_store_main_pet";
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
