<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
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
<sql:setDataSource var="dao" driver="org.postgresql.Driver"
                   url="jdbc:postgresql://ec2-44-195-162-77.compute-1.amazonaws.com/d88pnpki3g3tf2"
                   user = "taqeepmrlucqqn"
                   password="353bf3afa60d3fe8fcba7d25c19b9fe134d933d3cd05c9d04d5885656a445126"/>
         
      <sql:query dataSource="${dao}" var="staff">
         SELECT * from staff
      </sql:query>
      <%@include file="staff-navbar.jsp"%>

<div class="content">
    <br>
    <h2>ADD STAFF</h2>
    <div class="staffform">
        <form class="staff" method="post" action="StaffServlet" >
      
            <div class="dataa">
                <label>   Name </label>
                <input type="text" name="staffName" value="" >
            </div>
            <div class="dataa">
                <label>Phone Number</label>
                <input type="text" name="staffPhone" placeholder="012-3456790" pattern="[0-9]{3}-[0-9]{8}">
            </div>
            <div class="dataa">
                <label>Username</label>
                <input type="text" name="staffUsername" value="">
            </div>
              <div class="dataa">
                <label>Password</label>
                <input type="password" name="staffPassword" value="">
            </div>
            <div class="dataa">
                <label>Role</label>
					<select id="select" name="staffRole">
					<option value="Staff">Staff</option>
					<option value="Clerk">Clerk</option>
					
					</select>
			</div>
			<div class="dataa">
                <label>Supervisor</label>
					<select name="supervisor">
                           <option value="0">Choose Supervisor...</option>
                           <c:forEach var="result" items="${staff.rows}">
                              <option value="${result.staffid}">${result.staffname},${result.staffrole}</option>
                           </c:forEach>
                    </select>
			</div>
		
            <div id="mybutton" class="button">
                <button type="cancel" name="action"  value="cancel" formaction="StaffServlet">CANCEL</button>
                <input type="hidden" name="action" value="addStaff">
                <button type="submit" class="button button1" name="submit" >ADD</button><br><br>
            </div>
        </form>
    </div>

</div>
<br><br><br>
</body>
<script type="text/javascript">


</script>

</html>