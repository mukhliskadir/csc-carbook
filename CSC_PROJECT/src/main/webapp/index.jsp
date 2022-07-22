<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	    <link rel="stylesheet" href="css/style.css">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<title>Auto Rental</title>
<div class="headerr">
<div class="GeneratedText">CARBOOK</div>
	<button class="account" name="stafflogin" type="staff" onclick="signAlert2()">STAFF</button>
	<button class="account" name="signup" type="print" onclick="signupAlert()">SIGN UP</button>
	<button class="account" name="login" type="print" onclick="signAlert()">LOG IN</button>
	
	
</div>
</head>
<body>
	

	<div id="navbar">
		
	   <br> <marquee style="font-size:25px;">WELCOME TO CARBOOK.    	WE ARE NOW AT JASIN MELAKA, ENJOY OUR BEST SERVICES</marquee>
	 </div>

	 	<div id="slideshow" style="width: 100%;height: 1000px;">
		  <img class="mySlides" src="IMG/saga1.jpg" style="width:100%">
		 
		</div>
	<form id="signform" action="LoginServlet" method="post">
    <div class="mssg">CUSTOMER LOG IN <br>
        <input type="text" name="username" placeholder="Enter Username" value="" required>
        <input type="password" name="password" placeholder="Enter Password" value="" required>
        <button type="cancel" class="cancel" onclick="location.href='index.jsp'">CANCEL</button>
        <input type="hidden" name="action" value="custlogin">
        <button type="print" class="signIn" name="submit">LOG IN</button>
    </div>
    </form>
     
     <form id="staffsignform" action="LoginServlet" method="post">
    <div class="mssg"> STAFF LOG IN <br>
        <input type="text" name="username" placeholder="Enter Username" value="" required>
        <input type="password" name="password" placeholder="Enter Password" value="" required>
        <button type="cancel" class="cancel" onclick="location.href='index.jsp'">CANCEL</button>
        <input type="hidden" name="action" value="stafflogin">
        <button type="print" class="signIn" name="submit">LOG IN</button>
    </div>
    </form>
     
         
        
     <div id="signupform">
   <div class="msssg">
            SIGN UP<br>
             <form  method="post" action="CustomerServlet">
            <input type="text" name="custName" placeholder="Enter Name" required>
            <input type="number" name="custNRIC" placeholder="Enter IC Number" required>
            <input type="text" name="custPhone" placeholder="Enter Phone Number" pattern="[0-9]{3}-[0-9]{8}"required>
            <textarea name="custAddress" placeholder="Enter Address" required></textarea>
            <input type="text" name="custLicense" placeholder="Enter License ID" required>
            <input type="text" name="custUsername" placeholder="Enter Username" required>
            <input type="password" name="custPassword" placeholder="Enter Password"required>
              
                
                   <button type="cancel" name="action"  value="cancel" onclick="location.href='index.jsp'">CANCEL</button>
                <input type="hidden" name="action" value="custSignup">
                <button type="print"  name="submit" >REGISTER</button>
               </form>
</div>
        
         
      </div>


</body>
<style >
	body{margin: 0;font-family: Arial, Helvetica, sans-serif;height: 100%;}
	.headerr {height: 110px; background-color: rgba(0, 0, 0, 0.4);overflow: hidden;padding-right: 30px;}
	.headerr img{float: left;}
	.account{float: right;margin-top: 25px;margin-right: 3px;}
	#navbar{background-color: #b3ecff;height: 70px;overflow: hidden;list-style: none;text-align: center;}
	.sticky {position: fixed;top: 0;width: 100%;}
	#navbar a {text-align: center;float: left;text-decoration: none;padding: 13px;color: black;}
	a:hover{background-color: rgba(0, 0, 0, 0.2);}
	.sticky + .content {padding-top: 60px;}
	#slideshow .search{position: absolute;top: 50%;left: 50%;transform: translate(-50%, -50%); width: 800px;height: 300px;background-color: rgba(255, 255, 255, 0.9);border-radius: 25px;border: 4px solid #d9870d;text-align: center;padding: 10px;}
	#slideshow{overflow: hidden;}
	#signform {
            display: none;
            background-color:#d1d1e0;
            color: #000000;
            border: 5px solid black ;
            border-radius: 25px;
            padding: 15px;
            position: fixed;
            width: 500px;
            height: 250px;
            left: 35%;
            top: 250px;
            box-sizing: border-box;
            text-align: center;
         }
         	#staffsignform {
            display: none;
            background-color:#d1d1e0;
            color: #000000;
            border: 5px solid black ;
            border-radius: 25px;
            padding: 15px;
            position: fixed;
            width: 500px;
            height: 250px;
            left: 35%;
            top: 250px;
            box-sizing: border-box;
            text-align: center;
         }
        #signupform {
            display: none;
            background-color:#d1d1e0;
            color: #000000;
            border: 5px solid black ;
            border-radius: 25px;
            padding: 15px;
            position: fixed;
            width: 500px;
            height: 580px;
            left: 35%;
            top: 150px;
            box-sizing: border-box;
            text-align: center;
         }
       
         #signform button,#signupform button{padding-bottom: 10px;}
	h6{font-size: 5	0px;}
	.GeneratedText {
font-family:'Arial Black', sans-serif;font-size:2em;margin:30px;float:left;dispay:block;letter-spacing:0em;line-height:1.3em;color:white;
}
</style>
<script >
	window.onscroll = function() {myFunction()};

var navbar = document.getElementById("navbar");
var sticky = navbar.offsetTop;

function myFunction() {
  if (window.pageYOffset >= sticky) {
    navbar.classList.add("sticky")
  } else {
    navbar.classList.remove("sticky");
  }
}
function signAlert(msg, myYes) {
			
            var confirmBox = $("#signform");
            confirmBox.find(".mssg").text(msg);
            confirmBox.find(".signIn").unbind().click(function() {
              
               confirmBox.hide();
            });
            confirmBox.find(".cancel").unbind().click(function() {
               confirmBox.hide();
            });
            confirmBox.find(".signIn").click(myYes);
            confirmBox.show();}
function signAlert2(msg, myYes) {
	
    var confirmBox = $("#staffsignform");
    confirmBox.find(".mssg").text(msg);
    confirmBox.find(".signIn").unbind().click(function() {
   
       confirmBox.hide();
    });
    confirmBox.find(".cancel").unbind().click(function() {
       confirmBox.hide();
    });
    confirmBox.find(".signIn").click(myYes);
    confirmBox.show();}
function signupAlert(msg, myYes) {
			
            var confirmBox = $("#signupform");
            confirmBox.find(".msssg").text(msg);
            confirmBox.find(".submit").unbind().click(function() {
           
               confirmBox.hide();
            });
            confirmBox.find(".cancel").unbind().click(function() {
               confirmBox.hide();
            });
            confirmBox.find(".submit").click(myYes);
            confirmBox.show();}


</script>
</html>