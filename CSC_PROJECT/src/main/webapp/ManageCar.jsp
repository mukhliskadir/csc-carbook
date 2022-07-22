<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
    SELECT row_number() over (order by carid) "rank",carid,carbrand,carmodel,carprice,carplate,carstatus,caryear from cars
</sql:query>
</head>
<body>
      <%@include file="staff-navbar.jsp"%>
      
      
<div id="mybutton" class="button">
        <button class="add" type="add" value="add" onclick="location.href='addCars.jsp'">ADD CAR</button>
    </div>
<div class=content>
 <br>
    <h2>MANAGE CAR</h2>
<div style="overflow-x:auto;">

		<table style="text-align: center;" id="carList">
          <tr>
              <th style="width: 80px; height: 50px;">No.</th>
              <th style="width:400px;"> Car Type</th>
              <th style="width: 200px;">Plate</th>
              <th style="width: 200px;">Price</th>
               <th style="width: 200px;">Year</th>
              <th style="width: 200px;">Status</th>
              <th style="width: 100px;">Action</th>
          </tr>
          <c:forEach var="result" items="${car.rows}">
              <tr>
                  <td >
                      <c:out value="${result.rank}"/>
                  </td>
                  <td >
                      <c:out value="${result.carbrand} ${result.carmodel} "/>
                  </td>
                 
                  <td >
                      <c:out value="${result.carplate}"/>
                  </td>
                   <td >
				    RM	<fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${result.carprice}"/> /day
                  </td>
                  <td >
                      <c:out value="${result.caryear}"/>
                  </td>
                  <td >
                      <c:out value="${result.carstatus}"/>
                  </td>
                  <td>
                      <form method="post">
                          <button  class="action"  type="edit" formaction="editCar.jsp?id=${result.carid}"
                          >EDIT
                          </button>
                      </form>
                      <form method="post">
                          <input type="hidden" name="carID" value="${result.carid}">
                          <input type="hidden" name="action" value="removeCar">
                          <button  class="action"  type="delete" formaction="CarServlet"  onclick="return confirm('Are you sure to delete this car?');">REMOVE</button>
                      </form>
                  </td>
              </tr>
          </c:forEach>
	  </table>


</div>
</div>


</body>
<style>
table, th, td {
  border: 1px solid;
}
</style>
</html>