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
    String sql= "select * from staff WHERE staffid='"+num+"'";
    Connection con=DriverManager.getConnection(dbURL, user, pass);
    Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery(sql);
    while(rs.next())
    {
%>

<div class="content">
    <br>
    <h2>EDIT STAFF ACCOUNT</h2>
    <div class="staffform">
        <form class="staff" method="post" >
            <input type="hidden" name="id" value='<%=rs.getString("staffid") %>'/>
            
            <div class="dataa">
                <label>   Name </label>
                <input type="text" name="staffName" value='<%=rs.getString("staffname") %>' >
            </div>
            <div class="dataa">
                <label>Phone Number</label>
                <input type="text" name="staffPhone" value='<%=rs.getString("staffphone") %>'  pattern="[0-9]{3}-[0-9]{8}">
            </div>
            <div class="dataa">
                <label>Username</label>
                <input type="text" name="staffUsername" value='<%=rs.getString("staffusername") %>'>
            </div>
              <div class="dataa">
                <label>Password</label>
                <input type="password" name="staffPassword" value='<%=rs.getString("staffpassword") %>'>
            </div>
           
            <%} %>
            <div id="mybutton" class="button">
                <button type="cancel" name="action"  value="cancel" formaction="StaffServlet">CANCEL</button>
                <input type="hidden" name="action" value="updateStaff">
                <button type="submit" formaction="StaffServlet" onclick="return confirm('Confirm Change ?');">SAVE</button>
                <br><br>
            </div>
        </form>
    </div>
     
</div>
<br><br><br>
</body>
</html>