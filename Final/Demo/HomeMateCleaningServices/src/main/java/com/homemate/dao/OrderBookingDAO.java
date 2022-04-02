package com.homemate.dao;

import java.util.Date;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homemate.entities.CustomerTbl;
import com.homemate.entities.OrderBookingTbl;
import com.homemate.entities.ServicesTbl;
import com.homemate.repository.OrderBookingRepository;

@Service
public class OrderBookingDAO {

	@Autowired
	OrderBookingRepository repository;

	public List<OrderBookingTbl> getAllOrders(int id) {
		List<OrderBookingTbl> list = repository.getPendingOrdersByVendorId(id);
		return list;
	}


	public List<OrderBookingTbl> getAllSchedule(int id) {
		List<OrderBookingTbl> list = repository.getScheduledOrdersByVendorId(id);
		return list;
	}


	public void acceptTheOrder(int id) {
		OrderBookingTbl order = repository.getById(id);
		order.setBookingStatus("Scheduled");
		repository.save(order);
	}
	
	public void findAndDeletetheOrder(int id) {
		repository.deleteById(id);
		
	}
	
	public List<OrderBookingTbl> getFeedbackReview(int id) {
		List<OrderBookingTbl> list = repository.getFeedbackByVendorID(id);
		return list;
	}


	public List<OrderBookingTbl> getAllFeedback() {
		List<OrderBookingTbl> list = repository.getAllFeedbackReview();
		return list;
	}


	public List<OrderBookingTbl> getAllPendingOrders() {
		List<OrderBookingTbl> list = repository.getAllPendingOrders();
		return list;
	}


	public List<OrderBookingTbl> getAllScheduleOrders() {
		List<OrderBookingTbl> list = repository.getAllScheduledOrders();
		return list;
	}
	


	
	public void insertbooking(String address,CustomerTbl customer, ServicesTbl service,Date sheduledate,String scheduletime,int cost )
	{
		OrderBookingTbl ordertable = new OrderBookingTbl(sheduledate,scheduletime,address,cost,customer,service);
		repository.save(ordertable);
	
	}
	
	public List<OrderBookingTbl> getbycustomerib(int custid)
	{
		return repository.findAll();
	}
	
	public List<OrderBookingTbl> getbooking(int custid)
	{
		return repository.getByCustomerId(custid);
	}


	public List<OrderBookingTbl> getAllDeliveredOrders(int id)
	{
		List<OrderBookingTbl> list = repository.getAllDeliveredOrders(id);
		
		
		return list;
	}


	public OrderBookingTbl getById(int id)
	{
		
		return repository.getById(id);
	}


	public void insertfeedbackdetails(int bookid, String message, String rating) 
	{
		OrderBookingTbl tbl = repository.getById(bookid);
		tbl.setBookingReview(message);
		tbl.setBookingRating(rating);
		repository.save(tbl);
		
	}
	public void updateDeliveryStatus(int id) {
		OrderBookingTbl order = repository.getById(id);
		order.setBookingStatus("Delivered");
		repository.save(order);
		
	}
}
