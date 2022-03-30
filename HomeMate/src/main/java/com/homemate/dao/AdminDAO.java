package com.homemate.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homemate.entities.AdminTbl;
import com.homemate.repository.AdminRepository;
import com.homemate.repository.VendorRepository;
import com.homemate.entities.VendorTbl;

@Service
public class AdminDAO {
	
	@Autowired
	AdminRepository repository;
	
	@Autowired
	VendorRepository vrepository;
	
	
	
	public AdminTbl authenticationAdmin(String username,String password)
	{
		return repository.loginAdmin(username, password);
		
	}
	
	public List<VendorTbl> List(){
		List<VendorTbl> list = vrepository.findAll(); 
		return list;
	}
	
	
	
}
