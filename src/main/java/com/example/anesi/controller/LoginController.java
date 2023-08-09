package com.example.anesi.controller;

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
	@RequestMapping("/login.do") 
	public String login(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		
		return "/login";
		
	}

	
	@RequestMapping("/text.do") 
    public String test(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		return "/test";
    }

	@RequestMapping(value = "/login.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String login(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		String status=(String)session.getAttribute("sessionStatus");
		resultMap = loginService.searchUser(map);
		if(resultMap.containsKey("user")) {
			User user = (User)resultMap.get("user");
			session.setAttribute("sessionId", user.getUserEmail());
			session.setAttribute("sessionName", user.getUserName());
			session.setAttribute("sessionNick", user.getNick());
			session.setAttribute("sessionStatus", user.getStatus());
		};
		return new Gson().toJson(resultMap);
	}
}
