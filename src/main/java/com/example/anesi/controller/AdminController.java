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
import com.example.anesi.model.UserOrder;
import com.example.anesi.service.AdminService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	@RequestMapping("/admin/main.do") 
	public String admin_main(Model model) throws Exception{
		
		return "/admin_main";
	}
	
	@RequestMapping("/admin/product_edit.do") 
	public String edit(Model model) throws Exception{
		
		return "/product_edit";
	}
	
	@RequestMapping("/admin/delivery.do") 
	public String delivery(Model model) throws Exception{
		
		return "/admin_delivery";
	}
	
	@RequestMapping("/admin/add.do") 
	public String login(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		return "/product_add";
		
	}
	//상품 전체 조회
	@RequestMapping(value = "/admin/productList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String productList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Product> list = adminService.adminProductList(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	//상품 전체 조회
	@RequestMapping(value = "/admin/productInfo.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String productInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Product> info = adminService.adminProductInfo(map);
		resultMap.put("info", info);
		return new Gson().toJson(resultMap);
	}
	
	//상품 업데이트
	@RequestMapping(value = "/admin/productUpdate.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String productUpdate(Model model, @RequestParam HashMap<String, Object> map) throws Exception {HashMap<String, Object> resultMap = new HashMap<String, Object>();
		adminService.adminEditProduct(map);
		return new Gson().toJson(resultMap);
	}
	
	//옵션 업데이트
	@RequestMapping(value = "/admin/optionUpdate.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String optionUpdate(Model model, @RequestParam HashMap<String, Object> map) throws Exception {HashMap<String, Object> resultMap = new HashMap<String, Object>();
		adminService.adminEditOption(map);
		
		return new Gson().toJson(resultMap);
	}
	
	//옵션 추가
	@RequestMapping(value = "/admin/optionInsert.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String optionInsert(Model model, @RequestParam HashMap<String, Object> map) throws Exception {HashMap<String, Object> resultMap = new HashMap<String, Object>();
		adminService.adminAddOption(map);
		return new Gson().toJson(resultMap);
	}
	
	//상품 상태 업데이트
	@RequestMapping(value = "/admin/productSituation.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String productSituation(Model model, @RequestParam HashMap<String, Object> map) throws Exception {HashMap<String, Object> resultMap = new HashMap<String, Object>();
		String json = map.get("checkList").toString();
		ObjectMapper mapper = new ObjectMapper();
		List<Object> list = mapper.readValue(json, new TypeReference<List<Object>>(){});
		map.put("list", list);
		resultMap.put("cnt", adminService.adminEditProductSituation(map));
		return new Gson().toJson(resultMap);
	}
	
	//옵션 삭제
	@RequestMapping(value = "/admin/optionDelete.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String optionDelete(Model model, @RequestParam HashMap<String, Object> map) throws Exception {HashMap<String, Object> resultMap = new HashMap<String, Object>();
		String json = map.get("list").toString();
		ObjectMapper mapper = new ObjectMapper();
		List<Object> list = mapper.readValue(json, new TypeReference<List<Object>>(){});
		map.put("list", list);
		resultMap.put("cnt", adminService.adminRemoveOption(map));
		return new Gson().toJson(resultMap);
	}
	
	//옵션 추가
	@RequestMapping(value = "/admin/orderList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String orderList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<UserOrder> list = adminService.selectDeliveryList(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
	//배송 상태 업데이트
	@RequestMapping(value = "/admin/editDelivery.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String editDelivery(Model model, @RequestParam HashMap<String, Object> map) throws Exception {HashMap<String, Object> resultMap = new HashMap<String, Object>();
		String json = map.get("checkList").toString();
		ObjectMapper mapper = new ObjectMapper();
		List<Object> list = mapper.readValue(json, new TypeReference<List<Object>>(){});
		map.put("list", list);
		resultMap.put("cnt", adminService.adminRemoveOption(map));
		return new Gson().toJson(resultMap);
	}
}
