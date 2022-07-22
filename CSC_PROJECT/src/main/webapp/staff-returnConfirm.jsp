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
      <%@include file="staff-navbar.jsp"%>

<%
	Class.forName("org.postgresql.Driver");
	String dbURL = "jdbc:postgresql://ec2-44-195-162-77.compute-1.amazonaws.com/d88pnpki3g3tf2";
	String user = "taqeepmrlucqqn";
	String pass = "353bf3afa60d3fe8fcba7d25c19b9fe134d933d3cd05c9d04d5885656a445126";

    String id=request.getParameter("id");
    int num=Integer.parseInt(id);
    String sql= "select * from customer join booking using (custid)left outer join return using (bookid) where bookid='"+num+"'";
    Connection con=DriverManager.getConnection(dbURL, user, pass);
    Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery(sql);
    while(rs.next())
    {
%>

<div class="content">
    <br>
    <h2>RETURN CAR</h2>
    <div class="">
        CUSTOMER NAME         : <%=rs.getString("custname") %> <br><br>
        BOOKING DATE          : <%=rs.getString("bookdate") %> <br><br>
        BOOKING RETURN DATE   : <%=rs.getString("bookreturn")%> <br><br>
        BOOKING FEE  : RM <%=rs.getString("bookfee")%> <br><br>
    </div>
    
    <div class="staffform">
        <form class="staff" method="post" >
            <input type="hidden" name="bookid" value='<%=rs.getString("bookid") %>'/>
             <input type="hidden" name="fee" value='<%=rs.getString("bookfee") %>'/>
          <input type="hidden" name="date" value='<%=rs.getString("bookreturn") %>'/>
                    <input type="hidden" name="car" value='<%=rs.getString("carid") %>'/>
          
             
            
            <div class="dataa">
                <label> Return Date</label>
                <input type="date" name="returnDate" >
            </div>        
                         
            <%} %>
            <div id="mybutton" class="button">
                <button type="cancel" name="action"  value="cancel" formaction="Booking">CANCEL</button>
                   <input type="hidden" name="action" value="return">
                          <button  type="add" formaction="ReturnServlet"  onclick="return confirm('Return Confirmed')">CONFIRM</button>
                      </form>
                <br><br>
            </div>
        </form>
    </div>
    
    
     
</div>
<br><br><br>
</body>
<script>

</html>