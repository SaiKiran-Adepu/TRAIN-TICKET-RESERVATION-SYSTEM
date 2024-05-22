<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*,java.util.*" %>

<%!
    Connection con;
    PreparedStatement ps1;
	public void jspInit()
    {
        try
        {
            
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/train","root","tiger");
            ps1 = con.prepareStatement("select *from train_Admins where name= ? and password=?");
  
		}
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
%>

<%
        
        String adname = request.getParameter("namem");
        String adpass = request.getParameter("passm");
        ps1.setString(1,adname); 
        ps1.setString(2,adpass);
      
        ResultSet rs = ps1.executeQuery();
        int cnt = 0;
        if (rs.next())
           cnt = rs.getInt(1);
          //cnt=session.setAttribute("adm",name1);
        if(cnt == 0)
		{
              out.println("<center><h2><font color=red>Invalid credential</font></h2></center>");
              String t ="una1a.jsp";
             response.sendRedirect(t);
		}
		else
        {
               //session.setAttribute("session","TRUE"); 
             //String name1 = request.getParameter("namem");
             //session.setAttribute("adm","name1"); //we need to session here after a db
             String name=request.getParameter("namem");  
              // out.print("Welcome "+name);  
              session.setAttribute("adm",name); 
            
            out.println("<form><fieldset style= width:25%; >");
            out.println("<b><i><font color=red>WELCOME ADMIN: &nbsp"+adname+"</font></i></b><br>");
            out.println("<b><i><font size=4 color=blue>WELCOME TO SKA RAILWAYS</font></i></b>");
            out.println("</fieldset></form>");
			 
        }
    
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>WELCOME ADMIN</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {margin:0;font-family:Arial}
.topnav {
  overflow: hidden;
  background-color: #333;
}

.topnav a {
  float: left;
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.active {
  background-color: #04AA6D;
  color: white;
}

.topnav .icon {
  display: none;
}

.dropdown {
  float: left;
  overflow: hidden;
}

.dropdown .dropbtn {
  font-size: 17px;    
  border: none;
  outline: none;
  color: white;
  padding: 14px 16px;
  background-color: inherit;
  font-family: inherit;
  margin: 0;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  float: none;
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.topnav a:hover, .dropdown:hover .dropbtn {
  background-color: #555;
  color: white;
}

.dropdown-content a:hover {
  background-color: #ddd;
  color: black;
}

.dropdown:hover .dropdown-content {
  display: block;
}

@media screen and (max-width: 600px) {
  .topnav a:not(:first-child), .dropdown .dropbtn {
    display: none;
  }
  .topnav a.icon {
    float: right;
    display: block;
  }
}

@media screen and (max-width: 600px) {
  .topnav.responsive {position: relative;}
  .topnav.responsive .icon {
    position: absolute;
    right: 0;
    top: 0;
  }
  .topnav.responsive a {
    float: none;
    display: block;
    text-align: left;
  }
  .topnav.responsive .dropdown {float: none;}
  .topnav.responsive .dropdown-content {position: relative;}
  .topnav.responsive .dropdown .dropbtn {
    display: block;
    width: 100%;
    text-align: left;
  }
}
</style>
<style>
    body {
      background-image: url('images/train16.jpg');
      background-repeat: no-repeat;
      background-attachment: fixed;
      background-size: cover;
    }
    
    </style>

<br>
<div class="topnav" id="myTopnav">
  
  <a class="active" href="index.html">HOME</a>
   <div class="dropdown">
    <button class="dropbtn">TRAIN ADMIN 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
       <a href="newtrain.jsp" target="_blank">ADD NEW TRAIN</a>
       <a href="addstnaa.jsp" target="_blank">ADD NEW TRAIN STATIONS</a>
	  <a href="addfare.jsp" target="_blank">ADD NEW STATION FARE</a>
    <a href="changefare.jsp" target="_blank">CHANGE TRAIN FARE</a>
	  <a href="#">CHANGE TRAIN TIME Pending</a>
    </div>
  </div> 
  <div class="dropdown">
    <button class="dropbtn">TRAINS
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="ticketaa.jsp" target="_blank">RESERVATION</a>
      <a href="genticket.jsp" target="_blank">GENERAL TICKET</a>
       <a href="downloadticketa.jsp" target="_blank">PRINT TICKET</a>
       <a href="Trainsch.jsp" target="_blank">TRAIN SCHEDULE</a>
      <a href="PNRa.jsp" target="_blank">PNR ENQUIRY</a>
    <a href="adtrainenq.jsp" target="_blank">TRAIN ENQUIRY</a>
    <a href="cantada.jsp" target="_blank">CANCEL E-TICKET</a>
    <a href="cantapa.jsp" target="_blank">PRINT CANCELLED TICKET</a>
        </div>
  </div> 
    <div class="dropdown">
    <button class="dropbtn" >FUND
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="fresa.jsp" target="_blank">RESERVATION</a>
      <a href="fgena.jsp" target="_blank">GENERAL TICKET</a>
    </div>
  </div> 
   <a href="stations.jsp" target="_blank">TRAIN STATIONS</a>
     <a href="instructiona.jsp" target="_blank">INSTRUCTIONS</a>
     <a href="newseventsa.jsp" target="_blank">NEWS&EVENTS</a>

   <div class="dropdown">
    <button class="dropbtn" >FEEDBACK 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="adfeedva.jsp" target="_blank">VIEW ALL FEEDBACKS</a>
      <a href="adfeedvp.jsp" target="_blank">VIEW FEEDBACKS</a>
      <a href="adfeedel.jsp" target="_blank">DELETE FEEDBACK</a>
    </div>
  </div> 
  
  	  <a id="lblTime"></a>
	  <a href="logout.jsp"><img src="images/lo3.png" width="28"height="22" placeholder="logout" name="logout"></a>
    <a href="javascript:void(0);" style="font-size:15px;" class="icon" onclick="myFunction()">&#9776;</a>
</div>

<div style="padding-left:16px">
 
</div>
 <script type="text/javascript" src="datetime.js"></script>
<script>
function myFunction() {
  var x = document.getElementById("myTopnav");
  if (x.className === "topnav") {
    x.className += " responsive";
  } else {
    x.className = "topnav";
  }
}
</script>
<br>
	
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
  box-sizing: border-box;
}


/* Style the header */
header {
 
  padding: 30px;
  text-align: center;
  font-size: 35px;
  color: white;
}

/* Create two columns/boxes that floats next to each other */
nav {
  float: left;
  width: 30%;
  height: 300px; /* only for demonstration, should be removed */
 
  padding: 20px;
}

/* Style the list inside the menu */
nav ul {
  list-style-type: none;
  padding: 0;
}

article {
  float: left;
  padding: 20px;
  width: 70%;
  
  height: 300px; /* only for demonstration, should be removed */
}

/* Clear floats after the columns */
section::after {
  content: "";
  display: table;
  clear: both;
}

/* Style the footer */
footer {
  
  padding: 300px;
  text-align: center;
  color: white;
}

/* Responsive layout - makes the two columns/boxes stack on top of each other instead of next to each other, on small screens */
@media (max-width: 600px) {
  nav, article {
    width: 100%;
    height: auto;
  }
}
</style>
<style>
* {
  box-sizing: border-box;
}

/* Style the header */
header {
  padding: 0px;
  text-align: center;
  font-size: 35px;
  color: white;
}

/* Create two columns/boxes that floats next to each other */
nav {
  float: left;
  width: 40%;
  height: 200px; /* only for demonstration, should be removed */
  padding: 40px;
}

/* Style the list inside the menu */
nav ul {
  list-style-type: none;
  padding:50;
}

article {
  float: right;
  padding: 60px;
  width: 50%;
  height: 100px; /* only for demonstration, should be removed */
}

/* Clear floats after the columns */
section::after {
  content: "";
  display: table;
  clear: both;
}

/* Style the footer */
footer {
   padding:300px;
  text-align: center;
  color:white;
}

/* Responsive layout - makes the two columns/boxes stack on top of each other instead of next to each other, on small screens */
@media (max-width: 600px) {
  nav, article {
    width: 90%;
    height: auto;
  }
}
</style>
<body>
<section>
  <nav>
<h3><font color="blue">THE ADMINS</font></h3>
   <ol type="a">
	<li><h4><font style="color:rgb(8, 111, 236)">SAI</font></h4></li>
	<li><h4><font style="color:white">SAI KIRAN</font></h4></li>
	<li><h4><font style="color:rgb(0, 255, 128)">RAMESH</font></h4></li>
	<li><h4><font style="color:rgb(11, 11, 238)">RAJITHA</font></h4></li>

   </ol>
   </nav>
   <article>
    <h1><font size="100"Style="color:azure">SKA-RAILWAYS</font></h1>
	<font size="6"Style="color:azure">Safety | Security | Punctuality</font>
	<br>
	<br>
</article>
</section>
<footer>
        	     <p>Each people plan their Toure for A vaction that where they got Enjoyment along with Happiness.</p>
  Copyright © SKA RAILWAY DEVELOPMENTS ALL RIGHTS RECEIVED 2023</div>

</footer>
</body>
</html>

<%!
    public void jspDestroy()
    {
        try
        {
    
            ps1.close();
        
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
%>
