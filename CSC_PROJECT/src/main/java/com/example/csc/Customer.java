package com.example.csc;

import java.io.Serializable;

public class Customer implements Serializable {


	private static final long serialVersionUID = 1L;
	public int id;
	public String custName;
	public String custPhone;
	public String custNric;
	public String custAddress;
	public String custUsername;
	public String custPassword;
	public String custLicense;
	
	public Customer() {}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCustName() {
		return custName;
	}

	public void setCustName(String custName) {
		this.custName = custName;
	}

	public String getCustPhone() {
		return custPhone;
	}

	public void setCustPhone(String custPhone) {
		this.custPhone = custPhone;
	}

	public String getCustNric() {
		return custNric;
	}

	public void setCustNric(String custNric) {
		this.custNric = custNric;
	}

	public String getCustAddress() {
		return custAddress;
	}

	public void setCustAddress(String custAddress) {
		this.custAddress = custAddress;
	}

	public String getCustUsername() {
		return custUsername;
	}

	public void setCustUsername(String custUsername) {
		this.custUsername = custUsername;
	}

	public String getCustPassword() {
		return custPassword;
	}

	public void setCustPassword(String custPassword) {
		this.custPassword = custPassword;
	}

	public String getCustLicense() {
		return custLicense;
	}

	public void setCustLicense(String custLicense) {
		this.custLicense = custLicense;
	}
	
}
