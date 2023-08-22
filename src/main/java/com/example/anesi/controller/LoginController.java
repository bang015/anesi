package com.example.anesi.controller;

import java.util.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.anesi.model.User;
import com.example.anesi.service.LoginService;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {
	@Autowired
		LoginService loginService;
	@Autowired
		HttpSession session;
	//로그인
	@RequestMapping("/login.do") 
	public String login(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		session.invalidate();//세션만료하는애

		return "/login";
		
	}
	//로그아웃
	@RequestMapping("/logout.do") 
	public String logout(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		session.invalidate();//세션만료하는애
		
		return "/login";
		
	}
	//비회원 주문 조회
	@RequestMapping("/nOrder.do") 
	public String nOrder(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		
		return "/non_user_order_search";
		
	}
	// 주소 팝업창
	@RequestMapping("/addr.do") 
    public String addr(Model model, @RequestParam HashMap<String, Object> map, HttpServletRequest request) throws Exception{
		
		return "/jusoPopup";
    }
	
	@RequestMapping("/selectEmail.do") 
    public String selectEmail(Model model, @RequestParam HashMap<String, Object> map, HttpServletRequest request) throws Exception{
		
		return "/searchId";
    }
	// 헤더
	@RequestMapping("/header.do") 
	public String header(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		return "/header";
	}

	@RequestMapping(value = "/login.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String login(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		String status=(String)session.getAttribute("sessionStatus");
		Date currentDate = new Date();

		resultMap = loginService.searchUser(map);
		if(resultMap.containsKey("user")) {
			User user = (User)resultMap.get("user");
			session.setAttribute("sessionId", user.getUserEmail());
			session.setAttribute("sessionNo", user.getUserNo());
			session.setAttribute("sessionNick", user.getNick());
			session.setAttribute("sessionStatus", user.getStatus());
			
			
			session.setAttribute("sessionDate", currentDate);
		};
		return new Gson().toJson(resultMap);
	}
	// 이메일 확인
	@RequestMapping(value = "/emailSearch.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String search(Model model, @RequestParam HashMap<String, Object> map) throws Exception {HashMap<String, Object> resultMap = new HashMap<String, Object>();
	int email = loginService.searchUserEmail(map);
	resultMap.put("emailCheck", email);
	return new Gson().toJson(resultMap);
		}
	// 이메일 찾기
		@RequestMapping(value = "/emailSearch1.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String email(Model model, @RequestParam HashMap<String, Object> map) throws Exception {HashMap<String, Object> resultMap = new HashMap<String, Object>();
		User email1 = loginService.searchUserEmail1(map);
		resultMap.put("emailSelect", email1);
		return new Gson().toJson(resultMap);
			}
	// 비번 찾기
	@RequestMapping(value = "/pwdSearch.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchPwd(Model model, @RequestParam HashMap<String, Object> map) throws Exception {HashMap<String, Object> resultMap = new HashMap<String, Object>();
	resultMap=loginService.searchUserPwd(map);	
	return new Gson().toJson(resultMap);
	}
		
}
