package com.homemate.controller;

import java.util.HashMap;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.homemate.dao.CustomerDAO;

import com.homemate.entities.CustomerTbl;

@Controller

public class CustomerController {

	@Autowired
	CustomerDAO customerdao;
	//--------------------Delete Account----------------------------------
	@GetMapping("/deleteaccount/{id}")
	public String delete(@PathVariable int id)
	{
		customerdao.deletetheService(id);
		return "redirect:/";

	}
	//user Login
	@GetMapping("/customerlogin")
	public String customerlogin()
	{
		return "customerlogin";
	}

	@PostMapping("/customerregistration")
	public String insertuser(@RequestParam String fname,@RequestParam String lname,@RequestParam String mobileno,
			@RequestParam String username,@RequestParam String password,@RequestParam String email,
			@RequestParam String address,@RequestParam String city,@RequestParam int pincode)
	{
		customerdao.insertcustomerdetails(fname, lname, mobileno, email, username, password, address, city, pincode);
		return "customerlogin";
	}

	@GetMapping("/customersignup")
	public String function()
	{
		return "customersignup";
	}


	@RequestMapping(method = RequestMethod.POST, path="/customerverify")
	public ModelAndView loginVendor(@RequestParam String username,@RequestParam String password,HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		CustomerTbl customer = customerdao.authenticationCustomer(username, password);

		//System.out.println(customer.getCustomerEmail()+customer.getCustomerPassword());
		HttpSession session = request.getSession();

		if(Objects.isNull(customer))
		{
			mv.setViewName("customerlogin");
		}
		if(Objects.nonNull(customer))
		{
			System.out.println(session.getId());
			session.setAttribute("customer",customer);
			mv.addObject("customer", customer);
			mv.setViewName("homelogin");
		}

		return mv;
	}	

	@GetMapping("/customerprofile")
	public String CustomerProfile()
	{
		return "customerhome";
	}

	@GetMapping("/customerbookedservices")
	public String customerbookservices(int custid)
	{
		CustomerTbl customer = customerdao.getById(custid);

		return "customerbookedservices";
	}

	//--------------------Edit customer--------------------------
	@GetMapping("/editCustomerProfile")
	public ModelAndView edit(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		CustomerTbl customer =  (CustomerTbl)session.getAttribute("customer");
		int id = customer.getCustomerId();
		System.out.println("Edit vendor" +id);
		CustomerTbl cust = customerdao.getCustomer(id);
		mv.addObject("custProfile", cust);

		mv.setViewName("customerprofile");

		return mv;
	}

	@PostMapping("/updateCustomerProfile")
	public String edit(@RequestParam String fname,@RequestParam String lname,@RequestParam String mobileno,
			@RequestParam String email,
			@RequestParam String address,@RequestParam String city,@RequestParam int pincode,HttpServletRequest request) {
		HttpSession session = request.getSession();
		CustomerTbl customer =  (CustomerTbl)session.getAttribute("customer");
		int id = customer.getCustomerId();
		customerdao.updateProfile(id, fname, lname, mobileno, email, address, city, pincode);
		return "customerhome";
	}

}
