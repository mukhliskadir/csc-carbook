<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
      <%@include file="staff-navbar.jsp"%>

<body>
<div class="content" >
    <br>
    <h2>ADD CAR</h2>
 		<form  method="post" action="CarServlet">
             	<div class="dataa">
     
               <label >   Brand </label>
                <input type="text" name="carBrand" value="" ><br>
</div>        	<div class="dataa">

                <label>  Model</label> 
                <input type="text" name="carModel" value=""><br>
</div>        	<div class="dataa">

                <label>    Plate</label>
                <input type="text" name="carPlate" value=""><br>
              </div>        	<div class="dataa">
                
                  <label>    Price Per Day</label>
                <input type="text" name="carPrice" value=""><br>
             </div>        	<div class="dataa">
                
                 <label>Year Manufacture</label>
                <input type="text" name="carYear" value=""><br><br>
                
</div>
            <div id="mybutton" class="button">
                <button type="cancel" name="action"  value="cancel" >CANCEL</button>
                <input type="hidden" name="action" value="addCar">
                <button type="submit"  name="submit" >ADD</button><br><br>
            </div>
        </form>
        </div>
</body>
<style>
label{display:block;width:100px;}
</style>
</html>