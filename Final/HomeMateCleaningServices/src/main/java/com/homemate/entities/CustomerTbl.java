package com.homemate.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;


@Entity
@Table(name="customer_tbl")
@NamedQuery(name="CustomerTbl.findAll", query="SELECT c FROM CustomerTbl c")
public class CustomerTbl implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(generator = "sequence-generator")
	@GenericGenerator(name = "sequence-generator",
	strategy = "org.hibernate.id.enhanced.SequenceStyleGenerator",parameters = 
	{
		@Parameter(name = "sequence_name", value = "user_sequence"),
		@Parameter(name = "initial_value", value = "100"),
		@Parameter(name = "increment_size", value = "1")
	})
	
	@Column(name="customer_id")
	private int customerId;

	@Column(name="customer_address")
	private String customerAddress;

	@Column(name="customer_city")
	private String customerCity;

	@Column(name="customer_email")
	private String customerEmail;

	@Column(name="customer_firstname")
	private String customerFirstname;

	@Column(name="customer_lastname")
	private String customerLastname;

	@Column(name="customer_mobile")
	private String customerMobile;

	@Column(name="customer_password")
	private String customerPassword;

	@Column(name="customer_pincode")
	private int customerPincode;

	@Column(name="customer_username")
	private String customerUsername;

	//bi-directional many-to-one association to OrderBookingTbl
	@OneToMany(mappedBy="customerTbl")
	private List<OrderBookingTbl> orderBookingTbls;

	//bi-directional many-to-one association to OrderTbl
	@OneToMany(mappedBy="customerTbl")
	private List<OrderTbl> orderTbls;

	public CustomerTbl() {
	}

	
	public CustomerTbl(String customerAddress, String customerCity, String customerEmail,
			String customerFirstname, String customerLastname, String customerMobile, String customerPassword,
			int customerPincode, String customerUsername) {
		super();
		
		this.customerAddress = customerAddress;
		this.customerCity = customerCity;
		this.customerEmail = customerEmail;
		this.customerFirstname = customerFirstname;
		this.customerLastname = customerLastname;
		this.customerMobile = customerMobile;
		this.customerPassword = customerPassword;
		this.customerPincode = customerPincode;
		this.customerUsername = customerUsername;
	}


	public int getCustomerId() {
		return this.customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public String getCustomerAddress() {
		return this.customerAddress;
	}

	public void setCustomerAddress(String customerAddress) {
		this.customerAddress = customerAddress;
	}

	public String getCustomerCity() {
		return this.customerCity;
	}

	public void setCustomerCity(String customerCity) {
		this.customerCity = customerCity;
	}

	public String getCustomerEmail() {
		return this.customerEmail;
	}

	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}

	public String getCustomerFirstname() {
		return this.customerFirstname;
	}

	public void setCustomerFirstname(String customerFirstname) {
		this.customerFirstname = customerFirstname;
	}

	public String getCustomerLastname() {
		return this.customerLastname;
	}

	public void setCustomerLastname(String customerLastname) {
		this.customerLastname = customerLastname;
	}

	public String getCustomerMobile() {
		return this.customerMobile;
	}

	public void setCustomerMobile(String customerMobile) {
		this.customerMobile = customerMobile;
	}

	public String getCustomerPassword() {
		return this.customerPassword;
	}

	public void setCustomerPassword(String customerPassword) {
		this.customerPassword = customerPassword;
	}

	public int getCustomerPincode() {
		return this.customerPincode;
	}

	public void setCustomerPincode(int customerPincode) {
		this.customerPincode = customerPincode;
	}

	public String getCustomerUsername() {
		return this.customerUsername;
	}

	public void setCustomerUsername(String customerUsername) {
		this.customerUsername = customerUsername;
	}

	public List<OrderBookingTbl> getOrderBookingTbls() {
		return this.orderBookingTbls;
	}

	public void setOrderBookingTbls(List<OrderBookingTbl> orderBookingTbls) {
		this.orderBookingTbls = orderBookingTbls;
	}

	public OrderBookingTbl addOrderBookingTbl(OrderBookingTbl orderBookingTbl) {
		getOrderBookingTbls().add(orderBookingTbl);
		orderBookingTbl.setCustomerTbl(this);

		return orderBookingTbl;
	}

	public OrderBookingTbl removeOrderBookingTbl(OrderBookingTbl orderBookingTbl) {
		getOrderBookingTbls().remove(orderBookingTbl);
		orderBookingTbl.setCustomerTbl(null);

		return orderBookingTbl;
	}

	public List<OrderTbl> getOrderTbls() {
		return this.orderTbls;
	}

	public void setOrderTbls(List<OrderTbl> orderTbls) {
		this.orderTbls = orderTbls;
	}

	public OrderTbl addOrderTbl(OrderTbl orderTbl) {
		getOrderTbls().add(orderTbl);
		orderTbl.setCustomerTbl(this);

		return orderTbl;
	}

	public OrderTbl removeOrderTbl(OrderTbl orderTbl) {
		getOrderTbls().remove(orderTbl);
		orderTbl.setCustomerTbl(null);

		return orderTbl;
	}

}