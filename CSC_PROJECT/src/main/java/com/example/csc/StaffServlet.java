package com.example.csc;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.InputStream;
import javax.servlet.http.Part;

/**
 * Servlet implementation class StaffServlet
 */
@WebServlet("/StaffServlet")
public class StaffServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 private StaffDao Sd;
	    public void init() {
	        Sd = new StaffDao();
	    }

	    
    public StaffServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
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
	                case "addStaff":
	                    addStaff(request, response);
	                    break;
	                case "deleteStaff":
	                    deleteStaff(request,response);
	                    break;
	         
	              case "updateStaff":
	            	  updateStaff(request,response);
	                    break;
	                case "cancel":
	                    cancel(request, response);
	                    break;

	            }

	        } catch (SQLException e) {
	            throw new ServletException(e);
	        }

	    }
	 private void addStaff(HttpServletRequest request, HttpServletResponse response)
	            throws SQLException, IOException, ServletException {
	
		 
	        String name = request.getParameter("staffName");
	        String phone = request.getParameter("staffPhone");
	        String role = request.getParameter("staffRole");
	        String username = request.getParameter("staffUsername");
	        String password = request.getParameter("staffPassword");
	        int svid = Integer.parseInt(request.getParameter("supervisor"));
	        
	      
	        
	        Staff s= new Staff();

	        s.setStaffName(name);
	        s.setStaffPhone(phone);
	        s.setStaffRole(role);
	        s.setStaffUsername(username);
	        s.setStaffPassword(password);
	        s.setSvid(svid);
	        
	        
	        
	        
	        Sd.addStaff(s);
	        response.sendRedirect("ManageStaff.jsp");
	    }
	    private void deleteStaff(HttpServletRequest request, HttpServletResponse response)
	            throws SQLException, IOException {
	        int id = Integer.parseInt(request.getParameter("staff"));
	        Sd.deleteStaff(id);
	        response.sendRedirect("ManageStaff.jsp");
	    }
	    
	    private void updateStaff(HttpServletRequest request, HttpServletResponse response)
	            throws SQLException, IOException, ServletException {
	
		 
	        String name = request.getParameter("staffName");
	        String phone = request.getParameter("staffPhone");
	        String username = request.getParameter("staffUsername");
	        String password = request.getParameter("staffPassword");

	        int id = Integer.parseInt(request.getParameter("id"));
	        	
	       
	        Staff s= new Staff();

	        s.setStaffName(name);
	        s.setStaffPhone(phone);
	        s.setStaffUsername(username);
	        s.setStaffPassword(password);
	        s.setId(id);
	        
	        
	        
	        Sd.updateStaff(s);
	        response.sendRedirect("ManageStaff.jsp");
	    }
	    private void cancel(HttpServletRequest request, HttpServletResponse response)
	            throws SQLException, IOException {
	        
	        response.sendRedirect("ManageStaff.jsp");
	    }
}
