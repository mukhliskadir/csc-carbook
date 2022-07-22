<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<sql:setDataSource var="dao" driver="org.postgresql.Driver"
                   url="jdbc:postgresql://ec2-44-195-162-77.compute-1.amazonaws.com/d88pnpki3g3tf2"
                   user = "taqeepmrlucqqn"
                   password="353bf3afa60d3fe8fcba7d25c19b9fe134d933d3cd05c9d04d5885656a445126"/>

<sql:query dataSource="${dao}" var="car">
select * from cars join booking using (carid) join customer using (custid) where bookstatus='Pending'
</sql:query>
      <%@include file="staff-navbar.jsp"%>

</head>
<body>
<div class=content>
 <br>
    <h2>PENDING BOOKING</h2>
<div style="overflow-x:auto;">

		<table style="text-align: center;" id="carList">
          <tr>
              <th style="width: 80px; height: 50px;">Booking ID</th>
             <th style="width:400px;">Customer Name</th>
              <th style="width:200px;">Pick-up Date</th>
              <th style="width: 200px;">Return Date</th>
              <th style="width: 200px;">Booking Fee</th>
               <th style="width: 200px;">Car Type</th>
              <th style="width: 200px;">Car Model</th>
                          <th style="width: 200px;">Booking Status</th>
              
              <th style="width: 200px;">Action</th>
          </tr>
          <c:forEach var="result" items="${car.rows}">
              <tr>
                  <td >
                      <c:out value="${result.bookid}"/>
                  </td>
                  <td >
                      <c:out value="${result.custname}"/>
                  </td>
                  <td >
                      <c:out value="${result.bookdate}"/>
                  </td>
                  <td >
                      <c:out value="${result.bookreturn}"/>
                  </td>
                  <td >
                      <c:out value="${result.bookfee}"/>
                  </td>
                   <td >
                      <c:out value="${result.carbrand} ${result.carmodel}"/>
                  </td>
                  <td >
                      <c:out value="${result.carplate}"/>
                  </td>
                  <td >
                      <c:out value="${result.bookstatus}"/>
                  </td>
                  <td>
                      <form method="post">
                          <input type="hidden" name="bookid" value="${result.bookid}">
                          <input type="hidden" name="action" value="approveBooking">
                          <button  class="action"  type="approve" formaction="BookingServlet"  onclick="return confirm('Confirm Approval?')">APPROVE</button>
                      </form>
                      <form method="post">
                          <input type="hidden" name="bookid" value="${result.bookid}">
                          <input type="hidden" name="action" value="removeBooking">
                          <button  class="action"  type="delete" formaction="BookingServlet"  onclick="return confirm('Confirm reject? ')">REJECT</button>
                      </form>
                  </td>
              </tr>
          </c:forEach>
	  </table>


</div>
</div>	
	
	
	
	
	
</body>
</html>