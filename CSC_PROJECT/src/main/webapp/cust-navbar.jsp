<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/9bff21277a.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="JS/script.js"></script>
    <script src="JS/sortTable.js"></script>
    <script src="JS/searchTable.js"></script>
        <link rel="stylesheet" href="css/style.css">
    
</head>
<body>

<div class="sidebar">
<div class="GeneratedText">CARBOOK</div>


  <form>
    <button type="logout" style="margin-left: 40px;margin-bottom: 40px;"></button>
  </form>

  
  		<a href="cust-dashboard.jsp"><i class="fa-solid fa-chart-column"></i>  BOOKING</a>
		<a href="cust-Booklist.jsp"><i class="fa-solid fa-notes-medical"></i>  RECORD</a>  
	<form method="get" action="LoginServlet">
        <input type="hidden" name="action" value="custLogout">
        <button id="logot" type="logout" onclick="return confirm('Yakin untuk keluar?')">LOG OUT</button>
    </form>
</div>

<div class = "header" style="">
	<h3 style="color:black;">  <%     Object name = session.getAttribute("custname"); %>
  <br>	<br>  <div class="profname" style="margin-left: 10px;margin-top: -35px;font-weight: bold;font-size: 20px;margin-bottom: 20px;margin-right: 30px;text-align:center;"><%=name %></div>
</h3>
</div>


</body>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script>
$(function($) {
	  let url = window.location.href;
	  $('.sidebar a').each(function() {
	    if (this.href === url) {
	      $(this).closest('a').addClass('active');
	    }
	  });
	});
    {var dt = new Date();
        document.getElementById("datetime").innerHTML = dt.toLocaleString();
    }
  { const weekday = ["Ahad","Isnin","Selasa","Rabu","Khamis","Jumaat","Sabtu"];

    const d = new Date();
    let day = weekday[d.getDay()];
    document.getElementById("hari").innerHTML = day;}
    
    {
    
    	
    }
</script>
</html>