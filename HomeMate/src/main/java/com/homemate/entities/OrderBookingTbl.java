package com.homemate.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the order_booking_tbl database table.
 * 
 */
@Entity
@Table(name="order_booking_tbl")
@NamedQuery(name="OrderBookingTbl.findAll", query="SELECT o FROM OrderBookingTbl o")
public class OrderBookingTbl implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="booking_id")
	private int bookingId;

	@Temporal(TemporalType.DATE)
	@Column(name="booking_feedback_date")
	private Date bookingFeedbackDate;

	@Temporal(TemporalType.DATE)
	@Column(name="booking_ordered_date")
	private Date bookingOrderedDate;

	@Column(name="booking_rating")
	private String bookingRating;

	@Column(name="booking_review")
	private String bookingReview;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="booking_schedule_date_time")
	private Date bookingScheduleDateTime;

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

	//bi-directional many-to-one association to OrderTbl
	@ManyToOne
	@JoinColumn(name="booking_order_id")
	private OrderTbl orderTbl;

	//bi-directional many-to-one association to ServicesTbl
	@ManyToOne
	@JoinColumn(name="booking_service_id")
	private ServicesTbl servicesTbl;

	public OrderBookingTbl() {
	}

	public int getBookingId() {
		return this.bookingId;
	}

	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
	}

	public Date getBookingFeedbackDate() {
		return this.bookingFeedbackDate;
	}

	public void setBookingFeedbackDate(Date bookingFeedbackDate) {
		this.bookingFeedbackDate = bookingFeedbackDate;
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

	public Date getBookingScheduleDateTime() {
		return this.bookingScheduleDateTime;
	}

	public void setBookingScheduleDateTime(Date bookingScheduleDateTime) {
		this.bookingScheduleDateTime = bookingScheduleDateTime;
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

	public OrderTbl getOrderTbl() {
		return this.orderTbl;
	}

	public void setOrderTbl(OrderTbl orderTbl) {
		this.orderTbl = orderTbl;
	}

	public ServicesTbl getServicesTbl() {
		return this.servicesTbl;
	}

	public void setServicesTbl(ServicesTbl servicesTbl) {
		this.servicesTbl = servicesTbl;
	}

}