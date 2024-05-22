<%@ include file="sessionvaltu.jsp"%>
<html>
<head>
<title>UPCOMMING AND PAST JOURNEY'S</title>
</head>
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
    PreparedStatement ps1,ps2;
    public void jspInit()
    {
        try
        { 
			Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/train","root","tiger");
            //ps1 = con.prepareStatement("insert into train_reservation(Train_Number,Train_Name,Frm,To1,Classc,Ticket_Type,Passenger_Names,Passengers_age,Adult,Child,Couch,Berth,Base_Fare,Class_Fare,Quota_Fare,Fare,Km,Booked_on,Booked_For,Booked_By,Tad)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			//ps1 = con.prepareStatement("insert into train_reservation(Train_Name,Frm,To1,Classc,Ticket_Type,Passenger_Names,Passengers_age,Adult,Child,Couch,Berth,Base_Fare,Class_Fare,Quota_Fare,Fare,Km,Booked_on,Booked_For,Booked_By)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

            ps2 = con.prepareStatement("select PNR,Frm,To1,Train_Number,Train_Name,Classc,Booked_For,status from train_reservation where Booked_By=? ORDER BY PNR DESC");
                        
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
%>


<%
   
       Integer i1=(Integer)session.getAttribute("nu"); 
		      int k1=i1.intValue(); //users downloading ticket

        ps2.setInt(1,k1);
           out.println("<center>");
        out.println("<h2><font color=blue>The Upcomming/Past Journey Details</font></h2>");
		out.println("<table border=3 bgcolor=EDF2F4>");
		out.println("<tr>");
		out.println("<td>PNR NUMBER</td>");
        out.println("<td>STATUS</td>");
        out.println("<td>From</td>");
        out.println("<td>To</td>");
        out.println("<td>Train Number</td>");
        out.println("<td>Train Name</td>");
        out.println("<td>Class</td>");		
        out.println("<td>Date</td>");
        out.println("<td>Action</td>");
		out.println("</tr>");
      ResultSet rs = ps2.executeQuery();

         while(rs.next())
        {
       
            out.println("<tr>");
		//out.println("\n ammount in bank");
           out.println("<td>"+rs.getInt(1)+"</td>");
           String s1="Confirm";
           out.println("<td>"+rs.getString(8)+"</td>");
           out.println("<td>"+rs.getString(2)+"</td>");
			out.println("<td>"+rs.getString(3)+"</td>");
            out.println("<td>"+rs.getInt(4)+"</td>");
            out.println("<td>"+rs.getString(5)+"</td>");
            out.println("<td>"+rs.getString(6)+"</td>");
            out.println("<td>"+rs.getString(7)+"</td>");
             out.println("<td><a href=journeydotu.jsp>download</a></td>");
            //out.println("<td>"+rs.getString(7)+"</td>");
            
			//out.println("<td>"+rs.getString(6)+"</td>");
			//out.println("<td>"+rs.getString(7)+"</td>");

            out.println("</tr>");
        }
        out.println("</table>");
		out.println("</center>");

        rs.close();
    
	%>
	<%!
    public void jspDestroy()
    {
        try
        {
            //colse
            //ps1.close();
            ps2.close();
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