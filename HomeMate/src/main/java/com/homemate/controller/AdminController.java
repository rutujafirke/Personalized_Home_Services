package com.homemate.controller;
import java.util.List;
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

import com.homemate.dao.AdminDAO;
import com.homemate.dao.CustomerDAO;
import com.homemate.dao.VendorDAO;
import com.homemate.entities.AdminTbl;
import com.homemate.entities.VendorTbl;


@Controller
@RequestMapping


public class AdminController {
	@Autowired
	 AdminDAO admindao;
        
	@Autowired
	 VendorDAO vendordao;
       
	@GetMapping("/admin")
	public String function()
	{
		return "AdminLogin";
	}
	
	@RequestMapping(method = RequestMethod.POST, path="/adminhome")
	public ModelAndView loginAdmin(@RequestParam String username,@RequestParam String password,HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		List<VendorTbl> list = vendordao.getAllVendors();
		mv.addObject("vendor",list);
		AdminTbl admin = admindao.authenticationAdmin(username, password);
		//System.out.println(admin.getAminUsername()+admin.getAdminPassword());
		HttpSession session = request.getSession();
	
		if(Objects.isNull(admin))
		{
			mv.setViewName("AdminLogin");
		}
		if(Objects.nonNull(admin))
		{
			System.out.println(session.getId());
			
			session.setAttribute("admin", admin);
			mv.setViewName("AdminHome");
			
		}
		
		return mv;
	}
	
	
       
}

