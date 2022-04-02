package com.homemate.dao;

import java.sql.Blob;
import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homemate.entities.VendorTbl;
import com.homemate.repository.VendorRepository;

@Service
public class VendorDAO {

	@Autowired
	VendorRepository repo;


	public VendorTbl authenticationVendor(String username, String password) {
		// TODO Auto-generated method stub
		return repo.loginVendor(username, password);
	}

	public void insertVendorDetails(String vendorAddress, String vendorCity, String vendorEmail, String vendorFirstname,
			Blob image, String vendorLastname, String vendorMobile, String vendorPassword, int vendorPincode,
			String vendorUsername)
	{
		VendorTbl vendor = new VendorTbl(vendorAddress, vendorCity, vendorEmail, vendorFirstname, image, vendorLastname, vendorMobile, vendorPassword, vendorPincode, vendorUsername);

		repo.save(vendor);
	}

	public List<VendorTbl> getAllVendors() {
		List<VendorTbl> list = repo.findAll();
		return list;
	}

	public VendorTbl getvendorDetails(int id) {
		VendorTbl vendor1 = repo.getById(id);
		return vendor1;
	}

	public void updateVendorDetails(int id, String address, String city, String email, String fname, String lname,
			String mobile, int pincode) {

		VendorTbl v = repo.getById(id);
		v.setVendorAddress(address);
		v.setVendorCity(city);
		v.setVendorEmail(email);
		v.setVendorFirstname(fname);
		v.setVendorLastname(lname);
		v.setVendorMobile(mobile);
		v.setVendorPincode(pincode);
		repo.save(v);
		// TODO Auto-generated method stub

	}

	public Boolean resetPass(String email, String password) {
		Boolean flag = false;

		VendorTbl tbl = repo.changePassword(email);
		if(Objects.nonNull(tbl)) {
			flag=true;
			tbl.setVendorPassword(password);
			repo.save(tbl);
		}

		return flag;
	}

	public void deletetheService(int id) {
		repo.deleteById(id);
		
	}



}
