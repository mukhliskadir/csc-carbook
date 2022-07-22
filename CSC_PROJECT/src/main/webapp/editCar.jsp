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
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
    String sql= "select * from cars where carid='"+num+"'";
    Connection con=DriverManager.getConnection(dbURL, user, pass);
    Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery(sql);
    while(rs.next())
    {
%>

<div class="content" >
    <br>
    <h2>MANAGE CAR</h2>
<form  method="post" action="CarServlet">
     			<input type="hidden" name="id" value='<%=rs.getString("carid") %>'/>
     			        	<div class="dataa">
     			
                <label >   Brand </label>
                <input type="text" name="carBrand" value='<%=rs.getString("carbrand") %>'/><br>
</div>        	<div class="dataa">

                <label>  Model</label>
                <input type="text" name="carModel" value='<%=rs.getString("carmodel") %>'><br>
</div>        	<div class="dataa">

                <label>    Plate</label>
                <input type="text" name="carPlate" value='<%=rs.getString("carplate") %>'><br>
            </div>        	<div class="dataa">
                
                  <label>    Price Per Day</label>
                <input type="text" name="carPrice" value='<%=rs.getString("carprice") %>'><br>
            </div>        	<div class="dataa">
                
                 <label>Year Manufacture</label>
                <input type="text" name="carYear" value='<%=rs.getString("caryear") %>'><br><br>
            </div>    
 <%} %>
            <div id="mybutton" class="button">
                <button type="cancel" name="action"  value="cancel" >CANCEL</button>
                <input type="hidden" name="action" value="updateCar">
                <button type="submit" formaction="CarServlet" onclick="return confirm('Confirm changes ?');">SAVE</button>
                <br><br>
            </div>
        </form>
      </div>
</body>
</html>