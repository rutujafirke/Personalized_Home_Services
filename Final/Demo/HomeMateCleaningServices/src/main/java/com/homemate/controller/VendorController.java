package com.homemate.controller;


import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.homemate.dao.VendorDAO;
import com.homemate.email.EmailSenderService;
import com.homemate.entities.VendorTbl;


@RequestMapping
@Controller
public class VendorController {

	@Autowired
	VendorDAO vendorDao;
	@Autowired
	EmailSenderService mailsender;



	//---------------------vendor Home-------------------
	@GetMapping("/vendorhome")
	public String home() {
		return "vendorhome";
	}



	//------------------Vendor Login-----------------------------------------------
	@GetMapping("/vendorlogin")
	public String login() {
		return "vendorlogin";
	}

	@PostMapping("/verify")
	public String verifyLogin(@RequestParam String username,@RequestParam String password,HttpServletRequest request) {
		VendorTbl vendor = vendorDao.authenticationVendor(username, password);


		HttpSession session = request.getSession();

		if(Objects.isNull(vendor))
		{
			return "vendorlogin";
		}
		if(Objects.nonNull(vendor))
		{
			System.out.println(session.getId());
			session.setAttribute("vendor", vendor);
		}
		return "vendorhome";

	}
	//---------------------vendor Registration-------------------
	@GetMapping("/vendorSignup")
	public String insert() {
		System.out.println("reached here..");
		return "vendorsignup";
	}

	@PostMapping("/vendorregistration")
	public String insertVendor(@RequestParam("fname") String fname, @RequestParam("lname") String lname,
			@RequestParam("email") String email, @RequestParam("mobile") String mobile,
			@RequestParam("uname") String uname, @RequestParam("pass") String pass,
			@RequestParam("address") String address, @RequestParam("city") String city,
			@RequestParam("pincode") int pincode, @RequestParam("file") MultipartFile  file) throws IOException  { 


		byte[] byteArr;
		Blob blob;
		try {
			byteArr = file.getBytes();
			blob = new SerialBlob(byteArr);

			vendorDao.insertVendorDetails(address, city, email, fname, blob, lname, mobile, pass, pincode, uname);
			return "vendorlogin";
		} catch (SQLException e) {

			e.printStackTrace();
			return "index";
		}
		catch (IOException e1) {

			e1.printStackTrace();
			return "index";
		}


	}

	//----------------Edit vendor by id-----------------
	@GetMapping("/editVendorProfile")
	public ModelAndView edit(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		VendorTbl vendor =  (VendorTbl)session.getAttribute("vendor");
		int id = vendor.getVendorId();
		System.out.println("Edit vendor" +id);
		VendorTbl vendorTbl = vendorDao.getvendorDetails(id);
		mv.addObject("profile", vendorTbl);
		mv.setViewName("vendorprofile");

		return mv;
	}

	@PostMapping("/updateVendorProfile")
	public String update(@RequestParam("fname") String fname, @RequestParam("lname") String lname,
			@RequestParam("email") String email, @RequestParam("mobile") String mobile,
			@RequestParam("address") String address, @RequestParam("city") String city,
			@RequestParam("pincode") int pincode,HttpServletRequest request) {
		HttpSession session = request.getSession();
		VendorTbl vendor =  (VendorTbl)session.getAttribute("vendor");
		int id = vendor.getVendorId();
		System.out.println("Edit vendor" +id);
		vendorDao.updateVendorDetails(id,address, city, email, fname, lname, mobile, pincode);


		return "redirect:/vendorhome";
	}

}
