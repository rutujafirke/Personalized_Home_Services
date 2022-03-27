package com.homemate.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the order_tbl database table.
 * 
 */
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

	//bi-directional many-to-one association to OrderBookingTbl
	@OneToMany(mappedBy="orderTbl")
	private List<OrderBookingTbl> orderBookingTbls;

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

	public List<OrderBookingTbl> getOrderBookingTbls() {
		return this.orderBookingTbls;
	}

	public void setOrderBookingTbls(List<OrderBookingTbl> orderBookingTbls) {
		this.orderBookingTbls = orderBookingTbls;
	}

	public OrderBookingTbl addOrderBookingTbl(OrderBookingTbl orderBookingTbl) {
		getOrderBookingTbls().add(orderBookingTbl);
		orderBookingTbl.setOrderTbl(this);

		return orderBookingTbl;
	}

	public OrderBookingTbl removeOrderBookingTbl(OrderBookingTbl orderBookingTbl) {
		getOrderBookingTbls().remove(orderBookingTbl);
		orderBookingTbl.setOrderTbl(null);

		return orderBookingTbl;
	}

	public CustomerTbl getCustomerTbl() {
		return this.customerTbl;
	}

	public void setCustomerTbl(CustomerTbl customerTbl) {
		this.customerTbl = customerTbl;
	}

}