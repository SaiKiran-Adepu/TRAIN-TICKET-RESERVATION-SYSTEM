<html>
<head>
	<title>WELCOME USER</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
    body {
      background-image: url('images/train16.jpg');
      background-repeat: no-repeat;
      background-attachment: fixed;
      background-size: cover;
    }
    
    </style>
	
</head>
<body>
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
            ps1 = con.prepareStatement("select * from Train_Users where User_no= ? and UserName=? and password=?");
  
		}
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
%>

<%
   
       int nt =Integer.parseInt(request.getParameter("number"));
        String name = request.getParameter("name");
        String pass = request.getParameter("passc");
        ps1.setInt(1,nt);
        ps1.setString(2,name);
        ps1.setString(3,pass);
        
        ResultSet rs = ps1.executeQuery();
        int cnt = 0;
        if (rs.next())
           cnt = rs.getInt(1);
        if(cnt == 0)
		{
              out.println("<center><h2><font color=red>Invalid credential</font></h2></center>");
              String t ="una1u.jsp";
             response.sendRedirect(t);
		}
		else
        {
            
             session.setAttribute("session","TRUE");  
             int no1 =Integer.parseInt(request.getParameter("number"));
              String name1 = request.getParameter("name");
              session.setAttribute("nu",no1);
                //  the session automatically creating mean while its not valid user
             
             
             //String name1 = request.getParameter("name");
             //session.setAttribute("name1",name1);

            out.println("<form><fieldset style= width:25%;>");
            out.println("&nbsp<b><i><font color=orange>WELCOME USER NAME: &nbsp"+name1+" </font></i></b><br>");
            out.println("<b><i><font color=green>USER Number: &nbsp"+no1+"</font></i></b><br>");
            out.println("<b><i><font size=4 color=blue>WELCOME TO SKA RAILWAYS</font></i></b>");
            out.println("</fieldset></form>");
	   ResultSet rs1 = ps1.executeQuery();
        /*out.println("<center>");
		out.println("<table border=3 bgcolor=orange height=6 width=320>");
		out.println("<tr>");
		out.println("<th>USER NUMBER</th>");
		out.println("<th>USER NAME</th>");*/
       // out.println("<th>TIME</th>");
		//out.println("<th></th>");
		out.println("</tr>");
         while(rs1.next())
        {
           // out.println("<tr>");
	        //out.println("<td>"+rs1.getInt(1)+"</td>");
			//out.println("<td>"+rs1.getString(2)+"</td>");
            //out.println("<td>"+rs1.getString(3)+"</td>");
        
            out.println("</tr>");
		
        }
        out.println("</table>");
		out.println("</center>");

	 	 
        }
    
%>
<meta name="viewport" content="width=device-width, initial-scale=1">

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

@media screen and (max-width: 1200px) {
  .topnav a:not(:first-child), .dropdown .dropbtn {
    display: none;
  }
  .topnav a.icon {
    float: right;
    display: block;
  }
}

@media screen and (max-width: 1200px) {
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
<script type="text/javascript" src="datetime.js"></script>
</head>
<body>

<div class="topnav" id="myTopnav">
  <a class="active" href="index.html">HOME</a>
    <div class="dropdown">
    <button class="dropbtn">TRAINS 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="ticketua.jsp" target="_balnk">BOOK TICKET</a>
	  <a href="PNRiu.jsp" target="_blank">PNR STATUS</a>
    <a href="journeydotu.jsp" target="_blank">PRINT TICKET</a>
    <a href="Trainsch.jsp" target="_blank">TRAIN SCHEDULE</a>
    <a href="journeyucanu.jsp" target="_blank">CANCEL E TICKET</a>
    <a href="cantupa.jsp" target="_blank">PRINT CANCELLED TICKET</a>
    </div>
  </div>
  <div class="dropdown">
    <button class="dropbtn">MANAGE ACCOUNT 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
     <a href="journeyu.jsp" target="_blank">VIEW JOURNEYS</a>
      <a href="chpassu.jsp" target="_blank">UPDATE PASSWORD</a>
      <a href="chmblu.jsp" target="_blank">UPDATE MOBILE NUMBER</a>
      <a href="admomsl.jsp" target="_blank">ADD/MODIFY MASTER LIST pending.</a>
      <a href="#" target="_blank">DELETE RECENT JOURNEY LIST pending.</a>
      <a href="ufeed.jsp" target="_blank">FEEDBACK</a>
    </div>
  </div> 
  <a href="instructionsu.jsp" target="_blank">INSTRUCTIONS</a>
  <a href="newseventsu.jsp" target="_blank">NEWS&EVENTS</a>
  <a id="lblTime"></a>
	  <a href="logout.jsp"><img src="images/lo3.png" width="28"height="22" placeholder="logout" name="logout"></a>
 <a href="javascript:void(0);" style="font-size:15px;" class="icon" onclick="myFunction()">&#9776;</a>
</div>
<div style="padding-left:16px">
</div>

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
  padding:0;
}

article {
  float: right;
  padding: 20px;
  width: 50%;
  height: 20px; /* only for demonstration, should be removed */
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
<section>
  <nav>
<h3><font color="blue">THE ADMINS</font></h3>
   <ol type="a">
	<li><font style="color:rgb(8, 111, 236)">SAI</font></li>
	<li><font style="color:white">SAI KIRAN</font></li>
	<li><font style="color:rgb(0, 255, 128)">RAMESH</font></li>
	<li><font style="color:rgb(11, 11, 238)">RAJITHA</font></li>
	</ol>
   </nav>
   <article>
    <h1><font size="100"Style="color:azure">SKA-RAILWAYS</font></h1>
	<font size="6"Style="color:azure">Safety | Security | Punctuality</font>
</article>
</section>
<footer>
    	     <p>Each people plan their Toure for A vaction that where they got Enjoyment along with Happiness.</p>
  Copyright © SKA RAILWAY DEVELOPMENTS ALL RIGHTS RECEIVED 2023</div>

</footer>

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
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 40%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 9px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
   </body>
 </html>
