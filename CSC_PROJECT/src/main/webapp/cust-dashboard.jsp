<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="css/style.css">

<meta charset="ISO-8859-1">
<title>Insert title here</title>
<sql:setDataSource var="dao" driver="org.postgresql.Driver"
                   url="jdbc:postgresql://ec2-44-195-162-77.compute-1.amazonaws.com/d88pnpki3g3tf2"
                   user = "taqeepmrlucqqn"
                   password="353bf3afa60d3fe8fcba7d25c19b9fe134d933d3cd05c9d04d5885656a445126"/>

<sql:query dataSource="${dao}" var="car">
select row_number() over (order by carid desc) "rank", carbrand|| ' ' || carmodel as cartype,carid,carprice,carplate,caryear from cars where carstatus='Available'
</sql:query>

</head>
<body>
      <%@include file="cust-navbar.jsp"%>

  <div class="content" ><br>
         <h2>BOOK CAR</h2>
    <input style="width: 400px;	"type="text" id="myInput" onkeyup="findCar()" placeholder="Find Car" title="Type in a name">

	<div style="overflow-x:auto;">

		<table style="text-align: center;" id="carList">
          <tr>
              <th style="width: 80px; height: 50px;">No.</th>
              <th style="width:400px;"> Car Type</th>
              <th style="width: 200px;">Plate</th>
              <th style="width: 200px;">Price Per Day</th>
               <th style="width: 200px;">Manufacturing Year</th>
              <th style="width: 200px;">Action</th>
          </tr>
          <c:forEach var="result" items="${car.rows}">
              <tr>
                  <td >
                      <c:out value="${result.rank}"/>
                  </td>
                  <td >
                      <c:out value="${result.cartype}"/>
                  </td>
                  <td >
                      <c:out value="${result.carplate}"/>
                  </td>
                   <td >
				    RM	<fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${result.carprice}"/>
                  </td>
                  <td >
                      <c:out value="${result.caryear}"/>
                  </td>
                
                  <td>     
                        <form method="post">
                            <button  class="action"  type="edit" formaction="cust-bookCar.jsp?id=${result.carid}">BOOK</button>
                        </form>
                  </td>
              </tr>
          </c:forEach>
	  </table>
	  </div>
	  </div>
</body>
<script>
function findCar() {
	  var input, filter, table, tr, td, i, txtValue;
	  input = document.getElementById("myInput");
	  filter = input.value.toUpperCase();
	  table = document.getElementById("carList");
	  tr = table.getElementsByTagName("tr");
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[1];
	    if (td) {
	      txtValue = td.textContent || td.innerText;
	      if (txtValue.toUpperCase().indexOf(filter) > -1) {
	        tr[i].style.display = "";
	      } else {
	        tr[i].style.display = "none";
	      }
	    }       
	  }
	}
</script>
</html>