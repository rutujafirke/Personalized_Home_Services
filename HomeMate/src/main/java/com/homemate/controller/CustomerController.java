package com.homemate.controller;

import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.homemate.dao.CustomerDAO;
import com.homemate.entities.CustomerTbl;

@Controller
@RequestMapping

  

public class CustomerController {
	 
	@Autowired
	 CustomerDAO customerdao;


	@GetMapping("/customer")
	public String function()
	{
		return "CustomerSignup";
	}
	@PostMapping("/userregistration")
	public String insertuser(@RequestParam String fname,@RequestParam String lname,@RequestParam String mobileno,
	@RequestParam String username,@RequestParam String password,@RequestParam String email,
	@RequestParam String address,@RequestParam String city,@RequestParam int pincode)
	{
		customerdao.insertcustomerdetails(fname, lname, mobileno, email, username, password, address, city, pincode);
		return "CustomerLogin";
	}
	
	//user Login
	@GetMapping("/customerlogin")
	public String function1()
	{
		return "CustomerLogin";
	}
	
	@RequestMapping(method = RequestMethod.POST, path="/userlogin")
	public ModelAndView loginVendor(@RequestParam String username,@RequestParam String password,HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		CustomerTbl customer = customerdao.authenticationCustomer(username, password);
		//System.out.println(customer.getCustomerEmail()+customer.getCustomerPassword());
		HttpSession session = request.getSession();
	
		if(Objects.isNull(customer))
		{
			mv.setViewName("CustomerLogin");
		}
		if(Objects.nonNull(customer))
		{
			System.out.println(session.getId());
			mv.addObject("customer", customer);
			mv.setViewName("services");
		}
		
		return mv;
	}	
	
	 @GetMapping("/logout")
	   public ModelAndView logout(HttpSession session ) {
		 ModelAndView mv = new ModelAndView();
	      session.invalidate();
	      mv.setViewName("CustomerLogin");
	      return mv;
	   }
}




	
	