<%@ include file="sessionvala.jsp"%>
<html>
<head>
<title>GENERAL TICKETS</title>
</head>
<body onkeydown="return(event.keyCode == 154)">

<style>
table {

  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {

  border: 1px solid #dddddd;
  text-align: left;
  padding: 6px;
}

tr:nth-child(even) {

  background-color: #dddddd;
}
</style>
<%@ include file="packaget.jsp"%>

<%!

    Connection con;
    PreparedStatement ps1,ps2,ps3;
    public void jspInit()
    {
        try
        { 
			Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/train","root","tiger");
             ps1 = con.prepareStatement("insert into train_gtickets(Fstation,Tstation,Ticket,Adult,Child,RS,KM,Time)values(?,?,?,?,?,?,?,?)");
			ps2 = con.prepareStatement("select Ticket_number from train_gtickets where Time=? ORDER BY Time");
             String query = "SELECT CONCAT(TIME_FORMAT(STR_TO_DATE(Time, '%H:%i:%s %Y-%m-%d'), '%h:%i:%s %p'), ' ', DATE_FORMAT(STR_TO_DATE(Time, '%H:%i:%s %Y-%m-%d'), '%d-%b-%Y')) AS journey FROM train_gtickets WHERE Time=? ";
           ps3 = con.prepareStatement(query);
              
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
%>


<%
        
        //int tn=Integer.parseInt(request.getParameter("tn"));
        String s = request.getParameter("s");
        String d = request.getParameter("d");
         String gen = request.getParameter("gen");
		int ad=Integer.parseInt(request.getParameter("ad"));
        int ch=Integer.parseInt(request.getParameter("ch"));
        int bsf=Integer.parseInt(request.getParameter("bsf"));
		int rs=Integer.parseInt(request.getParameter("rs"));
		int km1=Integer.parseInt(request.getParameter("km"));
        String dc = request.getParameter("dc");
	


       // ps1.setInt(1,tn);
        ps1.setString(1,s);
		ps1.setString(2,d);
        ps1.setString(3,gen);
		ps1.setInt(4,ad);
        ps1.setInt(5,ch);
        ps1.setInt(6,rs);
        ps1.setInt(7,km1);
        ps1.setString(8,dc);
         int cnt = ps1.executeUpdate();
		  if(cnt>0)
		  {

			   //out.println("<center><font color=blue><h3>Ticket Successfully Cutted</h3></font></center>");
		       //out.println("<center><img src=images/train9.jpg width=600 height=250></img></center>");
				  
                  
                   //int tn1=Integer.parseInt(request.getParameter("tn"));
           String dc1 = request.getParameter("dc");
           ps2.setString(1,dc1);
         ResultSet rs2 = ps2.executeQuery();
                  
                  
                  while(rs2.next())
        {
            
            //out.println("<td>"+rs2.getInt(1)+"</td>");
            int q=rs2.getInt(1);
        

		
         
        out.println("<center>");
        out.println("<from>");
        out.println("<fieldset style=width:36%;>");
         out.println("<center><h4><font color=green>HAPPY JOURNEY</font></h4></center>");
        out.println("<img src=images/train11.jpg width=180 height=110 alt=Sunflower style=float: left; margin-right:5px;>");
		out.println("<table bgcolor=#ffefd5 border=2");
		out.println("<tr>");
		out.println("<td>FROM:&nbsp"+s+"</td>");
        //out.println("<td>"+s+"</td>");
        out.println("<td>TO:&nbsp"+d+"</td>");
        out.println("</tr>");
        out.println("<tr>");
		out.println("<td>TICKET:&nbsp"+gen+"</td>");
        //out.println("<td>"+gen+"</td>");
        out.println("<td>ADULT:&nbsp"+ad+"&nbspCHILD:&nbsp"+ch+"</td>");
        out.println("</tr>");
        out.println("<tr>");
		out.println("<td>TICKET NUMBER:&nbsp"+q+"</td>");
        //out.println("<td>B FARE:&nbsp"+bsf+"&nbspRS:&nbsp"+rs+"</td>");
         out.println("<td>B FARE:&nbsp"+bsf+"&nbspFARE:&nbsp"+rs+"</td>");
        out.println("</tr>");
        out.println("<tr>");
		out.println("<td>KM:&nbsp"+km1+"</td>");

         String dct = request.getParameter("dc");
           ps3.setString(1,dct);
ResultSet rs3 = ps3.executeQuery();

while (rs3.next()) {
    //String Book = rs3.getString("Book");
    String journey = rs3.getString("journey");



        out.println("<td>DATE:&nbsp"+journey+"</td>");
}
        out.println("</tr>");
        out.println("</table>");
        out.println("</br>");
        out.println("<p><font color=blue>SKA Railwyas Recovers Only 61% of Cost of Travel on an average Ticket & Reservation System</font></p>");
        out.println("<p><font color=orange>The Ticket is Valid for 4 hrs Only or Departure of First Train</font></p>");
        out.println("</fieldset>");
        out.println("<br>");
        out.println("<button onclick=window.print()> PRINT</button>");

        out.println("</from>");
		//out.println("<center><h2><font color=orange>This Site Is Developed By SKA Developments</font></h2></center>");
		out.println("</center>");

        }

		    }

		     else
		   {
			  
			   out.println("<center><font color=blue><h3>GENERAL TICKET CUTTING UN SUCCESSFULL</h3></font></center>");
		       
		   }

		 
		      
%>



<%!

    public void jspDestroy()
    {
        try
        {
                 ps1.close();
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