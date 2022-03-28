package com.homemate.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homemate.MyRepository;
import com.homemate.entities.CustomerTbl;

@Service
public class CustomerDAO {
	
	@Autowired
	MyRepository repository;
	
	public void insertcustomerdetails(String fname,String lname,String mobileno,String email,String username,String password,String address,String city,int pincode )
	{
		CustomerTbl userdetails = new CustomerTbl(address, city, email, fname, lname, mobileno, password, pincode, username);
		repository.save(userdetails);
	}
	
	
	
	
}
