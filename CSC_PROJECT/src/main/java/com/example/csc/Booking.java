package com.example.csc;

import java.io.Serializable;
import java.sql.Date;

public class Booking implements Serializable {


	private static final long serialVersionUID = 1L;
	public int id;
	public Date bookDate;
	public Date returnDate;
	public double bookFee;
	public String bookstatus;
	public int custID;
	public int carID;
	public int staffID;
	
	public Booking() {}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getBookDate() {
		return bookDate;
	}

	public void setBookDate(Date bookDate) {
		this.bookDate = bookDate;
	}

	public Date getReturnDate() {
		return returnDate;
	}

	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}

	public double getBookFee() {
		return bookFee;
	}

	public void setBookFee(double bookFee) {
		this.bookFee = bookFee;
	}

	public int getCustID() {
		return custID;
	}
	

	public String getBookstatus() {
		return bookstatus;
	}

	public void setBookstatus(String bookstatus) {
		this.bookstatus = bookstatus;
	}

	public void setCustID(int custID) {
		this.custID = custID;
	}

	public int getCarID() {
		return carID;
	}

	public void setCarID(int carID) {
		this.carID = carID;
	}

	public int getStaffID() {
		return staffID;
	}

	public void setStaffID(int staffID) {
		this.staffID = staffID;
	}
	
}
