package com.homemate.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.homemate.entities.CustomerTbl;

public interface CustomerRepository extends JpaRepository<CustomerTbl,Integer>{
	
	@Query(value="SELECT * FROM CUSTOMER_TBL C WHERE C.CUSTOMER_EMAIL=:username AND C.CUSTOMER_PASSWORD=:password",nativeQuery = true)
	public CustomerTbl loginCustomer(@Param("username") String username,@Param("password") String password);
	

}
