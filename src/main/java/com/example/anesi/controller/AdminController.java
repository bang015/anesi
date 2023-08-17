package com.example.anesi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class AdminController {
	@RequestMapping("/admin_main.do") 
	public String admin_main(Model model) throws Exception{
		
		return "/admin_main";
	}
	
}
