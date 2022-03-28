package com.homemate.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.homemate.dao.CustomerDAO;

@Controller
@RequestMapping
public class CustomerController {

	@Autowired
	CustomerDAO customerdao;
	
	@GetMapping("/customer")
	public String function()
	{
		System.out.println("Welcome");
		return "CustomerLogin";
	}
	
	@PostMapping("/userregistration")
	public String insertuser(@RequestParam String fname,@RequestParam String lname,@RequestParam String mobileno,
	@RequestParam String username,@RequestParam String password,@RequestParam String email,
	@RequestParam String address,@RequestParam String city,@RequestParam int pincode)
	{
		customerdao.insertcustomerdetails(fname, lname, mobileno, email, username, password, address, city, pincode);
		return "services";
	}
	
}
