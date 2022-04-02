package com.homemate.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.homemate.dao.CustomerDAO;
import com.homemate.dao.VendorDAO;
import com.homemate.email.EmailSenderService;

@Controller
public class HomeController {

	@Autowired
	CustomerDAO customerdao;
	@Autowired
	EmailSenderService mailsender;
	@Autowired
	VendorDAO vendorDao;
	
	@GetMapping("/")
	public String HomePage()
	{
		return "index";
	}
	
	@GetMapping("/service")
	public String ServicePage()
	{
		return "service";
	}
	
	@GetMapping("/aboutus")
	public String Aboutus()
	{
		return "aboutus";
	}
	
	@GetMapping("/contactus")
	public String Contactus()
	{
		return "contactus";
	}
	
	@GetMapping("/servicelogin")
	public String AfterServicePage()
	{
		return "servicelogin";
	}
	
	@GetMapping("/home")
	public String AfterHomePage()
	{
		return "homelogin";
	}
	

	@GetMapping("/logout")
	public ModelAndView logout(HttpSession session ) {
		ModelAndView mv = new ModelAndView();
		session.invalidate();
		mv.setViewName("index");
		return mv;
	}
	
	@GetMapping("/reset")
	public String fun1()
	{
		return "resetpasswordform";
	}
	@PostMapping("/resetpassword")
	public String func1(@RequestParam String email,@RequestParam String password,@RequestParam String password1,@RequestParam String user)
	{
		Boolean verify;
		if(password.equals(password1))
		{
			if(user.equals("Customer"))
			{
				verify = customerdao.resetPass(email, password);
				if(verify==true) {
					return "customerlogin";
				}
			}
			else
			{
				verify = vendorDao.resetPass(email, password1);
				if(verify==true) {
					return "vendorlogin";
				}
			}
		}

		return "redirect:/reset";



	}

	@GetMapping("/forgot")
	public String fun()
	{
		return "forgotpasswordform";
	}
	@PostMapping("/sendmail")
	public String func(@RequestParam String email,@RequestParam String user)
	{
		System.out.println(user);
		if(user.equals("Customer"))
		{
			mailsender.sendSimpleEmail(email,"Change Your Password :http://localhost:9090/reset");
			return "customerlogin";
		}
		else {
			mailsender.sendSimpleEmail(email,"Change Your Password :http://localhost:9090/reset");
			return "vendorlogin";
		}



	}

}
