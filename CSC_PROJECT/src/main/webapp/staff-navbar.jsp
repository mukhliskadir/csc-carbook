<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <script src="https://kit.fontawesome.com/9bff21277a.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="JS/script.js"></script>
    <script src="JS/sortTable.js"></script>
    <script src="JS/searchTable.js"></script>
    
</head>
<body>


<div class="sidebar">
<div class="GeneratedText">CARBOOK</div>


  <form>
    <button type="logout" formaction="ManageStaff.jsp" style="margin-left: 40px;margin-bottom: 40px;">MANAGE ACCOUNT</button>
  </form>
  		     <a  href="staff-dashboard.jsp"><i class="fa-solid fa-chart-column"></i>  Dashboard</a>
      <a href="staff-bookList.jsp"><i class="fa-solid fa-notes-medical"></i>  Booking</a>
      <a href="ManageCar.jsp"><i class="fa-solid fa-car"></i>  Cars Info</a>
            <a href="staff-pickupCar.jsp"><i class="fa-solid fa-arrow-right"></i> Pickup Car</a>
      <a href="staff-returnCar.jsp"><i class="fa-solid fa-arrow-left"></i> Return Car</a>
      <a href="staff-report.jsp"><i class="fa-solid fa-print"></i>  Report</a>
	<form method="get" action="LoginServlet">
        <input type="hidden" name="action" value="stafflogout">
        <button id="logot" type="logout" onclick="return confirm('Yakin untuk keluar?')">LOG OUT</button>
    </form>
</div>

<div class = "header" style="">
	<h3 style="color:black;">  <%     Object name = session.getAttribute("staffname"); %>
  <br>	<br>  <div class="profname" style="margin-left: 10px;margin-top: -35px;font-weight: bold;font-size: 20px;margin-bottom: 20px;margin-right: 30px;text-align:center;"><%=name %></div>
</h3>
</div>


</body>
<script src="https://code.jquery.com/jquery-3.3.1.js">
</script>
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