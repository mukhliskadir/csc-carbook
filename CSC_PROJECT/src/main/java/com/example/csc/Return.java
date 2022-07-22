package com.example.csc;

import java.io.Serializable;
import java.sql.Date;

public class Return implements Serializable {


	private static final long serialVersionUID = 1L;
	public int id;
	public Date returnDate;
	public int returnElapse;
	public double returnFine;
	public int bookid;

	public Return() {}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getReturnDate() {
		return returnDate;
	}

	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}

	public int getReturnElapse() {
		return returnElapse;
	}

	public void setReturnElapse(int returnElapse) {
		this.returnElapse = returnElapse;
	}
	
	
	

	public double getReturnFine() {
		return returnFine;
	}

	public void setReturnFine(double returnFine) {
		this.returnFine = returnFine;
	}

	public int getBookid() {
		return bookid;
	}

	public void setBookid(int bookid) {
		this.bookid = bookid;
	}
	
	
}
