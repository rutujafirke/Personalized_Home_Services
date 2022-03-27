package com.homemate.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;

@Entity
@Table(name="services_tbl")
@NamedQuery(name="ServicesTbl.findAll", query="SELECT s FROM ServicesTbl s")
public class ServicesTbl implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="service_id")
	private int serviceId;

	@Column(name="service_cost")
	private int serviceCost;

	@Column(name="service_discount")
	private String serviceDiscount;

	@Column(name="service_time_hrs")
	private String serviceTimeHrs;

	@Column(name="service_type")
	private String serviceType;

	//bi-directional many-to-one association to OrderBookingTbl
	@OneToMany(mappedBy="servicesTbl")
	private List<OrderBookingTbl> orderBookingTbls;

	//bi-directional many-to-one association to VendorTbl
	@ManyToOne
	@JoinColumn(name="service_vendor_id")
	private VendorTbl vendorTbl;

	public ServicesTbl() {
	}

	public int getServiceId() {
		return this.serviceId;
	}

	public void setServiceId(int serviceId) {
		this.serviceId = serviceId;
	}

	public int getServiceCost() {
		return this.serviceCost;
	}

	public void setServiceCost(int serviceCost) {
		this.serviceCost = serviceCost;
	}

	public String getServiceDiscount() {
		return this.serviceDiscount;
	}

	public void setServiceDiscount(String serviceDiscount) {
		this.serviceDiscount = serviceDiscount;
	}

	public String getServiceTimeHrs() {
		return this.serviceTimeHrs;
	}

	public void setServiceTimeHrs(String serviceTimeHrs) {
		this.serviceTimeHrs = serviceTimeHrs;
	}

	public String getServiceType() {
		return this.serviceType;
	}

	public void setServiceType(String serviceType) {
		this.serviceType = serviceType;
	}

	public List<OrderBookingTbl> getOrderBookingTbls() {
		return this.orderBookingTbls;
	}

	public void setOrderBookingTbls(List<OrderBookingTbl> orderBookingTbls) {
		this.orderBookingTbls = orderBookingTbls;
	}

	public OrderBookingTbl addOrderBookingTbl(OrderBookingTbl orderBookingTbl) {
		getOrderBookingTbls().add(orderBookingTbl);
		orderBookingTbl.setServicesTbl(this);

		return orderBookingTbl;
	}

	public OrderBookingTbl removeOrderBookingTbl(OrderBookingTbl orderBookingTbl) {
		getOrderBookingTbls().remove(orderBookingTbl);
		orderBookingTbl.setServicesTbl(null);

		return orderBookingTbl;
	}

	public VendorTbl getVendorTbl() {
		return this.vendorTbl;
	}

	public void setVendorTbl(VendorTbl vendorTbl) {
		this.vendorTbl = vendorTbl;
	}

}