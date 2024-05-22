<html>
<head>
<title>Users Feedback</title>
</head>
<body onkeydown="return(event.keyCode == 154)">
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
		
            ps2 = con.prepareStatement("insert into train_ufeedback(name,feedback,dateofeed)values(?,?,?)");
                        
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
%>
<%
        
        String na = request.getParameter("name");
        String fe = request.getParameter("feed");
        String dof = request.getParameter("dofdb");

         ps2.setString(1,na);
		  ps2.setString(2,fe);
         ps2.setString(3,dof);
		
       
	     int cnt = ps2.executeUpdate();
		  if(cnt>0)
		  {
			   out.println("<center><h2><font color=green>THE SKA RAILWAYS</font></h2></center>");
			   out.println("<center><font color=blue><h3>Your feedback submitted</h3></font></center>");
               //out.println("<center><font color=blue><h3>Thank You For Your FeedBack</h3></font></center>");
		       out.println("<center><img src=images/thank.jpg width=600 height=250></img></center>");
				out.println("<br>");
                 out.println("<center>");
                 out.println("<table border=2px bgcolor=#b0c4de width=80>");
			  out.println("<tr>");
			  out.println("<th>NAME</th>");
			  out.println("<th>FEEDBACK</th>");
              out.println("<th>DATE OF FEEDBACK</th>");
              out.println("</tr>");
               out.println("<tr>");
			  out.println("<td>"+na+"</td>");
			  out.println("<td>"+fe+"</td>");
              out.println("<td>"+dof+"</td>");
              out.println("</tr>");
			  out.println("</table>");
			    out.println("</center>");
        
                //out.println("<center><h2><font color=green>Your Account number is </font></h2></center>");
		
          }

		     else
		   {
			  
			   out.println("<center><font color=blue><h3>FEEDBACK UN SUCCESSFULL</h3></font></center>");
		       
		   }
           
           
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
</body>

</html>