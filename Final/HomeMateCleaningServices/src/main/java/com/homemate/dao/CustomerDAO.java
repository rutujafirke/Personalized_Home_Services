package com.homemate.dao;

import java.util.Objects;

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

	public CustomerTbl getById(int id)
	{	
		return repository.getById(id);

	}

	public CustomerTbl getCustomer(int id) {
		CustomerTbl customer = repository.getById(id);
		return customer;
	}

	public void updateProfile(int id,String fname,String lname,String mobileno,String email,String address,String city,int pincode )
	{
		CustomerTbl c = repository.getById(id);
		c.setCustomerFirstname(fname);
		c.setCustomerLastname(lname);
		c.setCustomerAddress(address);
		c.setCustomerCity(city);
		c.setCustomerEmail(email);
		c.setCustomerMobile(mobileno);
		c.setCustomerPincode(pincode);
		/*
		 * String username=customer.getCustomerUsername(); String password =
		 * customer.getCustomerPassword(); customer = new CustomerTbl(address, city,
		 * email, fname, lname, mobileno, password, pincode, username);
		 */
		repository.save(c);
	}

	public Boolean resetPass(String email,String pass)
	{
		Boolean flag = false;

		CustomerTbl tbl = repository.changePassword(email);
		if(Objects.nonNull(tbl)) {
			flag=true;
			tbl.setCustomerPassword(pass);
			repository.save(tbl);
		}

		return flag;
	}
	public void deletetheService(int id) 
	{
		repository.deleteById(id);
	}
}
