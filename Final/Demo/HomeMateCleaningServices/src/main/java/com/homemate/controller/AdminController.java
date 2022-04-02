package com.homemate.controller;
import java.util.List;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.homemate.dao.AdminDAO;
import com.homemate.dao.OrderBookingDAO;
import com.homemate.dao.VendorDAO;
import com.homemate.entities.AdminTbl;
import com.homemate.entities.OrderBookingTbl;
import com.homemate.entities.VendorTbl;


@Controller
@RequestMapping
public class AdminController {
	@Autowired
	AdminDAO admindao;
	@Autowired
	VendorDAO vendorDao;
	@Autowired
	OrderBookingDAO orderBookingDao;

	@RequestMapping(method = RequestMethod.GET, path="/adminhome")
	public String adminHome()
	{
		ModelAndView mv = new ModelAndView();
		List<VendorTbl> list = vendorDao.getAllVendors();
		mv.addObject("vendor",list);

		mv.setViewName("admingetvendor");
		return "adminhome";
	}
	
	@GetMapping("/admin")
	public String function()
	{
		return "adminlogin";
	}

	@RequestMapping(method = RequestMethod.POST, path="/adminLogin")
	public ModelAndView loginAdmin(Model model,@RequestParam String username,@RequestParam String password,HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		List<VendorTbl> list = vendorDao.getAllVendors();
		mv.addObject("vendor",list);
		AdminTbl admin = admindao.authenticationAdmin(username, password);
		HttpSession session = request.getSession();

		if(Objects.isNull(admin))
		{
			mv.setViewName("adminlogin");
		}
		else
		{
			System.out.println(session.getId());
			session.setAttribute("admin", admin);
			mv.setViewName("adminhome");
		}
		return mv;
	}

	@RequestMapping(method = RequestMethod.GET, path="/adminvendor")
	public ModelAndView getVendor()
	{
		ModelAndView mv = new ModelAndView();
		List<VendorTbl> list = vendorDao.getAllVendors();
		mv.addObject("vendor",list);

		mv.setViewName("admingetvendor");
		return mv;
	}

	@GetMapping("/deleteVendor/{id}")
	public String deleteService(@PathVariable int id)
	{
		vendorDao.deletetheService(id);
		return "redirect:/adminvendor";

	}
	
	@RequestMapping(method = RequestMethod.GET, path="/adminViewFeedback")
	public ModelAndView getFeedback()
	{
		ModelAndView mv = new ModelAndView();
		List<OrderBookingTbl> feedback = orderBookingDao.getAllFeedback();
		mv.addObject("feedback",feedback);

		mv.setViewName("viewfeedback");
		return mv;
	}

	//---------------------get Orders Status ------------------
		@RequestMapping(value="/serviceStatus", method = RequestMethod.GET)
		public ModelAndView OrderBooking(HttpServletRequest request)
		{
			ModelAndView mv = new ModelAndView();
			List<OrderBookingTbl> list = orderBookingDao.getAllPendingOrders();//pending order
			List<OrderBookingTbl> list1 = orderBookingDao.getAllScheduleOrders();//schedules order
			mv.addObject("orders", list);
			mv.addObject("schedule", list1);
			mv.setViewName("adminviewservice");
			return mv;
		}
}

