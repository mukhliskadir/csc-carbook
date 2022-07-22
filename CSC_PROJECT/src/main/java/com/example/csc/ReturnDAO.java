package com.example.csc;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Date;

import static java.lang.System.out;

public class ReturnDAO {
	String dbURL = "jdbc:postgresql://ec2-44-195-162-77.compute-1.amazonaws.com/d88pnpki3g3tf2";
    String user = "taqeepmrlucqqn";
    String pass = "353bf3afa60d3fe8fcba7d25c19b9fe134d933d3cd05c9d04d5885656a445126";
    
    protected Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(dbURL, user, pass);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return con;

    }
    public void status (Car c) throws SQLException {

        // try-with-resource statement will auto close the connection.
        try (Connection con = getConnection();
            	PreparedStatement ps = con.prepareStatement
        			    ("update cars set carstatus='Available' WHERE carid = ?"))
        {
        	
    
           ps.setInt(1, c.getId());

           
        
           out.println(ps);

           ps.executeUpdate();
       }
       catch (Exception e) {
           e.printStackTrace();
       }
    }public void bstatus (Booking b) throws SQLException {

        // try-with-resource statement will auto close the connection.
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement
                     ("update booking set bookstatus='Done',bookfee=? WHERE bookid = ?"))
             {
        	
        ps.setDouble(1, b.getBookFee());
           ps.setInt(2, b.getId());
           
        
           out.println(ps);

           ps.executeUpdate();
       }
       catch (Exception e) {
           e.printStackTrace();
       }
    }
    public void rstatus (Return r) throws SQLException {

        // try-with-resource statement will auto close the connection.
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement
                     ("insert into return (returndate,returnelapse,fine,bookid)values(?,?,?,?)"))
             {
        
        	ps.setDate(1, r.getReturnDate());
        	ps.setInt(2, r.getReturnElapse());
        ps.setDouble(3, r.getReturnFine());
           ps.setInt(4, r.getBookid());
           
        
           out.println(ps);

           ps.executeUpdate();
       }
       catch (Exception e) {
           e.printStackTrace();
       }
    }
    
}
