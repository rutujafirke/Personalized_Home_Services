package com.homemate.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.homemate.entities.ServicesTbl;

@Repository
public interface ServiceRepository extends JpaRepository<ServicesTbl, Integer>{

	
	@Query(value= "select * from services_tbl where service_type=:servicename",nativeQuery=true)
	public List<ServicesTbl> getByServiceType(@Param("servicename") String servicename);
	

	@Query(value = " SELECT * FROM SERVICES_TBL S WHERE S.SERVICE_VENDOR_ID=?",nativeQuery = true)
	public List<ServicesTbl> vendorServices(int vendorID);
	
}
