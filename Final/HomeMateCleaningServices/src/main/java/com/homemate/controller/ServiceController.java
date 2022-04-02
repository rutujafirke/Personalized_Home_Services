package com.homemate.controller;
import java.util.List;
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

import com.homemate.dao.OrderBookingDAO;
import com.homemate.dao.ServiceDAO;
import com.homemate.entities.CustomerTbl;
import com.homemate.entities.OrderBookingTbl;
import com.homemate.entities.ServicesTbl;
import com.homemate.entities.VendorTbl;

@Controller
public class ServiceController {

	@Autowired
	private ServiceDAO servicedao;

	@Autowired
	OrderBookingDAO orderBookingDao;
	
	//--------------------update delivery status----------------------------------------------
		@RequestMapping(value="/updatedeliverystatus", method = RequestMethod.GET)
		public String updateDeliveryStatus(@RequestParam int id)
		{
			orderBookingDao.updateDeliveryStatus(id);
			return "redirect:/orderBooking";
		}


	@GetMapping("/getvendors")	//to show customer service
	public ModelAndView getallservicesvendor(@RequestParam String servicename)
	{
		System.out.println(servicename);
		ModelAndView model = new ModelAndView();
		List<ServicesTbl> servicedetails = servicedao.servicedetails(servicename);
		model.addObject("servicename", servicedetails);
		model.setViewName("vendordetails");
		return model;

	}

	//--------------------get service of login vendor(Manage Service)-------------------------------
	@RequestMapping("/getServices")
	public ModelAndView getAllVendors(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();
		VendorTbl vendor = (VendorTbl) session.getAttribute("vendor");
		System.out.println(session);
		int id = vendor.getVendorId();

		List<ServicesTbl> list = servicedao.getAllServices(id);
		mv.addObject("services", list); // request.setAttribute
		mv.setViewName("vendormanageservices"); // requestdispatcher forward
		return mv;
	}

	//---------------insert new service--------------------------------------
	@PostMapping("/insertService")
	public String insertService(@RequestParam("serviceType") String service,@RequestParam("cost") int cost,@RequestParam("discount") String discount,@RequestParam("time") String time,HttpServletRequest request )
	{
		HttpSession session = request.getSession();
		VendorTbl vendor = (VendorTbl) session.getAttribute("vendor");
		//System.out.println(session);
		servicedao.insertService(cost, discount, time, service,vendor);
		return "redirect:/getServices";

	}

	//--------------------Delete Service----------------------------------
	@GetMapping("/deleteService/{id}")
	public String deleteService(@PathVariable int id)
	{
		servicedao.deletetheService(id);
		return "redirect:/getServices";

	}

	//--------------------Update Service----------------------------------------------
	@RequestMapping(value="/edit", method = RequestMethod.GET)
	public ModelAndView editService(@RequestParam int id)
	{
		ModelAndView mv = new ModelAndView();
		ServicesTbl service = servicedao.editTheService(id);

		System.out.println(service.getServiceType());
		mv.addObject("service", service);
		mv.setViewName("vendoreditservice");

		return mv;
	}


	@PostMapping("/updateService")
	public String updateService(@RequestParam("id") int id,@RequestParam("serviceType") String service,@RequestParam("cost") int cost,@RequestParam("discount") String discount ,@RequestParam(required=false,name="discounts") String discounts,@RequestParam("time") String time,HttpServletRequest request)
	{
		System.out.println(discounts);
		HttpSession session = request.getSession();
		VendorTbl vendor = (VendorTbl) session.getAttribute("vendor");
		servicedao.editTheService(id, cost, discount, time, service,vendor);

		return "redirect:/getServices";
	}


	@GetMapping("/servicebookpage")
	public ModelAndView nextpage(@RequestParam int custid, @RequestParam int serviceid)
	{
		ModelAndView model = new ModelAndView();
		System.out.println(custid + " " +serviceid);
		ServicesTbl servicegetbyid = servicedao.getservicebyId(serviceid);
		System.out.println(servicegetbyid.getServiceCost());
		model.addObject("servicegetbyid", servicegetbyid);
		model.setViewName("finalservicebook");
		return model;

	}

	//---------------------get Orders(Manage Appointment)  ------------------
	@RequestMapping(value="/orderBooking", method = RequestMethod.GET)
	public ModelAndView OrderBooking(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		VendorTbl vendor =  (VendorTbl)session.getAttribute("vendor");
		int id = vendor.getVendorId();
		List<OrderBookingTbl> list = orderBookingDao.getAllOrders(id);//pending order
		List<OrderBookingTbl> list1 = orderBookingDao.getAllSchedule(id);//schedules order
		mv.addObject("orders", list);
		mv.addObject("schedule", list1);
		mv.setViewName("vendormyappointment");
		return mv;
	}
	//--------------------Feedback---------------------------------
	@RequestMapping(value="/getdeliveredservice", method = RequestMethod.GET)
	public ModelAndView GetDeliveredService(@RequestParam int custid, HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		CustomerTbl customer =  (CustomerTbl)session.getAttribute("customer");
		int id = customer.getCustomerId();
		List<OrderBookingTbl> list = orderBookingDao.getAllDeliveredOrders(id);//pending order			
		mv.addObject("delivered", list);
		mv.setViewName("customerfeedback");
		return mv;
	}
	@GetMapping("/givefeedback")
	public ModelAndView feedback(@RequestParam int id)
	{
		ModelAndView mv = new ModelAndView();

		OrderBookingTbl tbl = orderBookingDao.getById(id);
		mv.addObject("feedback", tbl);
		mv.setViewName("feedback");
		return mv;
	}
	@PostMapping("/feed")
	public String feed(@RequestParam int bookid, @RequestParam String message, @RequestParam String rating )
	{
		orderBookingDao.insertfeedbackdetails(bookid, message, rating);
		return "customerhome";
	}

	//--------------------Accept pending Orders----------------------------------------------
	@RequestMapping(value="/acceptOrder", method = RequestMethod.GET)
	public String acceptService(@RequestParam int id)
	{
		//System.out.println("I'm here "+id);
		orderBookingDao.acceptTheOrder(id);
		//System.out.println("I'm here "+id);
		return "redirect:/orderBooking";
	}

	//--------------------Delete order----------------------------------
	@GetMapping("/deleteOrder/{id}")
	public String deleteOrderBooking(@PathVariable int id)
	{
		orderBookingDao.findAndDeletetheOrder(id);
		return "redirect:/orderBooking";

	}

	//---------------------Service Feedback of login vendor-------------------
	@GetMapping("/vendorFeedback")
	public ModelAndView feedback(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		VendorTbl vendor =  (VendorTbl)session.getAttribute("vendor");
		int id = vendor.getVendorId();
		System.out.println(id);

		List<OrderBookingTbl> list = orderBookingDao.getFeedbackReview(id);
		if(Objects.nonNull(list))
		{
			mv.addObject("feedback", list);
			mv.setViewName("vendorviewfeedback");
			return mv;
		}
		else
		{
			mv.setViewName("vendorviewfeedback");
			return mv;
		}
	}
}
