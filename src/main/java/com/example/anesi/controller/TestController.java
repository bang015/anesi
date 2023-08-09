package com.example.anesi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {
	@RequestMapping("footer.do") 
	public String footer(Model model) throws Exception{
        return "/footer";
    }


}
