package com.example.anesi.controller;
import java.util.HashMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.anesi.service.UserService;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
@Controller
public class UserController {
	@Autowired
	UserService userService;
	
	@Autowired 
	HttpSession session;
	// 회원가입 페이지
	@RequestMapping("/join.do") 
    public String test(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		
		return "/join";
    }
	
	@RequestMapping("/usepolicy.do") 
    public String usepolicy(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{

		return "/usepolicy";
    }
	
	@RequestMapping("/privacy.do") 
    public String privacy(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{

		return "/privacy";
    }

	// 회원가입
	@RequestMapping(value = "/join.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String join(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		userService.userJoin(map);
		return new Gson().toJson(resultMap);
	}
	
	// 이메일 중복체크
	@RequestMapping(value = "/joinCheck.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String joinCheck(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int cnt = userService.joinCnt(map);
		resultMap.put("cnt", cnt);
		return new Gson().toJson(resultMap);
	}
	
	// 닉네임 중복체크
	@RequestMapping(value = "/nickCheck.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String nickCheck(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int cnt = userService.nickCnt(map);
		resultMap.put("cnt", cnt);
		return new Gson().toJson(resultMap);
	}
	
	// 전화번호 중복체크
	@RequestMapping(value = "/phoneCheck.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String phoneCheck(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int cnt = userService.phoneCnt(map);
		resultMap.put("cnt", cnt);
		return new Gson().toJson(resultMap);
	}
	
}