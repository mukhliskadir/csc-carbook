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

<%int custid = Integer.parseInt(session.getAttribute("custid").toString()); %>
<sql:query dataSource="${dao}" var="car">
<c:set var="cust" value="<%=custid%>"/>
select * from booking join cars using (carid) where custid=? order by bookid desc
 <sql:param value="${cust}" />
</sql:query>

</head>
<body>
      <%@include file="cust-navbar.jsp"%>

<div class=content>
    <br>
    <h2>RECORD</h2>
<div style="overflow-x:auto;">

		<table style="text-align: center;" id="carList">
          <tr>
              <th style="width: 80px; height: 50px;">Booking ID</th>
              <th style="width:400px;">Pick-up Date</th>
              <th style="width: 200px;">Return Date</th>
              <th style="width: 200px;">Booking Fee</th>
               <th style="width: 200px;">Car Brand</th>
              <th style="width: 200px;">Car Model</th>
            <th style="width: 200px;">Booking Status</th>
                        <th style="width: 100px;">Action</th>
            
            
              
          </tr>
          <c:forEach var="result" items="${car.rows}">
              <tr>
                  <td >
                      <c:out value="${result.bookid}"/>
                  </td>
                  <td >
                      <c:out value="${result.bookdate}"/>
                  </td>
                  <td >
                      <c:out value="${result.bookreturn}"/>
                  </td>
                  <td >
				    RM	<fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${result.bookfee}"/>
                  </td>
                   <td >
                      <c:out value="${result.carbrand}"/>
                  </td>
                  <td >
                      <c:out value="${result.carmodel}"/>
                  </td>
                  <td >
                      <c:out value="${result.bookstatus}"/>
                  </td>
                  <td>
                       <c:if test="${result.bookstatus == 'Done' }" > 
                  
                                    <form method="post">
                          <button  class="action"  type="print" formaction="invoice.jsp?id=${result.bookid}"
                          >INVOICE
                          </button>
                      </form></c:if></td>
                
              </tr>
          </c:forEach>
	  </table>


</div>
</div>	
	
	
	
	
	
</body>
</html>