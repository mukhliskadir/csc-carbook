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
 * Servlet implementation class ReturnServlet
 */
@WebServlet("/ReturnServlet")
public class ReturnServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 private ReturnDAO rd;
	    public void init() {
	        rd = new ReturnDAO();
	    }
	    
	    
    public ReturnServlet() {
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
	                case "return":
	                	returnCar(request, response);
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
	private void returnCar(HttpServletRequest request, HttpServletResponse response)
	        throws SQLException, IOException, ServletException, ParseException {

	    int book = Integer.parseInt(request.getParameter("bookid"));
	    int car = Integer.parseInt(request.getParameter("car"));

	    double fee = Double.parseDouble(request.getParameter("fee"));
	    	    
	    String bookreturn = request.getParameter("date");
	    String returndate = request.getParameter("returnDate");

	    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	    java.util.Date date1 = format.parse(bookreturn);
	    java.util.Date date2 = format.parse(returndate);
	    
	    long diffDays = date2.getTime() - date1.getTime();    // difference in ms
	    diffDays = diffDays/1000/3600/24; 
	    double days =(double) diffDays;  
	    int dayz = (int) diffDays;
	    
	    double total;
	    double fine;
	    fine=days*150;
	    total=fine+fee;
	   
	     
	    Booking b = new Booking();
	    Return r = new Return();
	    Car c= new Car();
	    			 	   
	    b.setBookFee(total);
	    b.setId(book);
		
	    r.setReturnDate(Date.valueOf(returndate));
	    r.setReturnElapse(dayz);
	    r.setReturnFine(fine);
	    r.setBookid(book);

	    c.setId(car);
	    
	    rd.status(c);
        rd.bstatus(b);
        rd.rstatus(r);

	    response.sendRedirect("staff-returnCar.jsp");
	}

private void cancel(HttpServletRequest request, HttpServletResponse response)
        throws SQLException, IOException {
	response.sendRedirect("staff-returnConfirm.jsp");
}}
