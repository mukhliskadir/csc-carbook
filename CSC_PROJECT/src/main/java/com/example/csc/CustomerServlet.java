package com.example.csc;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/CustomerServlet")
public class CustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	private CustomerDAO cd;
  public void init() {
      cd = new CustomerDAO();
  }
	
    public CustomerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		   String action = request.getParameter("action");
	        try {
	            switch (action) {
	                case "custSignup":
	                	custSignup(request, response);
	                    break;
	                case "cancel":
	                    cancel(request, response);
	                    break;
	               
	            }

	        } catch (SQLException e) {
	            throw new ServletException(e);
	        }
	    
	}
	private void custSignup(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {

        String name = request.getParameter("custName");
        String phone = request.getParameter("custPhone");
        String nric = request.getParameter("custNRIC");
        String address = request.getParameter("custAddress");
        String username = request.getParameter("custUsername");
        String password = request.getParameter("custPassword");
        String license = request.getParameter("custLicense");

        Customer cst = new Customer();
        
        cst.setCustName(name);
        cst.setCustPhone(phone);
        cst.setCustNric(nric);
        cst.setCustAddress(address);
        cst.setCustUsername(username);
        cst.setCustPassword(password);
        cst.setCustLicense(license);     

        cd.custSignup(cst);
        response.sendRedirect("index.jsp");
    }

	private void cancel(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
		response.sendRedirect("index.jsp");
	}
}
