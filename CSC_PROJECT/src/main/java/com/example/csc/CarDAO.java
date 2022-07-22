package com.example.csc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


import static java.lang.System.out;

public class CarDAO {
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
    public void addCar (Car c) throws SQLException {

        // try-with-resource statement will auto close the connection.
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement
                     ("insert into cars(carbrand,carmodel,carplate,carprice,caryear,carstatus) values(?,?,?,?,?,'Available')"))
        {

            ps.setString(1, c.getCarBrand());
            ps.setString(2,c.getCarModel());
            ps.setString(3,c.getCarPlate());
            ps.setDouble(4, c.getCarPrice());
            ps.setString(5,c.getCarYear());
         
            out.println(ps);
            ps.executeUpdate();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
    public boolean removeCar(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("delete from cars where carid=?");) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
    public void updateCar (Car c) throws SQLException {

        // try-with-resource statement will auto close the connection.
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement
                     ("update cars set carbrand=?,carmodel=?,carplate=?,carprice=?,caryear=? WHERE carid = ?"))
        {

    	   ps.setString(1, c.getCarBrand());
           ps.setString(2,c.getCarModel());
           ps.setString(3,c.getCarPlate());
           ps.setDouble(4, c.getCarPrice());
           ps.setString(5,c.getCarYear());
           ps.setInt(6, c.getId());
           
        
           out.println(ps);
           ps.executeUpdate();
       }
       catch (Exception e) {
           e.printStackTrace();
       }
    }
    public void status (Car c) throws SQLException {

        // try-with-resource statement will auto close the connection.
        try (Connection con = getConnection();
            	PreparedStatement ps = con.prepareStatement
        			    ("update cars set carstatus='In Rent' WHERE carid = ?"))
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
                     ("update booking set bookstatus='In Rent' WHERE bookid = ?"))
             {
        	
    
           ps.setInt(1, b.getId());
           
        
           out.println(ps);

           ps.executeUpdate();
       }
       catch (Exception e) {
           e.printStackTrace();
       }
    }

}
