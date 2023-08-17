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

import com.example.anesi.model.Inquiry;
import com.example.anesi.service.InquiryService;
import com.google.gson.Gson;

@Controller
public class InquiryController {
	@Autowired
	InquiryService inquiryService;
	// 문의 리스트
	@RequestMapping(value = "/selectInquiryList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	   @ResponseBody
	   public String reviewUser(Model model,  @RequestParam HashMap<String, Object> map) throws Exception {
	       HashMap<String, Object> resultMap = new HashMap<String, Object>();
	       List<Inquiry> inquiryList = inquiryService.searchInqiryList(map);
	       resultMap.put("inquiryList", inquiryList);			   
	       return new Gson().toJson(resultMap);
	   }
	// 문의 개수
	@RequestMapping(value = "/selectInquiryListCnt.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	   @ResponseBody
	   public String cnt(Model model,  @RequestParam HashMap<String, Object> map) throws Exception {
	       HashMap<String, Object> resultMap = new HashMap<String, Object>();
	       int cnt = inquiryService.searchInqiryCnt(map);
	       resultMap.put("inquiryListCnt", cnt);			   
	       return new Gson().toJson(resultMap);
	   }
	
}
