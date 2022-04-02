package com.homemate.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homemate.entities.ServicesTbl;
import com.homemate.entities.VendorTbl;
import com.homemate.repository.ServiceRepository;

@Service
public class ServiceDAO {

	@Autowired
	ServiceRepository servicerepository;

	
	public List<ServicesTbl> displayallservices()
	{
		return servicerepository.findAll();
	}
	
	public List<ServicesTbl> servicedetails(String servicename)
	{
		return servicerepository.getByServiceType(servicename);
	}
	
	public ServicesTbl getservicebyId(int serviceid)
	{
		return servicerepository.getById(serviceid);
	}

	public List<ServicesTbl> getAllServices(int vendorID) {
		List<ServicesTbl> services = servicerepository.vendorServices(vendorID);
		return services;
	}
	
	public void insertService( int serviceCost, String serviceDiscount, String serviceTimeHrs,
			String serviceType, VendorTbl vendor)
	{

		ServicesTbl services = new ServicesTbl(serviceCost, serviceDiscount,
				serviceTimeHrs, serviceType, vendor); 
		servicerepository.save(services);

	}

	public void deletetheService(int id) {
		servicerepository.deleteById(id);
		
	}

	public ServicesTbl editTheService(int id) {
		ServicesTbl service = servicerepository.getById(id);
		return service;
	}
	
	public ServicesTbl editTheService(int id,int serviceCost, String serviceDiscount, String serviceTimeHrs,
			String serviceType, VendorTbl vendor) {
		
		ServicesTbl service = new ServicesTbl(id,serviceCost, serviceDiscount, serviceTimeHrs, serviceType,vendor);
		servicerepository.save(service);
		return service;
	}

}
