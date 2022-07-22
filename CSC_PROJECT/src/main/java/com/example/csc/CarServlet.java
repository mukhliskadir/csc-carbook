package com.example.csc;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CarServlet
 */
@WebServlet("/CarServlet")
public class CarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private CarDAO cd;
    public void init() {
        cd = new CarDAO();
    }
	
    public CarServlet() {
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
		   String action = request.getParameter("action");
	        try {
	            switch (action) {
	                case "addCar":
	                    addCar(request, response);
	                    break;
	                case "removeCar":
	                    removeCar(request,response);
	                    break;
	                case "updateCar":
	                    updateCar(request,response);
	                    break;
	                case "picked":
	                    changeStatus(request,response);
	                    break;
	                case "cancel":
	                    cancel(request, response);
	                    break;
	               
	            }

	        } catch (SQLException e) {
	            throw new ServletException(e);
	        }
	    
	}
	private void addCar(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {

        String brand = request.getParameter("carBrand");
        String model = request.getParameter("carModel");
        String plate = request.getParameter("carPlate");
        double price=Double.parseDouble(request.getParameter("carPrice"));
        String year = request.getParameter("carYear");

        Car c = new Car();

        c.setCarPlate(plate);
        c.setCarBrand(brand);
        c.setCarModel(model);
        c.setCarPrice(price);
        c.setCarYear(year);       

        cd.addCar(c);
        response.sendRedirect("ManageCar.jsp");
    }
	private void removeCar(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("carID"));
        cd.removeCar(id);
        response.sendRedirect("ManageCar.jsp");
    }
	private void updateCar(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String brand = request.getParameter("carBrand");
        String model = request.getParameter("carModel");
        String plate = request.getParameter("carPlate");
        double price=Double.parseDouble(request.getParameter("carPrice"));
        String year = request.getParameter("carYear");

        Car c = new Car();

        c.setCarPlate(plate);
        c.setCarBrand(brand);
        c.setCarModel(model);
        c.setCarPrice(price);
        c.setCarYear(year);       
        c.setId(id);

        cd.updateCar(c);

        response.sendRedirect("ManageCar.jsp");
    }
	private void changeStatus(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
       int car = Integer.parseInt(request.getParameter("carid"));
       int book = Integer.parseInt(request.getParameter("bookid"));

        Car c = new Car();
        Booking b= new Booking();
        b.setId(book);
        	c.setId(car); 
        	
        cd.status(c);
        cd.bstatus(b);
        
        response.sendRedirect("staff-pickupCar.jsp");

	}
	private void cancel(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
		response.sendRedirect("speakerlist.jsp");
	}
}
