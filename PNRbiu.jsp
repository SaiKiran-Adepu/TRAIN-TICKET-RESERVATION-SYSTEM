<html>
<head>
<title>PNR TRAIN BOOKING DETAILS</title>
</head>
<!--<body onkeydown="return(event.keyCode == 154)">-->
<body>
<style>
table {

  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {

  border: solid #dddddd;
  text-align: left;
  padding: 10px;
}

tr:nth-child(even) {

  background-color: #dddddd;
}
</style>
<%@ include file="packaget.jsp"%>
 
<%!

    Connection con;
    PreparedStatement ps2,ps3,ps4;
    public void jspInit()
    {
        try
        { 
			Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/train","root","tiger");
                     ps2 = con.prepareStatement("select PNR,Train_Number,Train_Name,Frm,To1,Classc,couch,Seat_Number,Berth,Booked_For,status from train_reservation where PNR=? ORDER BY PNR");
                         ps3 = con.prepareStatement("select * from train_sitting where pnr=? ORDER BY tbd DESC");
             String query = "SELECT CONCAT( TIME_FORMAT(STR_TO_DATE(Booked_On, '%H:%i:%s %Y-%m-%d'), '%h:%i:%s %p'), ' ', DATE_FORMAT(STR_TO_DATE(Booked_On, '%H:%i:%s %Y-%m-%d'), '%d-%b-%Y') ) AS Book, DATE_FORMAT(STR_TO_DATE(Booked_For, '%Y-%m-%d'), '%d-%b-%Y') AS journey FROM train_reservation WHERE pnr = ?";
           ps4 = con.prepareStatement(query);
   
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
%>

<% 
      

      
       int pnr=Integer.parseInt(request.getParameter("pnr"));
        int pnrs=Integer.parseInt(request.getParameter("pnr"));
           
         
           ps2.setInt(1,pnr);
           ps3.setInt(1,pnrs);
           //ps2.setString(2,usr1);
            
            ResultSet rs2 = ps2.executeQuery();
           
   out.println("<center><font color=blue><h3>PNR DETAILS</h3></font></center>");
        out.println("<center>");
        out.println("<from>");
        out.println("<fieldset style=width:75%;>");
        out.println("<center><h3><font color=orange>HAPPY JOURNEY</font></h3></center>");
        //out.println("<center><h3><font color=Blue>&nbspElectric Reservation Slip(ERS)</font></h3></center>");
        //out.println("<img src=images/train11.jpg alt=Sunflower style=float: left; margin-right:5px;>");
		out.println("<table bgcolor=EDF2F4");
		out.println("<tr>");
        out.println("<td>&nbsp&nbsp&nbsp<img src=images/train11.jpg width=220 height=180 style=float: left; margin-right:5px;></td>");
        out.println("<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<h2><font color=Blue>&nbspPNR DETAILS</font></h2>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>");
        //out.println("<td><img src=images/train11.jpg margin-right:5px;></td>");
        out.println("<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<img src=images/qr.jpg width=220 height=180 style=float: right; margin-right:5px;></td>");
                out.println("</tr>");
                  while(rs2.next())
             {
                 ResultSet rs3 = ps3.executeQuery();
             
        out.println("<tr>");
        out.println("<td>PNR NUMBER:&nbsp"+rs2.getInt(1)+"</td>");
        out.println("<td>TRAIN NUMBER:&nbsp"+rs2.getInt(2)+"&nbsp&nbsp&nbsp&nbsp</td>");
        out.println("<td>TRAIN NAME:&nbsp"+rs2.getString(3)+"</td>");
        out.println("</tr>");
        out.println("<tr>");
        out.println("<td>Booked FROM:&nbsp"+rs2.getString(4)+"</td>");
        out.println("<td>TO:&nbsp"+rs2.getString(5)+"</td>");
int pnrt = Integer.parseInt(request.getParameter("pnr"));
ps4.setInt(1, pnrt);

ResultSet rs4 = ps4.executeQuery();

while (rs4.next()) {
    String Book = rs4.getString("Book");
    String journey = rs4.getString("journey");

    //out.println("<td>Depature:&nbsp" + journey + "</td>");


        out.println("<td>CLASS:&nbsp"+rs2.getString(6)+"&nbsp&nbsp&nbspDepature:&nbsp"+journey+"</td>");
}
          //out.println("<td>td>");
        out.println("</tr>");
             while(rs3.next())
             {
          
        out.println("<tr>");
        out.println("<td>COUCH:&nbsp"+rs2.getString(7)+"</td>");
        out.println("<td>Seat/Berth Number:"+rs3.getInt(5)+"</td>");
        out.println("<td>Berth:&nbsp"+rs3.getString(6)+"&nbsp&nbsp&nbsp</td>");//direct by selected not by database table order
        
        out.println("</tr>");
    
        out.println("<td>Booking Status: CNF/"+rs2.getString(7)+"/"+rs3.getInt(5)+"/"+rs3.getString(6)+"&nbsp&nbsp</td><td></td>");
       out.println("<td>Current Status: "+rs2.getString(11)+"/"+rs2.getString(7)+"/"+rs3.getInt(5)+"/"+rs3.getString(6)+"</td>");
    
      
        out.println("</tr>");
             }
        out.println("</table>");
        out.println("</br>");
              out.println("<p><font color=blue>* Observations CNF-> Confirmed and CAN-> Cancelled</font></p>");
       
        out.println("<p><font color=blue>SKA Railwyas Recovers Only 61% of Cost of Travel on an average Ticket & Reservation Tickets</font></p>");
        out.println("<p><font color=red>* If a Person Who/Whoom Travelling In Trains Without a Ticket then its Totally Illegal and Will Fined Upto RS 5000</font></p>");
        out.println("<p><font color=blue>SKAR OR ITS AFFILIATES NEVER ASK FOR YOUR PERSONAL BANK OR SECURITY DETAILS , PLEASE BE AWARE IF ANYONE IS ASKING FOR YOUR ATM PIN CVV NUMBER</font></p>");
       out.println("<p><font color=blue>SKA Railwyas Recovers Only 61% of Cost of Travel on an average Ticket & Reservation Tickets</font></p>");
        out.println("<h2>INSTRUCTIONS</h2>");
        out.println("<li>Never Purchase E-Tickets From Unauthorized Persons or persons using thier ID as Commercial purpose Because of the Ticket Refunded Ammount will Refunded to their Account,All The Users Need To Regester Them Selfs In The Web site For Ticket Booking Purpose Its Free of Cost And Easy To Book At SKAR</li>");
        
              out.println("</fieldset>");
        out.println("<button onclick=window.print()> PRINT</button>");
        out.println("<button onclick=window.close()> CLOSE</button>");
        out.println("</from>");
		//out.println("<center><h2><font color=orange>This Site Is Developed By SKA Developments</font></h2></center>");
		out.println("</center>");

        
             }
		 

		 
		      
%>



<%!

    public void jspDestroy()
    {
        try
        {
                 //ps1.close();
				ps2.close();
                ps3.close();
                 ps4.close();
                 con.close();
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
%>
</body>
</html>