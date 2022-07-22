<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
---------------stafff----------------
	<form id="signform" action="LoginServlet" method="post">
         <div class="mssg">
            SIGN IN<br>
            <input type="text" name="username" placeholder="Enter Username" value="" required>
            <input type="password" name="password" placeholder="Enter Password" value="" required>
            <button type="cancel" class="cancel" onclick="location.href='index.jsp'">CANCEL</button>
            <input type="hidden" name="action" value="stafflogin">
            <button type="signin" class="signIn" name="submit" >SIGN IN</button>
         </div>
      </form>
      
      
      ---------customer----
      <form id="signform" action="LoginServlet" method="post">
         <div class="mssg">
            SIGN IN<br>
            <input type="text" name="username" placeholder="Enter Username" value="" required>
            <input type="password" name="password" placeholder="Enter Password" value="" required>
            <button type="cancel" class="cancel" onclick="location.href='index.jsp'">CANCEL</button>
            <input type="hidden" name="action" value="custlogin">
            <button type="signin" class="signIn" name="submit" >SIGN IN</button>
         </div>
      </form>
      	<form  method="post" action="CustomerServlet">
     
                <label >Name</label>
                <input type="text" name="custName" value="" ><br>

                <label>Phone</label>
                <input type="text" name="custPhone" value=""><br>

                <label>IC No.</label>
                <input type="text" name="custNRIC" value=""><br>
                
                  <label>Address</label>
                <input type="text" name="custAddress" value=""><br>
                
                 <label>License No.</label>
                <input type="text" name="custLicense" value=""><br><br>
                 <label>Username</label>
                <input type="text" name="custUsername" value=""><br>
                
                 <label>Password</label>
                <input type="text" name="custPassword" value=""><br><br>
                

            <div id="mybutton" class="button">
                <button type="cancel" name="action"  value="cancel" >CANCEL</button>
                <input type="hidden" name="action" value="custSignup">
                <button type="submit"  name="submit" >ADD</button><br><br>
            </div>
        </form>
</body>
<style>
label{display:block;width:100px;}
</style>
</html>