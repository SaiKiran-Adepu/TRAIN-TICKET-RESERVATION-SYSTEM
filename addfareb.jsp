<%@ include file="sessionvala.jsp"%>
<html>
<head>
<title>ADD STATION & FARE</title>
</head>
<body onkeydown="return(event.keyCode == 154)">

<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 80%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
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
             ps1 = con.prepareStatement("insert into train_fare (Fstation,fare,km,tad)values(?,?,?,?)");
			//ps2 = con.prepareStatement("select user_no,username,dor from train_users where username= ? and dor=? and password=?");
            //update userreal set amt=amt-? where acid =? and pass=?

           
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
%>
<%
        
        String st = request.getParameter("stations");
        int fare=Integer.parseInt(request.getParameter("fare"));
        int km=Integer.parseInt(request.getParameter("km"));
        String adm = request.getParameter("adm");
		ps1.setString(1,st);
	    ps1.setInt(2,fare);
        ps1.setInt(3,km);
		ps1.setString(4,adm);
		//ps1.setString(4,adm);
        //int cnt=0;
	     int cnt = ps1.executeUpdate();
		  if(cnt>0)
		  {
			   out.println("<center><h2><font color=green>THE SKA RAILWAYS</font></h2></center>");
			   out.println("<center><font color=blue><h3>New Fare & Stations Successfull</h3></font></center>");
		       out.println("<center><img src=images/train9.jpg width=600 height=250></img></center>");
				out.println("<br>");
                 out.println("<center>");
                 out.println("<table border=2px bgcolor=#b0c4de width=80>");
			  out.println("<tr>");
			  out.println("<th>STATIONS</th>");
			  out.println("<th>FARE</th>");
              out.println("<th>KM</th>");
              out.println("<th>TRAIN ADMIN</th>");
			  out.println("</tr>");
               out.println("<tr>");
			  out.println("<td>"+st+"</td>");
			  out.println("<td>"+fare+"</td>");
              out.println("<td>"+km+"</td>");
              out.println("<td>"+adm+"</td>");
			  out.println("</tr>");
			  out.println("</table>");
			    out.println("</center>");
        
                //out.println("<center><h2><font color=green>Your Account number is </font></h2></center>");
		
          }

		     else
		   {
			  
			   out.println("<center><font color=blue><h3>NEW FARE & STATION UN SUCCESSFULL</h3></font></center>");
		       
		   }
           
       
		
		 
		      
%>
<%!
    public void jspDestroy()
    {
        try
        {
                 ps1.close();
				// ps2.close();
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