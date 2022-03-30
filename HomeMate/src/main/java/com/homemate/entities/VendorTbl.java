package com.homemate.entities;

import java.io.Serializable;
import javax.persistence.*;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

import java.util.List;

@Entity
@Table(name="vendor_tbl")
@NamedQuery(name="VendorTbl.findAll", query="SELECT v FROM VendorTbl v")
public class VendorTbl implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(generator = "sequence-generator")
	@GenericGenerator(name = "sequence-generator",
	strategy = "org.hibernate.id.enhanced.SequenceStyleGenerator",parameters = 
	{
		@Parameter(name = "sequence_name", value = "user_sequence"),
		@Parameter(name = "initial_value", value = "200"),
		@Parameter(name = "increment_size", value = "1")
	})
	@Column(name="vendor_id")
	private int vendorId;

	@Column(name="vendor_address")
	private String vendorAddress;

	@Column(name="vendor_city")
	private String vendorCity;

	@Column(name="vendor_email")
	private String vendorEmail;

	@Column(name="vendor_firstname")
	private String vendorFirstname;

	@Lob
	@Column(name="vendor_image")
	private byte[] vendorImage;

	@Column(name="vendor_lastname")
	private String vendorLastname;

	@Column(name="vendor_mobile")
	private String vendorMobile;

	@Column(name="vendor_password")
	private String vendorPassword;

	@Column(name="vendor_pincode")
	private int vendorPincode;

	@Column(name="vendor_username")
	private String vendorUsername;

	//bi-directional many-to-one association to ServicesTbl
	@OneToMany(mappedBy="vendorTbl")
	private List<ServicesTbl> servicesTbls;

	public VendorTbl() {
	}

	public int getVendorId() {
		return this.vendorId;
	}

	public void setVendorId(int vendorId) {
		this.vendorId = vendorId;
	}

	public String getVendorAddress() {
		return this.vendorAddress;
	}

	public void setVendorAddress(String vendorAddress) {
		this.vendorAddress = vendorAddress;
	}

	public String getVendorCity() {
		return this.vendorCity;
	}

	public void setVendorCity(String vendorCity) {
		this.vendorCity = vendorCity;
	}

	public String getVendorEmail() {
		return this.vendorEmail;
	}

	public void setVendorEmail(String vendorEmail) {
		this.vendorEmail = vendorEmail;
	}

	public String getVendorFirstname() {
		return this.vendorFirstname;
	}

	public void setVendorFirstname(String vendorFirstname) {
		this.vendorFirstname = vendorFirstname;
	}

	public byte[] getVendorImage() {
		return this.vendorImage;
	}

	public void setVendorImage(byte[] vendorImage) {
		this.vendorImage = vendorImage;
	}

	public String getVendorLastname() {
		return this.vendorLastname;
	}

	public void setVendorLastname(String vendorLastname) {
		this.vendorLastname = vendorLastname;
	}

	public String getVendorMobile() {
		return this.vendorMobile;
	}

	public void setVendorMobile(String vendorMobile) {
		this.vendorMobile = vendorMobile;
	}

	public String getVendorPassword() {
		return this.vendorPassword;
	}

	public void setVendorPassword(String vendorPassword) {
		this.vendorPassword = vendorPassword;
	}

	public int getVendorPincode() {
		return this.vendorPincode;
	}

	public void setVendorPincode(int vendorPincode) {
		this.vendorPincode = vendorPincode;
	}

	public String getVendorUsername() {
		return this.vendorUsername;
	}

	public void setVendorUsername(String vendorUsername) {
		this.vendorUsername = vendorUsername;
	}

	public List<ServicesTbl> getServicesTbls() {
		return this.servicesTbls;
	}

	public void setServicesTbls(List<ServicesTbl> servicesTbls) {
		this.servicesTbls = servicesTbls;
	}

	public ServicesTbl addServicesTbl(ServicesTbl servicesTbl) {
		getServicesTbls().add(servicesTbl);
		servicesTbl.setVendorTbl(this);

		return servicesTbl;
	}

	public ServicesTbl removeServicesTbl(ServicesTbl servicesTbl) {
		getServicesTbls().remove(servicesTbl);
		servicesTbl.setVendorTbl(null);

		return servicesTbl;
	}

}