<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

<sql:setDataSource var="ic" driver="org.postgresql.Driver"
                   url="jdbc:postgresql://ec2-44-195-162-77.compute-1.amazonaws.com/d88pnpki3g3tf2"
                   user = "taqeepmrlucqqn"
                   password="353bf3afa60d3fe8fcba7d25c19b9fe134d933d3cd05c9d04d5885656a445126"/>
                   
<sql:query dataSource="${ic}" var="staff">
    SELECT row_number() over (order by staffid) "rank",staffid,staffname,staffphone,staffusername,staffpassword,staffrole from staff
</sql:query>
      <%@include file="staff-navbar.jsp"%>


<div class="content" >
    <br>
    <h2>MANAGE STAFF</h2>
<c:if test="${sessionScope.staffrole == 'Clerk'  }" >     
    <div id="mybutton" class="button">
        <button class="add" type="add" value="add" onclick="location.href='addStaff.jsp'">ADD STAFF</button>
    </div>
 </c:if>
 
 
    <div style="overflow-x:auto;">
        <table id="listPenceramah">
            <tr>
                <th onclick="sortTable(0)" style="width: 80px; height: 50px;">⥯ No.</th>
                <th onclick="sortTable(1)" style="width:900px;">⥯ Name</th>
                <th onclick="sortTable(2)" style="width: 300px;">⥯ Phone Number</th>
                <th onclick="sortTable(3)" style="width: 250px;">⥯ Username</th>
                <th onclick="sortTable(4)" style="width: 250px;">⥯ Password</th>
                <th onclick="sortTable(4)" style="width: 250px;">⥯ Role</th>
                <th style="width: 100px;">Tindakan</th>
            </tr>
            <c:forEach var="result" items="${staff.rows}">
		<c:if test="${sessionScope.staffrole== 'Clerk'||sessionScope.staffrole== 'Manager'}" > 
                <tr>
                    <td >
                        <c:out value="${result.rank}"/>
                    </td>
                  
                    <td >
                        <c:out value="${result.staffname}"/>
                    </td>
                    <td>
                        <c:out value="${result.staffphone}"/>
                    </td>
                    <td>
                        <c:out value="${result.staffusername}"/>
                    </td>
                     <td  class="hidetext">
                        <c:out value="${result.staffpassword}"/>
                    </td>
                    <td>
                        <c:out value="${result.staffrole}"/>
                    </td>
                 
                    <td>
                       
                        <form method="post">
                            <button  class="action"  type="edit" formaction="editStaff.jsp?id=${result.staffid}">EDIT</button>
                        </form>
                       <c:if test="${result.staffrole != 'Manager' }" > 
                        <form method="post">
                            <input type="hidden" name="staff" value="${result.staffid}">
                            <input type="hidden" name="action" value="deleteStaff">
                            <button  class="action"  type="delete" formaction="StaffServlet"  onclick="return confirm('Yakin untuk buang <c:out value="${result.staffname}"/> ?');">DELETE</button>
                        </form>
                   </c:if>
                    </td>
                </tr>
                </c:if>
            </c:forEach>
		<c:if test="${sessionScope.staffrole != 'Clerk' ||sessionScope.staffrole!= 'Manager'}}" > 
           <div style="background-color:red; color:white;padding:10px;">
			YOU DO NOT HAVE ACCESS TO MANAGE ACCOUNT PLEASE REFER CLERK TO MAKE CHANGES
           </div>
           
           </c:if>
            
        </table>
    </div>
    <br><br><br>
</div>

</body>
<style>
    h3{color: black;}
    #myInput{display: inline-block;width: 500px ;}
    .hidetext { -webkit-text-security: circle; /* Default */ }
    
</style>

</html>