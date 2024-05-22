<html>
<head>
<title>View User Feedback</title>
</head>
<body>
<%@ include file="packaget.jsp"%>

  <%
  
       //HttpSession session = request.getSession(true);
        String name1=(String)session.getAttribute("adm");  
		if(name1==null)
		{
			response.sendRedirect("una1a.jsp");
		}
		else //sessions for redirection and direct url accessing
		{
	    //out.println("<textarea rows1 cols=15 >"+name1+"</textarea>"); 				
		 //response.sendRedirect("una1.jsp");// at buttom of form like train added by admin
		}
 %>
 
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
		
            ps2 = con.prepareStatement("select * from train_ufeedback where feedback_number=?");
                        
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
%>
<%
        

        int fn=Integer.parseInt(request.getParameter("fn"));
        ps2.setInt(1,fn);
       

       out.println("<center><h2><font color=green>THE SKA RAILWAYS</font></h2></center>");
       out.println("<center><h2><font color=blue>THE FEEDBACK DETAILS</font></h2></center>");
			   //out.println("<center><font color=blue><h3>Your feedback submitted</h3></font></center>");
               //out.println("<center><font color=blue><h3>Thank You For Your FeedBack</h3></font></center>");
		      //out.println("<center><img src=images/thank.jpg width=600 height=250></img></center>");
				out.println("<br>");
                 out.println("<center>");
                 out.println("<table border=2px bgcolor=#b0c4de width=80>");
			  out.println("<tr>");
              out.println("<th>FEEDBACK NUMBER</th>");
			  out.println("<th>USER NUMBER</th>");
              out.println("<th>USER NAME</th>");
			  out.println("<th>FEEDBACK</th>");
              out.println("<th>DATE OF FEEDBACK</th>");
              out.println("</tr>");
	    ResultSet rs = ps2.executeQuery();

		    while(rs.next())
        {
       
               out.println("<tr>");
			  out.println("<td>"+rs.getInt(1)+"</td>");
			  out.println("<td>"+rs.getInt(2)+"</td>");
              out.println("<td>"+rs.getString(3)+"</td>");
              out.println("<td>"+rs.getString(4)+"</td>");
               out.println("<td>"+rs.getString(5)+"</td>");
              out.println("</tr>");
			 
                //out.println("<center><h2><font color=green>Your Account number is </font></h2></center>");
		
          }
    out.println("</table>");
			    out.println("</center>");
        
           
           
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