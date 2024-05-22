<html>
<head>
<title>TRAIN SCHEDULE DETAILS</title>
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

  border: solid orange;
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
            ps2 = con.prepareStatement("select Train_Number,Train_Name,FStation,Class,Ticket_Type from trains Where Train_Number=? ORDER BY Train_Number");
                        
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
%>

<% 
          
       int trn=Integer.parseInt(request.getParameter("trn"));
           
         
           ps2.setInt(1,trn);
           
            ResultSet rs2 = ps2.executeQuery();
                  while(rs2.next())
             {
         
   out.println("<center><font color=blue><h3>TRAIN SCHEDULE</h3></font></center>");
        out.println("<center>");
        out.println("<from>");
        out.println("<fieldset style=width:100%;>");
        out.println("<center><h3><font color=orange>TRAIN ARRIVAL AND DEPATURE</font></h3></center>");
       out.println("<table bgcolor=EDF2F4 width=50>");
        out.println("<tr>");
		          out.println("<th>TRAIN NUMBER</th>");
		         out.println("<th>TRAIN NAME</th>");
          out.println("<th>STATIONS</th>");
          out.println("<th>CLASS AVAILABLE</th>");
          out.println("<th>QUOTA</th>"); 
		       out.println("</tr>");


       
        out.println("<tr>");
        out.println("<td>"+rs2.getInt(1)+"</td>");
        out.println("<td>"+rs2.getString(2)+"</td>");
        out.println("<td>"+rs2.getString(3)+"</td>");
     
        out.println("<td>"+rs2.getString(4)+"</td>");
        out.println("<td>"+rs2.getString(5)+"</td>");
        out.println("</tr>");
        
        out.println("<tr>");
      
       
     
        out.println("</tr>");
    
        out.println("</table>");
        out.println("</br>");
        //out.println("<p><font color=blue>SKA Railwyas Recovers Only 61% of Cost of Travel on an average Ticket & Reservation Tickets</font></p>");
        out.println("<p><font color=red>* If a Person Who/Whoom Travelling In Trains Without a Ticket then its Totally Illegal and Will Fined Upto RS 5000</font></p>");
        out.println("<p><font color=blue>SKAR OR ITS AFFILIATES NEVER ASK FOR YOUR PERSONAL BANK OR SECURITY DETAILS , PLEASE BE AWARE IF ANYONE IS ASKING FOR YOUR ATM PIN CVV NUMBER</font></p>");
       out.println("<p><font color=blue>SKA Railwyas Recovers Only 61% of Cost of Travel on an average Ticket & Reservation Tickets</font></p>");
        out.println("<h2>INSTRUCTIONS</h2>");
        out.println("<li>Never Purchase E-Tickets From Unauthorized Persons or persons using thier ID as Commercial purpose Because of the Ticket Refunded Ammount will Refunded to their Account,All The Users Need To Regester Them Selfs In The Web site For Ticket Booking Purpose Its Free of Cost And Easy To Book At SKAR</li>");
        
              out.println("</fieldset>");
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