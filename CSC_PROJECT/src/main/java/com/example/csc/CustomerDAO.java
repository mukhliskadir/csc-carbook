package com.example.csc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import static java.lang.System.out;

public class CustomerDAO {
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
    public void custSignup (Customer cust) throws SQLException {

        // try-with-resource statement will auto close the connection.
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement
                     ("insert into customer(custname,custphone,custnric,custaddress,custusername,custpassword,custlicense) values(?,?,?,?,?,?,?)"))
        {

          ps.setString(1, cust.getCustName());
          ps.setString(2, cust.getCustPhone());
          ps.setString(3, cust.getCustNric());
          ps.setString(4, cust.getCustAddress());
          ps.setString(5, cust.getCustUsername());
          ps.setString(6, cust.getCustPassword());
          ps.setString(7, cust.getCustLicense());

         
            out.println(ps);
            ps.executeUpdate();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
