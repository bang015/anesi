package com.example.anesi.controller;

import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class ProductController {
	
	@RequestMapping("/product/add.do") 
	public String login(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		
		return "/product_add";
		
	}
<<<<<<< HEAD
	@RequestMapping("/product/nullcart.do") 
	public String nullcart(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		
		return "/nullCart";
		
	}
	@RequestMapping("/product/cart.do") 
	public String cart(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		
		return "/cart";
		
=======
	
	@RequestMapping(value = "/category1.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String login(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		return new Gson().toJson(resultMap);
>>>>>>> branch 'master' of https://github.com/Jeongseonil/anesi.git
	}
}
