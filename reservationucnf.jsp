<%@ include file="sessionvaltu.jsp"%>

<html>
<head>
<title>TRAIN BOOKING DETAILS</title>
</head>
<!--<body onkeydown="return(event.keyCode == 154)">!-->
<body onkeydown="return(event.keyCode == 154)"style="background-color:white;" >
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
    PreparedStatement ps1,ps2,ps3,ps4,ps5;
    public void jspInit()
    {
        try
        { 
			Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/train","root","tiger");
            ps1 = con.prepareStatement("insert into train_reservation(Train_Number,Train_Name,Frm,To1,Classc,Ticket_Type,Passenger_Names,Passengers_age,Adult,Child,Couch,Berth,Base_Fare,Class_Fare,Quota_Fare,Fare,Km,Booked_on,Booked_For,Booked_By,Gender,pay_mode)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			//ps1 = con.prepareStatement("insert into train_reservation(Train_Name,Frm,To1,Classc,Ticket_Type,Passenger_Names,Passengers_age,Adult,Child,Couch,Berth,Base_Fare,Class_Fare,Quota_Fare,Fare,Km,Booked_on,Booked_For,Booked_By)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		
            ps2 = con.prepareStatement("select * from train_reservation where Booked_On=? AND Booked_By=? ORDER BY Booked_On");
              ps3 = con.prepareStatement("INSERT INTO train_sitting(name, age, gender, berth,tusr,tbd) VALUES (?,?,?, ?, ?, ?)");
            ps4 = con.prepareStatement("select * from train_sitting where tbd=? AND tusr=? ORDER BY tbd DESC");
              String query = "SELECT CONCAT( TIME_FORMAT(STR_TO_DATE(Booked_On, '%H:%i:%s %Y-%m-%d'), '%h:%i:%s %p'), ' ', DATE_FORMAT(STR_TO_DATE(Booked_On, '%H:%i:%s %Y-%m-%d'), '%d-%b-%Y') ) AS Book, DATE_FORMAT(STR_TO_DATE(Booked_For, '%Y-%m-%d'), '%d-%b-%Y') AS journey FROM train_reservation WHERE Booked_On=? AND booked_by=?";
           ps5 = con.prepareStatement(query);
    
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
%>

<% 
       
         int tno11=Integer.parseInt(request.getParameter("tn"));
        String tname = request.getParameter("tname");
        String s = request.getParameter("s");
        String d = request.getParameter("d");
        String tcl = request.getParameter("tcl");
        String tt = request.getParameter("tt");
        String pname = request.getParameter("pname");
       // int pge1=Integer.parseInt(request.getParameter("page1"));
       String pge1 = request.getParameter("page1");
        String gen = request.getParameter("gen");


         int ad=Integer.parseInt(request.getParameter("ad"));
         int ch=Integer.parseInt(request.getParameter("ch"));
        String couch = request.getParameter("couch");
        String berth = request.getParameter("berth");
        int bsf=Integer.parseInt(request.getParameter("bsf"));
        int acc=Integer.parseInt(request.getParameter("acc"));
        int tc=Integer.parseInt(request.getParameter("tc"));
        int fr=Integer.parseInt(request.getParameter("fr"));
        int km=Integer.parseInt(request.getParameter("km"));
         String dob = request.getParameter("dob");
         String doj = request.getParameter("doj");
         String usr = request.getParameter("usr");
         String pmt = request.getParameter("pm");
         

    
        ps1.setInt(1,tno11);
        ps1.setString(2,tname);
		ps1.setString(3,s);
        ps1.setString(4,d);
        ps1.setString(5,tcl);
        ps1.setString(6,tt);
        ps1.setString(7,pname);
	//	ps1.setInt(8,pge1);
       ps1.setString(8,pge1);
        ps1.setInt(9,ad);
        ps1.setInt(10,ch);
        ps1.setString(11,couch);
        ps1.setString(12,berth);
        ps1.setInt(13,bsf);
        ps1.setInt(14,acc);
        ps1.setInt(15,tc);
        ps1.setInt(16,fr);
        ps1.setInt(17,km);
        ps1.setString(18,dob);
        ps1.setString(19,doj);
        ps1.setString(20,usr);
        ps1.setString(21,gen);
        ps1.setString(22,gen);
                 
       



         int cnt = ps1.executeUpdate();

		  if(cnt>0)
		  {  

    
          String[] pnameValues = request.getParameterValues("pname2[]");
    String[] pageValues = request.getParameterValues("page[]");
    String[] pgenValues = request.getParameterValues("pgen[]");
    String[] pbthValues = request.getParameterValues("pbth[]");

 
    for (int i1 = 0; i1 < pnameValues.length; i1++) {
        String pname2 = pnameValues[i1];
        String pageValue = pageValues[i1];
        String pgen = pgenValues[i1];
        String pbth = pbthValues[i1];

        // Input validation (you can add more checks based on your requirements)
        if (pname2 != null && pageValue != null && pgen != null && pbth != null) {
            ps3.setString(1, pname2);
            ps3.setString(2, pageValue);
            ps3.setString(3, pgen);
            ps3.setString(4, pbth);
            ps3.setString(5, usr);
            ps3.setString(6, dob);

            int cnt2 = ps3.executeUpdate();

           /* if (cnt2 > 0) {
                 out.println("<center><font color=blue><h3>Passenger " + (i1 + 1) + " added successfully</h3></font></center>");
                 }*/ 
        } 
    }

    out.println("</table></center>");


                   //int tn1=Integer.parseInt(request.getParameter("tn"));
           
           String dob1 = request.getParameter("dob");
           String usr1 = request.getParameter("usr");
           ps2.setString(1,dob1);
           ps2.setString(2,usr1);

           String dob1t = request.getParameter("dob");
           String usr1t = request.getParameter("usr");
           ps4.setString(1,dob1t);
           ps4.setString(2,usr1t);

 out.println("<center><h3><font color=orange>HAPPY JOURNEY</font></h3></center>");
out.println("<center>");
out.println("<form>");
out.println("<fieldset style='width:80%;'>");
out.println("<table bgcolor=EDF2F4>");

	out.println("<tr>");
        out.println("<td>&nbsp&nbsp&nbsp<img src=images/train11.jpg width=220 height=180 style=float: left; margin-right:5px;></td>");
        out.println("<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<h3><font color=Blue>&nbspELECTRIC RESERVATION SLIP(ERS) E-TICKET</font></h3>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>");
        //out.println("<td><img src=images/train11.jpg margin-right:5px;></td>");
        out.println("<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<img src=images/qr.jpg width=220 height=180 style=float: right; margin-right:5px;></td>");
                out.println("</tr>");

ResultSet rs2 = ps2.executeQuery();
while (rs2.next()) {
  out.println("<tr>");
        out.println("<td><b>Booked FROM:&nbsp</b>"+s+"</td>");
       
       
       String dobt = request.getParameter("dob");
          
            String usrt = request.getParameter("usr");
           ps5.setString(1,dobt);
           ps5.setString(2,usrt);

ResultSet rs5 = ps5.executeQuery();

while (rs5.next()) {
    String Book = rs5.getString("Book");
    String journey = rs5.getString("journey");

    out.println("<td><b>Depature:</b>&nbsp" + journey + "</td>");
    out.println("<td><b>TO:</b>&nbsp" + rs2.getString(5) + "</td>");
    out.println("</tr>");
    out.println("<tr>");

    out.println("<td><b>PNR NUMBER:</b>&nbsp" + rs2.getInt(1) + "</td>");
    out.println("<td><b>TRAIN NUMBER:</b>&nbsp" + rs2.getInt(2) + "&nbsp&nbsp&nbsp&nbsp<b>TRAIN NAME:</b>&nbsp" + rs2.getString(3) + "</td>");
    out.println("<td><b>CLASS:</b>&nbsp" + rs2.getString(6) + "</td>");
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

    ResultSet rs3 = ps4.executeQuery();
    while (rs3.next()) 
    {
        out.println("<ol type=1>");
        out.println("<tr>");
        out.println("<td><li>" + rs3.getString(2) + "</li></td>");
        out.println("</ol>");
        out.println("<td>" + rs3.getString(3) + "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp"+rs3.getString(4)+"</td>");
        out.println("<td>&nbsp&nbspCNF/"+rs2.getString(12) +"/"+rs3.getInt(5)+"/"+rs3.getString(6)+"&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspCNF/"+ rs2.getString(12) +"/"+rs3.getInt(5)+"/"+rs3.getString(6)+ "</td>");
        out.println("</tr>");
        
    }

 out.println("<tr>");
    out.println("<td colspan='3'><font color=blue>Payment Details</font></td>");
    out.println("</tr>");
        out.println("<tr>");
        out.println("<td><b>Base Fare:&nbsp</b>"+bsf+"</td>");
        out.println("<td><b>Adult:&nbsp</b>"+ad+"</td>");
        out.println("<td><b>Child:&nbsp</b>"+ch+"</td>");
       out.println("</tr>");
         
         out.println("<tr>");
        out.println("<td><b>Class Charges:&nbsp</b>"+acc+"</td>");
         out.println("<td><b>Quota Charges:&nbsp</b>"+tc+"</td>");
          out.println("<td><b>Total RS:&nbsp</b>"+fr+"&nbsp&nbsp&nbsp <b>Payment Mode:&nbsp</b>"+pmt+"</td>");
          out.println("</tr>");






}


out.println("</table>");


    

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

  out.println("<p><font color=blue>SKA Railwyas Recovers Only 61% of Cost of Travel on an average Ticket & Reservation Tickets</font></p>");
         out.println("<p>* The printed Departure and Arrival Times are liable to change. Please Check correct departure, arrival from Railway Station Enquiry or Dial 139 or SMS RAIL to 139.</p>");
        out.println("<p>* This ticket is booked on a personal User ID, its sale/purchase is an offence u/s 143 of the Railways Act,2.</p>");
       out.println("<p><font color=red>* Prescribed original ID proof is required while travelling along with SMS/ VRM/ ERS otherwise will be treated as without ticket and penalized as per Railway Rules.</font></p>");
        out.println("<p><font color=red>* If a Person Who/Whoom Travelling In Trains Without a Ticket then its Totally Illegal and Will Fined Upto RS 5000</font></p>");
        out.println("<p><font color=blue>SKAR OR ITS AFFILIATES NEVER ASK FOR YOUR PERSONAL BANK OR SECURITY DETAILS , PLEASE BE AWARE IF ANYONE IS ASKING FOR YOUR ATM PIN CVV NUMBER</font></p>");
       out.println("<p><font color=blue>SKA Railwyas Recovers Only 61% of Cost of Travel on an average Ticket & Reservation Tickets</font></p>");







out.println("</fieldset>");
out.println("</form>");



     	    }
		     else
		   {
			  
			   out.println("<center><font color=blue><h3>TRAIN RESERVATION UN SUCCESSFULL</h3></font></center>");
		       
		   }
	    Map<String, String> formData = (Map<String, String>) session.getAttribute("formData");
    
    if (formData == null) {
        // Handle the case where data is not found in the session
        formData = new HashMap<>();
    }
		      
out.println("<button onclick=window.print()> PRINT</button>");
out.println("<button onclick=window.close()> CLOSE</button>");
out.println("</center>");
%>



<%!

    public void jspDestroy()
    {
        try
        {
                 ps1.close();
				ps2.close();
                ps3.close();
                ps4.close();
                ps5.close();
                 con.close();
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
%>
 <script type="text/javascript">
        // Prompt before refreshing the page
        window.onbeforeunload = function() {
            return "Are you sure you want to refresh?";
        };
    </script>
</body>
</html>