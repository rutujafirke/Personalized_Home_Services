package com.homemate.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homemate.entities.OrderTbl;
import com.homemate.repository.OrderTableRepository;

@Service
public class OrderDAO {
	
	@Autowired
	OrderTableRepository orderrepository;
	
	
	

}
