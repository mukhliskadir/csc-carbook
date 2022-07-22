package com.example.csc;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


/**
 * Servlet implementation class BookingServlet
 */
@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    private BookingDAO bd;
    public void init() {
        bd = new BookingDAO();
    }
    public BookingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 response.setContentType("text/html");

	        String action = request.getParameter("action");
	        try {
	            switch (action) {
	                case "bookCar":
	                	bookCar(request, response);
	                    break;
	                case "approveBooking":
	                	approveBooking(request, response);
	                    break;
	                case "removeBooking":
	                	removeBooking(request, response);
	                    break;
	                case "returned":
	                	returned(request, response);
	                    break;
	                case "cancel":
	                    cancel(request, response);
	                    break;
	               
	            }

	        } catch (SQLException e) {
	            throw new ServletException(e);
	        } catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	private void bookCar(HttpServletRequest request, HttpServletResponse response)
	        throws SQLException, IOException, ServletException, ParseException {

	    int car = Integer.parseInt(request.getParameter("carid"));
	    double price = Double.parseDouble(request.getParameter("price"));
	    	    
	    String pickdate = request.getParameter("pickDate");
	    String returndate = request.getParameter("returnDate");

	    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	    java.util.Date date1 = format.parse(pickdate);
	    java.util.Date date2 = format.parse(returndate);
	    
	    long diffDays = date2.getTime() - date1.getTime();    // difference in ms
	    diffDays = diffDays/1000/3600/24; 
	    double days =(double) diffDays;  
	    
	    double total;
	    total=days*price;
	   
		 HttpSession session=request.getSession();  
	     int cust = (Integer) session.getAttribute("custid");
	    
	     
	    Booking b = new Booking();

	    b.setCarID(car);
	    b.setBookDate(Date.valueOf(pickdate));
	    b.setReturnDate(Date.valueOf(returndate));
	    b.setBookFee(total);
	    b.setCustID(cust);
	    
	    bd.bookCar(b);
	    response.sendRedirect("cust-Booklist.jsp");
	}	
	
	private void approveBooking(HttpServletRequest request, HttpServletResponse response)
	        throws SQLException, IOException {

	    int bookid= Integer.parseInt(request.getParameter("bookid"));
	   
		 HttpSession session=request.getSession();  
	     int staff = (Integer) session.getAttribute("staffid");
	    
	     
	    Booking b = new Booking();

	    b.setId(bookid);
	    b.setStaffID(staff);
	    
	    bd.approve(b);
	    response.sendRedirect("staff-bookList.jsp");
	}
	private void removeBooking(HttpServletRequest request, HttpServletResponse response)
	        throws SQLException, IOException {

	    int bookid= Integer.parseInt(request.getParameter("bookid"));
	   
		 HttpSession session=request.getSession();  
	     int staff = (Integer) session.getAttribute("staffid");
	    
	     
	    Booking b = new Booking();

	    b.setId(bookid);
	    b.setStaffID(staff);
	    
	    bd.remove(b);
	    response.sendRedirect("staff-bookList.jsp");
	}
	private void returned(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
       int car = Integer.parseInt(request.getParameter("carid"));
       int book = Integer.parseInt(request.getParameter("bookid"));

        Car c = new Car();
        Booking b= new Booking();
        b.setId(book);
        	c.setId(car); 
        	
        bd.status(c);
        bd.bstatus(b);
        
        response.sendRedirect("staff-returnCar.jsp");

	}
	
	private void cancel(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
		response.sendRedirect("cust-bookCar.jsp");
	}
}


