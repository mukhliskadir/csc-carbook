  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
  
<head>
    <title>
        Print the content of a div
    </title>
      
    <!-- Script to print the content of a div -->
    <script>
        function printDiv() {
            var divContents = document.getElementById("GFG").innerHTML;
            var a = window.open('', '', 'height=500, width=500');
            a.document.write('<html>');
            a.document.write('<body ><br>');
            a.document.write(divContents);
            a.document.write('</body></html>');
            a.document.close();
            a.print();
        }
       
    
    </script>
    
</head>
<%String id=request.getParameter("id");
int num=Integer.parseInt(id); %>
<sql:setDataSource var="dao" driver="org.postgresql.Driver"
                   url="jdbc:postgresql://ec2-44-195-162-77.compute-1.amazonaws.com/d88pnpki3g3tf2"
                   user = "taqeepmrlucqqn"
                   password="353bf3afa60d3fe8fcba7d25c19b9fe134d933d3cd05c9d04d5885656a445126"/>

<sql:query dataSource="${dao}" var="book">
<c:set var="id" value="<%=num%>"/>
select * from customer join booking using (custid) left outer join return using (bookid) where bookstatus='Done' and bookid=? 
 <sql:param value="${id}" />
</sql:query>
  
  <sql:query dataSource="${dao}" var="car">
  <c:set var="id" value="<%=num%>"/>
select * from cars join booking using (carid) join customer using (custid) where bookid =?
 <sql:param value="${id}" />

</sql:query>
<body style="background-color: #9ff1f5;">
        <div id="GFG" style="background-color: white;width:60%;margin-left:auto;margin-right:auto;padding:15px">
              
<h2 class="GeneratedText">CARBOOK</h2>
--------------------------------------------------------------------------------------------------<BR>
------CAR DETAIL--------<br><br>
<c:forEach var="result" items="${car.rows}">

CAR TYPE :  <c:out value="${result.carbrand} ${result.carmodel} "/>
<br>
<br>PLATE NUMBER :                       <c:out value="${result.carplate}"/>

<br>PRICE PER DAY :
				    RM	<fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${result.carprice}"/> /day

</c:forEach>
<br><br>------CUSTOMER DETAIL--------<br><br>
<c:forEach var="result" items="${book.rows}">

CUSTOMER NAME :                      <c:out value="${result.custname}"/>

<br>CUSTOMER PHONE :                      <c:out value="${result.custphone}"/>

<br>CUSTOMER NRIC :                      <c:out value="${result.custnric}"/>


 <br><br>----BOOKING DETAIL--------<br><br>
 <br>BOOK PICKUP DATE :                       <c:out value="${result.bookdate}"/>
 
 <br>BOOK RETURN DATE :                      <c:out value="${result.bookreturn}"/>
 
 <br>
 <br>CAR RETURN DATE :                      <c:out value="${result.returndate}"/>
 
 <br>TOTAL ELAPSE DAYS:                      <c:out value="${result.returnelapse}"/>
 
 <br>
 <br>
 <br><br>------PAYMENT---------<br><br>
 <br>BOOK FEE PRICE : RM                      <c:out value="${result.bookfee -result.fine}"/>
 <br>FINE : RM                      <c:out value="${result.fine}"/>
 
 <br>--------------------------------
 <br>TOTAL PRICE : RM                       <c:out value="${result.bookfee}"/>
 
 
 
 </c:forEach>
 <br>
--------------------------------------------------------------------------------------------------<BR>
THIS IS A COMPUTERIZED PRINTOUT, NO NEED SIGNATURE
<BR>
<BR>

Thank you for your booking. We love having customers like you. 


        </div>
          
       
      <center> 
        <input type="button" value=PRINT
                    onclick="printDiv()" style="width:50px;height:30px;"> </center>
</body>
  <style>
  .GeneratedText {
font-family:'Arial Black', sans-serif;font-size:2em;margin:20px;margin-bottom:10px;letter-spacing:0em;line-height:1.3em;color:black;
}

  </style>
</html>