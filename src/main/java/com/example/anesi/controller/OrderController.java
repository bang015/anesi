package com.example.anesi.controller;

import java.util.HashMap;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class OrderController {
	
	@RequestMapping("/order/main.do") 
    public String order(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
        return "/order";
    }
}
