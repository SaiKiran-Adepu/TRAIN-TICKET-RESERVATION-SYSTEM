<%@ include file="sessionvala.jsp"%>
<html>
<head>
<title>DOWNLOAD TRAIN RESERVATION DETAILS</title>
</head>
<body onkeydown="return(event.keyCode == 154)">

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
      
            ps2 = con.prepareStatement("select * from train_reservation where PNR=? ORDER BY PNR DESC");
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
           ps2.setInt(1,pnr);
           ps3.setInt(1,pnr);
           
            ResultSet rs2 = ps2.executeQuery();
  
            out.println("<center><h3><font color=orange>TICKET NUMBER WITH PNR</font></h3></center>");
        out.println("<center>");
        out.println("<from>");
        out.println("<fieldset style=width:80%;>");
        out.println("<center><h3><font color=orange>HAPPY JOURNEY</font></h3></center>");
        //out.println("<center><h3><font color=Blue>&nbspElectric Reservation Slip(ERS)</font></h3></center>");
        //out.println("<img src=images/train11.jpg alt=Sunflower style=float: left; margin-right:5px;>");
		out.println("<table bgcolor=EDF2F4");
		out.println("<tr>");
        out.println("<td>&nbsp&nbsp&nbsp<img src=images/train11.jpg width=220 height=180 style=float: left; margin-right:5px;></td>");
        out.println("<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<h3><font color=Blue>&nbsp&nbspElectric Reservation Slip(ERS) E-TICKET</font></h3>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>");
        //out.println("<td><img src=images/train11.jpg margin-right:5px;></td>");
        out.println("<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<img src=images/qr.jpg width=220 height=180 style=float: right; margin-right:5px;></td>");
                out.println("</tr>");
  
                  while(rs2.next())
             {
          
     out.println("<tr>");
        out.println("<td><b>Booked FROM:&nbsp</b>"+rs2.getString(4)+"</td>");
       
       
int pnrt = Integer.parseInt(request.getParameter("pnr"));
ps4.setInt(1, pnrt);

ResultSet rs4 = ps4.executeQuery();

while (rs4.next()) {
    String Book = rs4.getString("Book");
    String journey = rs4.getString("journey");

    out.println("<td>Depature:&nbsp" + journey + "</td>");
    out.println("<td>TO:&nbsp" + rs2.getString(5) + "</td>");
    out.println("</tr>");
    out.println("<tr>");

    out.println("<td>PNR NUMBER:&nbsp" + rs2.getInt(1) + "</td>");
    out.println("<td>TRAIN NUMBER:&nbsp" + rs2.getInt(2) + "&nbsp&nbsp&nbsp&nbspTRAIN NAME:&nbsp" + rs2.getString(3) + "</td>");
    out.println("<td>CLASS:&nbsp" + rs2.getString(6) + "</td>");
    out.println("</tr>");
    out.println("<tr>");
    out.println("<td>QUOTA:&nbsp" + rs2.getString(7) + "</td>");
    out.println("<td>KM:&nbsp" + rs2.getInt(19) + "</td>");
    out.println("<td>BOOKING DATE:&nbsp" + Book + "</td>");
}
out.println("</tr>");


          out.println("<tr>");
    out.println("<td colspan='3'><font color=blue>Passenger Details</font></td>");
    out.println("</tr>");

  out.println("<tr>");
    out.println("<td><b># Passenger Name</b></td>");
    out.println("<td><b>Age &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Gender</b></td>");
    out.println("<td><b>Current Status &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Booking Status</b></td>");
    out.println("</tr>");


        ResultSet rs3 = ps3.executeQuery();
        while (rs3.next()) 
      {
        out.println("<ol type=1>");
        out.println("<tr>");
        out.println("<td><li>" + rs3.getString(2) + "</li></td>");
        out.println("</ol>");
        out.println("<td>" + rs3.getString(3) + "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp"+rs3.getString(4)+"</td>");
        out.println("<td>&nbsp&nbsp"+rs2.getString(25)+"/"+ rs2.getString(12) +"/"+rs3.getInt(5)+"/"+rs3.getString(6)+"&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp CNF/"+ rs2.getString(12) +"/"+rs3.getInt(5)+"/"+rs3.getString(6)+ "</td>");
        out.println("</tr>");
        
    }
     out.println("<tr>");
    out.println("<td colspan='3'><font color=blue>Payment Details</font></td>");
    out.println("</tr>");
        out.println("<tr>");
        out.println("<td><b>Base Fare:&nbsp</b>"+rs2.getInt(15)+"</td>");
        out.println("<td><b>Adult:&nbsp</b>"+rs2.getInt(10)+"</td>");
        out.println("<td><b>Child:&nbsp</b>"+rs2.getInt(11)+"</td>");
       out.println("</tr>");
         
         
         out.println("<tr>");
        out.println("<td><b>Class Charges:&nbsp</b>"+rs2.getInt(16)+"</td>");
         out.println("<td><b>Quota Charges:&nbsp</b>"+rs2.getInt(17)+"</td>");
          out.println("<td><b>Total RS:&nbsp</b>"+rs2.getInt(18)+"&nbsp&nbsp<b>Payment Mode:</b>&nbsp"+rs2.getString(28)+"</td>");
          //out.println("&nbsp&nbsp&nbsp&nbspTicket Booked by Admin:&nbsp&nbsp"+rs2.getString(23)+"</td>");
          out.println("</tr>");


        out.println("</table>");
         out.println("</br>");
      out.println("<h2>INSTRUCTIONS</h2>");
           out.println("<p><font color=blue>* Observations CNF-> Confirmed and CAN-> Cancelled</font></p>");
       
        out.println("<ol type=1>");
        out.println("<li>Prescribed Photo Identity Proofs Are Voter Identity card / Passport / Aadhar card / Photo Id Issued By Central/State Govt.</li>");
       out.println("<li>PNRs Having fully Waiting List Status is Droped and Automatically Refunded to User Account at the time of Train Reached to its Destination.(WL) and Passengers Travelling fully Waiting list is treated as Ticketless </li>");
        out.println("<li>In Case of Train is Delayed for 4 Hours Then Refund is Admissible. or In Case of train cancellation on its entire Run Then Toatal RS/Fund Refunded To users Account Automatically.</li>");
          out.println("<li>In case, on a party e-ticket or a family e-ticket issued for travel of more than one passenger, some passengers have confirmed reservation and others are on RAC or waiting list, full refund of fare, less clerkage, shall be admissible for confirmed passengers also subject to the condition that the ticket shall be cancelled online or online TDR shall be filed for all the passengers upto thirty minutes before the scheduled departure of the tram.</li>");
        out.println("<li>Never Purchase E-Tickets From Unauthorized Persons or persons using thier ID as Commercial purpose Because of the Ticket Refunded Ammount will Refunded to their Account,All The Users Need To Regester Them Selfs In The Web site For Ticket Booking Purpose Its Free of Cost And Easy To Book At SKAR</li>");
        
          out.println("<li>While booking this ticket, you have agreed of having read the Health Protocol of Destination State of your travel. You are again advised to clearly read the Health Protocol advisory of destination state before start of your travel and follow them properly.</li>");
          out.println("</ol>");
           //out.println("<p><font color=blue>SKA Railwyas Recovers Only 61% of Cost of Travel on an average Ticket & Reservation Tickets</font></p>");
         out.println("<p>* The printed Departure and Arrival Times are liable to change. Please Check correct departure, arrival from Railway Station Enquiry or Dial 139 or SMS RAIL to 139.</p>");
        out.println("<p>* This ticket is booked on a personal User ID, its sale/purchase is an offence u/s 143 of the Railways Act,2.</p>");
       out.println("<p><font color=red>* Prescribed original ID proof is required while travelling along with SMS/ VRM/ ERS otherwise will be treated as without ticket and penalized as per Railway Rules.</font></p>");
        out.println("<p><font color=red>* If a Person Who/Whoom Travelling In Trains Without a Ticket then its Totally Illegal and Will Fined Upto RS 5000</font></p>");
        out.println("<p><font color=blue>SKAR OR ITS AFFILIATES NEVER ASK FOR YOUR PERSONAL BANK OR SECURITY DETAILS , PLEASE BE AWARE IF ANYONE IS ASKING FOR YOUR ATM PIN CVV NUMBER</font></p>");
       out.println("<p><font color=blue>SKA Railwyas Recovers Only 61% of Cost of Travel on an average Ticket & Reservation Tickets</font></p>");
      
        //out.println("<p><font color=orange>The Ticket is Valid for 4 hrs Only or Departure of First Train</font></p>");
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