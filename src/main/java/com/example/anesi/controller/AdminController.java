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

import com.example.anesi.model.Product;
import com.example.anesi.service.AdminService;
import com.google.gson.Gson;

@Controller
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	@RequestMapping("/admin_main.do") 
	public String admin_main(Model model) throws Exception{
		
		return "/admin_main";
	}
	
	@RequestMapping("/admin/product/edit.do") 
	public String edit(Model model) throws Exception{
		
		return "/product_edit";
	}
	
	//상품 전체 조회
	@RequestMapping(value = "/admin/productList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String productList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {HashMap<String, Object> resultMap = new HashMap<String, Object>();
	List<Product> list = adminService.adminProductList(map);
	resultMap.put("list", list);
	return new Gson().toJson(resultMap);
		}
}
