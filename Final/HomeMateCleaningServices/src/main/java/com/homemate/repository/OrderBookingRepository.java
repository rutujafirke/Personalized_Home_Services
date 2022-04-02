package com.homemate.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.homemate.entities.OrderBookingTbl;

public interface OrderBookingRepository extends JpaRepository<OrderBookingTbl, Integer> {

	@Query(value="select * from order_booking_tbl where booking_customer_id=:custid",nativeQuery=true)
	public List<OrderBookingTbl> getByCustomerId(@Param("custid") int custid);
	
	//select * from order_booking_tbl o inner join services_tbl s on o.booking_service_id=s.service_id where s.service_vendor_id=1003;
		@Query(value = "SELECT * FROM ORDER_BOOKING_TBL O INNER JOIN SERVICES_TBL S ON O.BOOKING_SERVICE_ID=S.SERVICE_ID WHERE S.SERVICE_VENDOR_ID=? AND O.BOOKING_STATUS='PENDING'",nativeQuery = true)
		public List<OrderBookingTbl> getPendingOrdersByVendorId(int vendorId);

		@Query(value = "SELECT * FROM ORDER_BOOKING_TBL O INNER JOIN SERVICES_TBL S ON O.BOOKING_SERVICE_ID=S.SERVICE_ID WHERE S.SERVICE_VENDOR_ID=? AND O.BOOKING_STATUS='SCHEDULED'",nativeQuery = true)
		public List<OrderBookingTbl> getScheduledOrdersByVendorId(int vendorId);
		
		//select * from order_booking_tbl o inner join services_tbl s on o.booking_service_id=s.service_id where s.service_vendor_id=1003 and booking_review is not null;
		@Query(value = "SELECT * FROM ORDER_BOOKING_TBL O INNER JOIN SERVICES_TBL S ON O.BOOKING_SERVICE_ID=S.SERVICE_ID WHERE S.SERVICE_VENDOR_ID=? AND BOOKING_REVIEW IS NOT NULL",nativeQuery = true)
		public List<OrderBookingTbl> getFeedbackByVendorID(int vendorId);
		
		@Query(value = "SELECT * FROM ORDER_BOOKING_TBL O WHERE BOOKING_REVIEW IS NOT NULL",nativeQuery = true)
		public List<OrderBookingTbl> getAllFeedbackReview();
		
		@Query(value = "SELECT * FROM ORDER_BOOKING_TBL O WHERE O.BOOKING_STATUS='BOOKING PENDING'",nativeQuery = true)
		public List<OrderBookingTbl> getAllPendingOrders();

		@Query(value = "SELECT * FROM ORDER_BOOKING_TBL O WHERE O.BOOKING_STATUS='SCHEDULED'",nativeQuery = true)
		public List<OrderBookingTbl> getAllScheduledOrders();
		
		@Query(value = "SELECT * FROM ORDER_BOOKING_TBL O WHERE O.BOOKING_STATUS='DELIVERED' AND booking_customer_id=? AND BOOKING_REVIEW IS NULL",nativeQuery = true)
		public List<OrderBookingTbl> getAllDeliveredOrders(int custid);
		
}
