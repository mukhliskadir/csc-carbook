package com.example.csc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;

import static java.lang.System.out;

public class StaffDao {
	String dbURL = "jdbc:postgresql://ec2-44-195-162-77.compute-1.amazonaws.com/d88pnpki3g3tf2";
    String user = "taqeepmrlucqqn";
    String pass = "353bf3afa60d3fe8fcba7d25c19b9fe134d933d3cd05c9d04d5885656a445126";
    
    
    protected Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(dbURL, user, pass);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return con;

    }
    public void addStaff (Staff stf) throws SQLException {

        // try-with-resource statement will auto close the connection.
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement
            		 ("insert into staff(staffname,staffphone,staffrole,staffusername,staffpassword,supervisorid) values(?,?,?,?,?,?)"))

        {
        	ps.setString(1,stf.getStaffName());
        	ps.setString(2,stf.getStaffPhone());
        	ps.setString(3,stf.getStaffRole());
        	ps.setString(4,stf.getStaffUsername());
        	ps.setString(5,stf.getStaffPassword());
        	ps.setInt(6, stf.getSvid());
        	


      
            out.println(ps);
            ps.executeUpdate();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
    public boolean deleteStaff(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("delete from staff where staffid=?");) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
   
    public void updateStaff (Staff stf) throws SQLException {

        // try-with-resource statement will auto close the connection.
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement
            		 ("update staff set staffname=?,staffphone=?,staffusername=?,staffpassword=? where staffid=?"))

        {
        	ps.setString(1,stf.getStaffName());
        	ps.setString(2,stf.getStaffPhone());
        	ps.setString(3,stf.getStaffUsername());
        	ps.setString(4,stf.getStaffPassword());
        	ps.setInt(5, stf.getId());
        	


      
            out.println(ps);
            ps.executeUpdate();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
