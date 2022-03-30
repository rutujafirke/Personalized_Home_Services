package com.homemate.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homemate.entities.CustomerTbl;
import com.homemate.repository.CustomerRepository;


@Service
public class CustomerDAO {
	
	@Autowired
	CustomerRepository repository;
	
	public void insertcustomerdetails(String fname,String lname,String mobileno,String email,String username,String password,String address,String city,int pincode )
	{
		CustomerTbl userdetails = new CustomerTbl(address, city, email, fname, lname, mobileno, password, pincode, username);
		repository.save(userdetails);
	}
	
	public CustomerTbl authenticationCustomer(String username,String password)
	{
		return repository.loginCustomer(username, password);
		
	}
	
	
	
}
