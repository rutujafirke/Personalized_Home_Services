package com.homemate.controller;

import java.util.Date;
import java.util.List;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.homemate.dao.CustomerDAO;
import com.homemate.dao.OrderBookingDAO;
import com.homemate.dao.ServiceDAO;
import com.homemate.entities.CustomerTbl;
import com.homemate.entities.OrderBookingTbl;
import com.homemate.entities.ServicesTbl;

@Controller
public class OrderBookingController {
	
	@Autowired
	CustomerDAO customerdao;
	
	@Autowired
	ServiceDAO servicedao;
	
	
	@Autowired
	OrderBookingDAO orderbookingdao;
	
	

	@PostMapping("/orderbook")
	public ModelAndView bookorder(@RequestParam String address,@RequestParam int customerid,@RequestParam int cost,
			@RequestParam int serviceid,@RequestParam String datetime,@RequestParam String scheduletime) throws ParseException
	{
		ModelAndView mv = new ModelAndView();
		CustomerTbl customer = customerdao.getById(customerid);
		ServicesTbl service = servicedao.getservicebyId(serviceid);
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date1 = (Date) dateFormat.parse(datetime);
		orderbookingdao.insertbooking(address, customer, service, date1, scheduletime, cost);
		
		mv.setViewName("servicelogin");
		return mv;
	}
	
	@GetMapping("/bookedservices")
	public ModelAndView bookedservices(int custid)
	{
		ModelAndView mv = new ModelAndView();
		List<OrderBookingTbl> order = orderbookingdao.getbooking(custid);
		mv.addObject("order",order);
		mv.setViewName("customerbookedservices");
		return mv;
		
	}
}
