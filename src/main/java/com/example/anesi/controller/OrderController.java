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
import com.example.anesi.model.ProductOption;
import com.example.anesi.model.UserAddress;
import com.example.anesi.service.OrderService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class OrderController {
	
	@Autowired
	OrderService orderService;
	
	@RequestMapping("/order/main.do") 
    public String order(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
//		System.out.println(map.get("product"));
        return "/order";
    }
	
	//쿠폰 검색
	@RequestMapping(value = "/order/getCoupon.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getCoupon(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Order> list = orderService.searchCouponListt(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
	//주소 입력
	@RequestMapping(value = "/order/addAddr.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String addAddr(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		orderService.addAddr(map);
		return new Gson().toJson(resultMap);
	}
	
	//주소 검색
	@RequestMapping(value = "/order/searchAddr.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchAddr(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<UserAddress> list = orderService.searchAddrList(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
	//입력 주소 검색
	@RequestMapping(value = "/order/searchAddrInfo.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchAddr1(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		UserAddress info = orderService.searchAddr(map);
		resultMap.put("info", info);
		return new Gson().toJson(resultMap);
	}
	
	//옵션 상세 검색
	@RequestMapping(value = "/order/optionSearchInfo.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String optionSearchInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		ProductOption info = orderService.searchOptionInfo(map);
		resultMap.put("info", info);
		return new Gson().toJson(resultMap);
	}
		
	//주문 입력
	@RequestMapping(value = "/order/order.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String order(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		orderService.addOrder(map);
		return new Gson().toJson(resultMap);
	}
	
	//쿠폰 삭제
	@RequestMapping(value = "/order/couponRemove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String couponRemove(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		orderService.removeCoupon(map);
		return new Gson().toJson(resultMap);
	}
	
	//주소 수정
	@RequestMapping(value = "/order/editAddr.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String editAddr(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		orderService.editAddr(map);
		return new Gson().toJson(resultMap);
	}
	
	// 당일 주문량 검색
	@RequestMapping(value = "/order/cntOrder.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String cntOrder(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int cnt = orderService.searchOrderCnt(map);
		resultMap.put("cnt", cnt);
		return new Gson().toJson(resultMap);
	}
}
