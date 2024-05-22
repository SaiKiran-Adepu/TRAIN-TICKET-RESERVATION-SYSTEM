<html>
<head>
<title>Delete Feedback</title>
</head>
<body>
<%@ include file="sessionvala.jsp"%>
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
		
            ps2 = con.prepareStatement("delete from train_ufeedback where feedback_number=?");
                        
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
%>
<%
        

        int fnd=Integer.parseInt(request.getParameter("fnd"));
        ps2.setInt(1,fnd);
       

       out.println("<center><h2><font color=green>THE SKA RAILWAYS</font></h2></center>");
       out.println("<center><h2><font color=blue>FEEDBACK DETAILS</font></h2></center>");
			  

              int cnt = ps2.executeUpdate();
           if(cnt>0)
		   {
			   out.println("<center><font color=red><h3>Feedback Successfully Deleted.</h3></font></center>");
		       out.println("<center><img src=images/train5.jpg width=300 height=200></img></center>");
           out.println("<br>");
                 out.println("<center>");
                 out.println("<table border=2px bgcolor=#b0c4de width=80>");
			  out.println("<tr>");
              out.println("<th>FEEDBACK NUMBER</th>");
			  out.println("</tr>");
              out.println("<tr>");
              out.println("<td>"+fnd+"</td>");
              out.println("</tr>");
           }
				else 
				{
					out.println("<center><font color=blue><h3>Feedback Delete Not Successfull / Not Exist</h3></font></center>");
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
  width: 10%;
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