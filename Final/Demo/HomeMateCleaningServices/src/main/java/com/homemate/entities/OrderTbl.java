package com.homemate.entities;

import java.io.Serializable;
import javax.persistence.*;


@Entity
@Table(name="order_tbl")
@NamedQuery(name="OrderTbl.findAll", query="SELECT o FROM OrderTbl o")
public class OrderTbl implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="order_id")
	private int orderId;

	@Column(name="order_status")
	private String orderStatus;

	@Column(name="order_total_amount")
	private int orderTotalAmount;


	//bi-directional many-to-one association to CustomerTbl
	@ManyToOne
	@JoinColumn(name="order_customer_id")
	private CustomerTbl customerTbl;

	public OrderTbl() {
	}

	public int getOrderId() {
		return this.orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public String getOrderStatus() {
		return this.orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public int getOrderTotalAmount() {
		return this.orderTotalAmount;
	}

	public void setOrderTotalAmount(int orderTotalAmount) {
		this.orderTotalAmount = orderTotalAmount;
	}


	public CustomerTbl getCustomerTbl() {
		return this.customerTbl;
	}

	public void setCustomerTbl(CustomerTbl customerTbl) {
		this.customerTbl = customerTbl;
	}

}