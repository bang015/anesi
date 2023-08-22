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

import com.example.anesi.model.UsedPurchase;
import com.example.anesi.service.UsedService;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UsedController {
	@Autowired
	UsedService usedService;
	
	@Autowired 
	HttpSession session;
	
	//중고 메인
	@RequestMapping("/used/main.do") 
    public String used(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		
		return "/usedMain";
    }
	
	//중고 매입 게시판
	@RequestMapping("/used/purchase.do") 
	public String purchase(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		
	return "/purchase";
	}
	
	//중고 매입 문의
	@RequestMapping("/used/inquire.do") 
	public String inquire(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		
	return "/used_inquire";
	}
	
	//주문 내역 검색
	@RequestMapping(value = "/used/purchaseList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String purchaseList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<UsedPurchase> list = usedService.purchaseList(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
}