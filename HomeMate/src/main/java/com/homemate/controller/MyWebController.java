package com.homemate.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyWebController {

	@GetMapping("/")
	public String function()
	{
		return "customerlogin";
	}
}
