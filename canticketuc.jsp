<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement" %>
<%@ include file="sessionvaltu.jsp" %>

<html>
<head>
<title>TICKET CANCELLED DETAILS</title>
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
<%@ include file="packaget.jsp" %>

<%
Connection con = null;
PreparedStatement ps1 = null, ps2 = null, ps4 = null, ps5 = null,ps6 = null;
try {
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost/train", "root", "tiger");
    ps1 = con.prepareStatement("update train_reservation set status=?, can_on=?, refund_rs=?,pay_mode=? where pnr=?");
    ps2 = con.prepareStatement("select * from train_reservation where can_On=? AND pnr=? ORDER BY can_On");
    ps4 = con.prepareStatement("select * from train_sitting where pnr=? ORDER BY tbd DESC");
    String query = "SELECT CONCAT( TIME_FORMAT(STR_TO_DATE(Booked_On, '%H:%i:%s %Y-%m-%d'), '%h:%i:%s %p'), ' ', DATE_FORMAT(STR_TO_DATE(Booked_On, '%H:%i:%s %Y-%m-%d'), '%d-%b-%Y') ) AS Book, DATE_FORMAT(STR_TO_DATE(Booked_For, '%Y-%m-%d'), '%d-%b-%Y') AS journey FROM train_reservation WHERE can_on=? AND pnr=?";
    ps5 = con.prepareStatement(query);
     String query1 = "SELECT CONCAT( TIME_FORMAT(STR_TO_DATE(can_On, '%H:%i:%s %Y-%m-%d'), '%h:%i:%s %p'), ' ', DATE_FORMAT(STR_TO_DATE(can_On, '%H:%i:%s %Y-%m-%d'), '%d-%b-%Y') ) AS cantct FROM train_reservation WHERE pnr=?";
    ps6 = con.prepareStatement(query1);
} catch (Exception ex) {
    ex.printStackTrace();
}
%>

<%
int pnrt = Integer.parseInt(request.getParameter("pnr"));
int cfe = Integer.parseInt(request.getParameter("cfe"));
int refam = Integer.parseInt(request.getParameter("refam"));
String cantc = request.getParameter("can");
String dotct = request.getParameter("dot");
String pmt = request.getParameter("pm");

try {
    ps1.setString(1, cantc);
    ps1.setString(2, dotct);
     ps1.setInt(3, refam);
     ps1.setString(4, pmt);
    ps1.setInt(5, pnrt);
    int cnt = ps1.executeUpdate();
} catch (Exception ex) {
    ex.printStackTrace();
}

String dob1 = request.getParameter("dot");
ps2.setString(1, dob1);
ps2.setInt(2, pnrt);
ps4.setInt(1, pnrt);


out.print("<center>");
out.print("<h3><font color=red>Reservation Cancellation Details</font></h3>");

out.print("<form>");
out.print("<fieldset style=width:80%;>");
out.print("<table bgcolor=EDF2F4>");


    out.println("<tr>");
    out.println("<td>&nbsp;&nbsp;&nbsp;<img src=\"images/train11.jpg\" width=\"220\" height=\"180\" style=\"float: left; margin-right:5px;\"></td>");
    out.println("<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<h3><font color=\"Blue\">&nbsp;ELectronic Cancellation Slip(ECS)</font></h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>");
    out.println("<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src=\"images/qr.jpg\" width=\"220\" height=\"180\" style=\"float: right; margin-right:5px;\"></td>");
    out.println("</tr>");


ResultSet rs2 = ps2.executeQuery();
while (rs2.next()) {

    out.println("<tr>");
    out.println("<td><b>Booked FROM:&nbsp;</b>" + rs2.getString(4) + "</td>");

    String dobt = request.getParameter("dob");
    String usrt = request.getParameter("usr");
    ps5.setString(1, dotct);
    ps5.setInt(2, pnrt);
   
    ps6.setInt(1, pnrt);

    ResultSet rs5 = ps5.executeQuery();

    while (rs5.next()) {
        String Book = rs5.getString("Book");
        String journey = rs5.getString("journey");

        out.println("<td><b>Depature:</b>&nbsp;" + journey + "</td>");
        out.println("<td><b>TO:</b>&nbsp;" + rs2.getString(5) + "</td>");
        out.println("</tr>");
        out.println("<tr>");

        out.println("<td><b>PNR NUMBER:</b>&nbsp;" + rs2.getInt(1) + "</td>");
        out.println("<td><b>TRAIN NUMBER:</b>&nbsp;" + rs2.getInt(2) + "&nbsp;&nbsp;&nbsp;&nbsp;<b>TRAIN NAME:</b>&nbsp;" + rs2.getString(3) + "</td>");
        out.println("<td><b>CLASS:</b>&nbsp;" + rs2.getString(6) + "</td>");
        out.println("</tr>");
        out.println("<tr>");
        out.println("<td>QUOTA:&nbsp;" + rs2.getString(7) + "</td>");
        out.println("<td>KM:&nbsp;" + rs2.getInt(19)+"&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp BOOKING DATE: "+Book + "</td>");
       
        ResultSet rs6 = ps6.executeQuery();
       while (rs6.next()) {
        String cantct = rs6.getString("cantct");
       
        out.println("<td>CANCELLED DATE:&nbsp;" + cantct + "</td>");
       }
    }
    out.println("</tr>");

    out.println("<tr>");
    out.println("<td colspan='3'><font color='blue'>Passenger Details</font></td>");
     out.println("<tr>");
    out.println("<td><b># Passenger Name</b></td>");
    out.println("<td><b>Age &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Gender</b></td>");
    out.println("<td><b>Booking Status &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp Current Status</b></td>");
    out.println("</tr>");
    out.println("</tr>");

    ResultSet rs3 = ps4.executeQuery();
    while (rs3.next()) {
        out.println("<ol type='1'>");
        out.println("<tr>");
        out.println("<td><li>" + rs3.getString(2) + "</li></td>");
        out.println("</ol>");
        out.println("<td>" + rs3.getString(3) + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + rs3.getString(4) + "</td>");
        out.println("<td>&nbsp;&nbsp;CNF/" + rs2.getString(12) + "/" + rs3.getInt(5) + "/" + rs3.getString(6) + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp&nbsp&nbsp;&nbsp;&nbsp;"+rs2.getString(25)+"&nbsp<font color=red>(CANCELLED)</font></td>");
        out.println("</tr>");
    }
 out.println("<tr>");
    out.println("<td colspan='3'><font color='blue'>Payment Details</font></td>");
    out.println("</tr>");
    out.println("<tr>");
        out.println("<td><b>Total Fare:&nbsp</b>"+rs2.getInt(18)+"</td>");
        out.println("<td><b>Cancellation Fee:&nbsp</b>"+cfe+"&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<b>Total Refund Amount RS:&nbsp</b>"+refam+"</td>");
        out.println("<td><b>Payment Mode:&nbsp</b>"+pmt+"</td>");
       out.println("</tr>");
}

         
       


out.print("</table>");


out.println("<h2>INSTRUCTIONS</h2>");

  out.println("<p><font color=blue>* Observations CNF-> Confirmed and CAN-> Cancelled</font></p>");

out.println("<ol type='1'>");
out.println("<li>Prescribed Photo Identity Proofs Are Voter Identity card / Passport / Aadhar card / Photo Id Issued By Central/State Govt.</li>");
out.println("<li>PNRs Having fully Waiting List Status is Droped and Automatically Refunded to User Account at the time of Train Reached to its Destination.(WL) and Passengers Travelling fully Waiting list is treated as Ticketless </li>");
out.println("<li>In Case of Train is Delayed for 4 Hours Then Refund is Admissible. or In Case of train cancellation on its entire Run Then Toatal RS/Fund Refunded To users Account Automatically.</li>");
out.println("<li>In case, on a party e-ticket or a family e-ticket issued for travel of more than one passenger, some passengers have confirmed reservation and others are on RAC or waiting list, full refund of fare, less clerkage, shall be admissible for confirmed passengers also subject to the condition that the ticket shall be cancelled online or online TDR shall be filed for all the passengers upto thirty minutes before the scheduled departure of the tram.</li>");
out.println("<li>Never Purchase E-Tickets From Unauthorized Persons or persons using thier ID as Commercial purpose Because of the Ticket Refunded Ammount will Refunded to their Account,All The Users Need To Regester Them Selfs In The Web site For Ticket Booking Purpose Its Free of Cost And Easy To Book At SKAR</li>");
out.println("<li>While booking this ticket, you have agreed of having read the Health Protocol of Destination State of your travel. You are again advised to clearly read the Health Protocol advisory of destination state before start of your travel and follow them properly.</li>");
out.println("</ol>");
out.println("<p>* The printed Departure and Arrival Times are liable to change. Please Check correct departure, arrival from Railway Station Enquiry or Dial 139 or SMS RAIL to 139.</p>");
out.println("<p>* This ticket is booked on a personal User ID, its sale/purchase is an offence u/s 143 of the Railways Act,2.</p>");
out.println("<p><font color='red'>* Prescribed original ID proof is required while travelling along with SMS/ VRM/ ERS otherwise will be treated as without ticket and penalized as per Railway Rules.</font></p>");
out.println("<p><font color='red'>* If a Person Who/Whoom Travelling In Trains Without a Ticket then its Totally Illegal and Will Fined Upto RS 5000</font></p>");
out.println("<p><font color='blue'>SKAR OR ITS AFFILIATES NEVER ASK FOR YOUR PERSONAL BANK OR SECURITY DETAILS , PLEASE BE AWARE IF ANYONE IS ASKING FOR YOUR ATM PIN CVV NUMBER</font></p>");
out.println("<p><font color='blue'>SKA Railwyas Recovers Only 61% of Cost of Travel on an average Ticket & Reservation Tickets</font></p>");


out.print("</fieldset>");
out.print("</form>");

out.print("<button onclick=window.print()>PRINT</button>&nbsp&nbsp");
out.print("<button onclick=window.close()>CLOSE</button>");
out.print("</center>");

%>


<%
try {
    if (ps1 != null) {
        ps1.close();
        ps2.close();
        ps4.close();
        ps5.close();
         ps6.close();
    }
    if (con != null) {
        con.close();
    }
} catch (Exception ex) {
    ex.printStackTrace();
}
%>

</body>
</html>
