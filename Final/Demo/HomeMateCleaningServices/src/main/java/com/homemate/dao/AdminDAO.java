package com.homemate.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homemate.entities.AdminTbl;
import com.homemate.repository.AdminRepository;


@Service
public class AdminDAO {
	
	@Autowired
	AdminRepository repository;
	
	public AdminTbl authenticationAdmin(String username,String password)
	{
		return repository.loginAdmin(username, password);
		
	}
	
	
	
	
}
