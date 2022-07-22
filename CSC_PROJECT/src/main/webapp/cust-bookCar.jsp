<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <script src="https://kit.fontawesome.com/9bff21277a.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
      <%@include file="cust-navbar.jsp"%>

<%
	Class.forName("org.postgresql.Driver");
	String dbURL = "jdbc:postgresql://ec2-44-195-162-77.compute-1.amazonaws.com/d88pnpki3g3tf2";
	String user = "taqeepmrlucqqn";
	String pass = "353bf3afa60d3fe8fcba7d25c19b9fe134d933d3cd05c9d04d5885656a445126";

    String id=request.getParameter("id");
    int num=Integer.parseInt(id);
    String sql= "select carbrand,carid, carmodel ,carprice,carplate,caryear from cars WHERE carid='"+num+"'";
    Connection con=DriverManager.getConnection(dbURL, user, pass);
    Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery(sql);
    while(rs.next())
    {
%>

<div class="content">
    <br>
    <h2>BOOK CAR</h2>
    <div class="">
        CAR BRAND          : <%=rs.getString("carbrand") %> <br><br>
        CAR MODEL          : <%=rs.getString("carmodel") %> <br><br>
        PLATE NUMBER   : <%=rs.getString("carplate")%> <br><br>
        PRICE PER DAY	  : RM <%=rs.getString("carprice")%> <br><br>
        MANUFACTURING DATE : <%=rs.getString("caryear")%> <br><br>
    </div>
    
    <div class="staffform">
        <form class="staff" method="post" >
            <input type="hidden" name="carid" value='<%=rs.getString("carid") %>'/>
                        <input type="hidden" name="price" value='<%=rs.getString("carprice") %>'/>
            
            <div class="dataa">
                <label>  Pickup Date </label>
                <input type="date" name="pickDate"  >
            </div>
            <div class="dataa">
                <label> Return Date</label>
                <input type="date" name="returnDate" >
            </div>        
                         
            <%} %>
            <div id="mybutton" class="button">
                <button type="cancel" name="action"  value="cancel" formaction="Booking">CANCEL</button>
                <input type="hidden" name="action" value="bookCar">
                <button type="submit" formaction="BookingServlet" onclick="return confirm('Yakin untuk simpan ?');">BOOK</button>
                <br><br>
            </div>
        </form>
    </div>
    
    
     
</div>
<br><br><br>
</body>
<script>

</html>