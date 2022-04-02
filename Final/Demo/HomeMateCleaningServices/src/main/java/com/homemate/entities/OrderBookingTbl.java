package com.homemate.entities;

import java.io.Serializable;
import javax.persistence.*;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

import java.util.Date;

@Entity
@Table(name="order_booking_tbl")
@NamedQuery(name="OrderBookingTbl.findAll", query="SELECT o FROM OrderBookingTbl o")
public class OrderBookingTbl implements Serializable {
	private static final long serialVersionUID = 1L;
	
	
	@Id
	@GeneratedValue(generator = "sequence-generator")
	@GenericGenerator(name = "sequence-generator",
	strategy = "org.hibernate.id.enhanced.SequenceStyleGenerator",parameters = 
	{
		@Parameter(name = "sequence_name", value = "user_sequence"),
		@Parameter(name = "initial_value", value = "1000"),
		@Parameter(name = "increment_size", value = "1")
	})
	
	@Column(name="booking_id")
	private int bookingId;

	@Temporal(TemporalType.DATE)
	@CreationTimestamp
	@Column(name="booking_ordered_date")
	private Date bookingOrderedDate;

	@Column(name="booking_rating")
	private String bookingRating;

	@Column(name="booking_review")
	private String bookingReview;

	
	@Column(name="booking_schedule_date")
	private Date bookingScheduleDate;
	
	@Column(name="booking_schedule_Time")
	private String bookingScheduleTime;

	@Column(name="booking_service_address")
	private String bookingServiceAddress;

	@Column(name="booking_service_cost")
	private int bookingServiceCost;

	@Column(name="booking_status")
	private String bookingStatus;

	//bi-directional many-to-one association to CustomerTbl
	@ManyToOne
	@JoinColumn(name="booking_customer_id")
	private CustomerTbl customerTbl;

	//bi-directional many-to-one association to ServicesTbl
	@ManyToOne
	@JoinColumn(name="booking_service_id")
	private ServicesTbl servicesTbl;

	
		
	

	public OrderBookingTbl() {
		super();
	}


	public OrderBookingTbl(int bookingId, Date bookingFeedbackDate, Date bookingOrderedDate, String bookingRating,
			String bookingReview, Date bookingScheduleDate, String bookingScheduleTime, String bookingServiceAddress,
			int bookingServiceCost, String bookingStatus, CustomerTbl customerTbl, OrderTbl orderTbl,
			ServicesTbl servicesTbl) {
		super();
		this.bookingId = bookingId;
		this.bookingOrderedDate = bookingOrderedDate;
		this.bookingRating = bookingRating;
		this.bookingReview = bookingReview;
		this.bookingScheduleDate = bookingScheduleDate;
		this.bookingScheduleTime = bookingScheduleTime;
		this.bookingServiceAddress = bookingServiceAddress;
		this.bookingServiceCost = bookingServiceCost;
		this.bookingStatus = bookingStatus;
		this.customerTbl = customerTbl;
		this.servicesTbl = servicesTbl;
	}


	public OrderBookingTbl( Date bookingScheduleDate,String bookingScheduleTime,
			String bookingServiceAddress, int bookingServiceCost, CustomerTbl customerTbl,
			ServicesTbl servicesTbl) {
		super();
		
		this.bookingScheduleDate =bookingScheduleDate ;
		this.bookingScheduleTime = bookingScheduleTime;
		this.bookingServiceAddress = bookingServiceAddress;
		this.bookingServiceCost = bookingServiceCost;
		this.customerTbl = customerTbl;
		this.servicesTbl = servicesTbl;
		this.bookingStatus = "Pending";
		
	}


	public int getBookingId() {
		return this.bookingId;
	}

	
	public Date getBookingScheduleDate() {
		return bookingScheduleDate;
	}


	public void setBookingScheduleDate(Date bookingScheduleDate) {
		this.bookingScheduleDate = bookingScheduleDate;
	}


	public String getBookingScheduleTime() {
		return bookingScheduleTime;
	}


	public void setBookingScheduleTime(String bookingScheduleTime) {
		this.bookingScheduleTime = bookingScheduleTime;
	}


	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
	}

	public Date getBookingOrderedDate() {
		return this.bookingOrderedDate;
	}

	public void setBookingOrderedDate(Date bookingOrderedDate) {
		this.bookingOrderedDate = bookingOrderedDate;
	}

	public String getBookingRating() {
		return this.bookingRating;
	}

	public void setBookingRating(String bookingRating) {
		this.bookingRating = bookingRating;
	}

	public String getBookingReview() {
		return this.bookingReview;
	}
	
	
	public void setBookingReview(String bookingReview) {
		this.bookingReview = bookingReview;
	}
	
	

	public String getBookingServiceAddress() {
		return this.bookingServiceAddress;
	}

	public void setBookingServiceAddress(String bookingServiceAddress) {
		this.bookingServiceAddress = bookingServiceAddress;
	}

	public int getBookingServiceCost() {
		return this.bookingServiceCost;
	}

	public void setBookingServiceCost(int bookingServiceCost) {
		this.bookingServiceCost = bookingServiceCost;
	}

	public String getBookingStatus() {
		return this.bookingStatus;
	}

	public void setBookingStatus(String bookingStatus) {
		this.bookingStatus = bookingStatus;
	}

	public CustomerTbl getCustomerTbl() {
		return this.customerTbl;
	}

	public void setCustomerTbl(CustomerTbl customerTbl) {
		this.customerTbl = customerTbl;
	}



	public ServicesTbl getServicesTbl() {
		return this.servicesTbl;
	}

	public void setServicesTbl(ServicesTbl servicesTbl) {
		this.servicesTbl = servicesTbl;
	}
	

}