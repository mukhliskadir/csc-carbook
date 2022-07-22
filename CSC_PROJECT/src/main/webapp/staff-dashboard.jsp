
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="style.css">
	<script src="https://kit.fontawesome.com/9bff21277a.js" crossorigin="anonymous"></script>
	
</head>
<body>
<sql:setDataSource var="dao" driver="org.postgresql.Driver"
                   url="jdbc:postgresql://ec2-44-195-162-77.compute-1.amazonaws.com/d88pnpki3g3tf2"
                   user = "taqeepmrlucqqn"
                   password="353bf3afa60d3fe8fcba7d25c19b9fe134d933d3cd05c9d04d5885656a445126"/>

<sql:query dataSource="${dao}" var="car">
select count(carid) from cars
</sql:query>
<sql:query dataSource="${dao}" var="rent">
select count(carid) from cars where carstatus ='In Rent'
</sql:query>
<sql:query dataSource="${dao}" var="pending">
select count(bookid) from booking where bookstatus ='Approved'
</sql:query>
<sql:query dataSource="${dao}" var="cust">
select count(custid) from customer
</sql:query>
<sql:query dataSource="${dao}" var="staff">
select count(staffid) from staff where staffid != 1
</sql:query>
<sql:query dataSource="${dao}" var="collect">
select sum(bookfee) from booking where bookstatus ='Done'
</sql:query>
      <%@include file="staff-navbar.jsp"%>

<div class="content">
  <br>
  <h2>MY DASHBOARD</h2>	
        <c:forEach var="result" items="${car.rows}">
  	
  <div class="box" id="box1">
    <p><i class="fa-solid fa-car-side fa-2xl"></i><br><br>TOTAL CARS</p>
    
    <h5 class="itemdashboard" name="totcar">${result.count}</h5>

  </div>
      </c:forEach>
          <c:forEach var="result" items="${rent.rows}">
  
  <div class="box" id="box2">
    <p><i class="fa-solid fa-arrow-right-from-bracket fa-2xl"></i><br><br>CAR IN RENT</p>
    <h5 class="itemdashboard" name="totrent">${result.count}</h5>
  </div>
  </c:forEach>
            <c:forEach var="result" items="${pending.rows}">
  
  <div class="box" id="box3">
    <p><i class="fa-solid fa-hourglass fa-2xl"></i><br><br>PENDING CAR PICK</p>
    <h5 class="itemdashboard" name="totpending">${result.count}</h5>
  </div></c:forEach>
              <c:forEach var="result" items="${cust.rows}">
  <div class="box" id="box4">
    <p><i class="fa-solid fa-users fa-2xl"></i><br><br>REGISTERED CUSTOMER</p>
    <h5 class="itemdashboard" name="totreg">${result.count}</h5>
  </div></c:forEach>            <c:forEach var="result" items="${staff.rows}">
  <div class="box" id="box5">
    <p><i class="fa-solid fa-users-gear fa-2xl"></i><br><br>TOTAL STAFF</p>
    <h5 class="itemdashboard" name="totstaff">${result.count}</h5>
  </div></c:forEach>            <c:forEach var="result" items="${collect.rows}">
  <div class="box" id="box6">
    <p><i class="fa-solid fa-sack-dollar fa-2xl"></i><br><br>MONEY COLLECTED</p>
    <h5 class="itemdashboard" name="totmoney">RM ${result.sum}</h5>
  </div></c:forEach>

  		  	
<br><br><br>

  
</div>

</body>
<style type="text/css">		

#logot{ margin: 0;
  position: absolute
  ;margin-left: 40px;margin-top: 20px;
  }
div.box{
  width: 350px;
  height: 250px;
  border:5px solid;
  float: left;
  margin: 25px;
  box-shadow: inset 0 -3em 3em rgba(0,0,0,0.1),
             0 0  0 2px rgb(255,255,255),
             0.3em 0.3em 1em rgba(0,0,0,0.3);
             padding: 5px;
}
#box1{background-color: #edc966;}
#box2{background-color: #fc90fb}
#box3{background-color: #adedab}
#box4{background-color: #bbf1f2}
#box5{background-color: #f5ae7f}
#box6{background-color: #f5ede9}

p{font-size: 30px; text-align: center;}
h5{font-size: 40px;text-align: center;}
</style>
</html>