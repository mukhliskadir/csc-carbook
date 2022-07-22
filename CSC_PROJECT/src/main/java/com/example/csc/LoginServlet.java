package com.example.csc;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public LoginServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		  String action = request.getParameter("action");

	        try {
	            switch (action) {
	                case "stafflogout":
	                    staffLogout(request, response);
	                    break;
	                case "custLogout":
	                    custLogout(request, response);
	                    break;
	              
	            }

	        } catch (SQLException e) {
	            throw new ServletException(e);
	        }
		
	}
	private void staffLogout(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
		  HttpSession session = request.getSession();
	        session.removeAttribute("staffid");
	        session.removeAttribute("staffname");
	        session.invalidate();
	        response.sendRedirect("index.jsp");
	}
	private void custLogout(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
		  HttpSession session = request.getSession();
	        session.removeAttribute("custid");
	        session.removeAttribute("custname");
	        session.invalidate();
	        response.sendRedirect("index.jsp");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		response.setContentType("text/html");

	        String action = request.getParameter("action");

	        try {
	            switch (action) {
	                case "stafflogin":
	                    stafflogin(request, response);
	                    break;
	                case "custlogin":
	                    custlogin(request, response);
	                    break;
	              
	            }

	        } catch (SQLException e) {
	            throw new ServletException(e);
	        }
	       
	}
    private void stafflogin(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {

            Class.forName("org.postgresql.Driver");
        	String dbURL = "jdbc:postgresql://ec2-44-195-162-77.compute-1.amazonaws.com/d88pnpki3g3tf2";
    	    String user = "taqeepmrlucqqn";
    	    String pass = "353bf3afa60d3fe8fcba7d25c19b9fe134d933d3cd05c9d04d5885656a445126";
            Connection con = DriverManager.getConnection(dbURL, user, pass);

            String sql  = "SELECT * FROM staff";

            if (con != null){
                Statement statement = con.createStatement();
                ResultSet res = statement.executeQuery(sql);

                while (res.next()){
                    if(username.equals(res.getString("staffusername")) && password.equals(res.getString("staffpassword")))
                    {

                        session.setAttribute("staffid", res.getInt(1));
                        session.setAttribute("staffname",res.getString(2));
            	        session.setAttribute("staffusername",res.getString(4));
            	        session.setAttribute("staffpassword",res.getString(5));
                        session.setAttribute("staffrole",res.getString(7));

         	     
                        response.sendRedirect("staff-dashboard.jsp");


                    }else {}

                }   response.setContentType("text/html");  
                out.println("<script type=\"text/javascript\">");  
                out.println("alert('Invalid username or password');");  
                out.println("window.location.assign('index.jsp');");  
                out.println("</script>");


            }

        }catch (Exception e){
            e.printStackTrace();
        }
    }

private void custlogin(HttpServletRequest request, HttpServletResponse response)
        throws SQLException, IOException {
    PrintWriter out = response.getWriter();
    HttpSession session = request.getSession();

    String username = request.getParameter("username");
    String password = request.getParameter("password");

    try {

        Class.forName("org.postgresql.Driver");
    	String dbURL = "jdbc:postgresql://ec2-44-195-162-77.compute-1.amazonaws.com/d88pnpki3g3tf2";
	    String user = "taqeepmrlucqqn";
	    String pass = "353bf3afa60d3fe8fcba7d25c19b9fe134d933d3cd05c9d04d5885656a445126";
        Connection con = DriverManager.getConnection(dbURL, user, pass);

        String sql  = "SELECT * FROM customer";

        if (con != null){
            Statement statement = con.createStatement();
            ResultSet res = statement.executeQuery(sql);

            while (res.next()){
                if(username.equals(res.getString("custusername")) && password.equals(res.getString("custpassword")))
                {

                    session.setAttribute("custid", res.getInt(1));
                    session.setAttribute("custname",res.getString(2));

     	     
                    response.sendRedirect("cust-dashboard.jsp");


                }else {}

            }
            response.setContentType("text/html");  
            out.println("<script type=\"text/javascript\">");  
            out.println("alert('Invalid username or password');");  
            out.println("window.location.assign('index.jsp');");  
            out.println("</script>");


        }

    }catch (Exception e){
        e.printStackTrace();
    }
}
}