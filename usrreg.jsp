<%@ include file="packaget.jsp"%>
<html>
<head>
<title>New User Registration</title>
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

<%!
    Connection con;
    PreparedStatement ps1,ps2;
    public void jspInit()
    {
        try
        { 
			Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/train","root","tiger");
             ps1 = con.prepareStatement("insert into train_users (USERNAME,PASSWORD,GENDER,ADDRESS,MOBILE_NUMBER,DOB,IDT,IDN,DOR)values(?,?,?,?,?,?,?,?,?)");
			//ps2 = con.prepareStatement("select cuid,username from userp where username= ? and Doo=? order by CUID DESC");
			ps2 = con.prepareStatement("select user_no,username,IDT,IDN,dor from train_users where username= ? and dor=? and password=?");

        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
%>
<%
        
        //int cuid=Integer.parseInt(request.getParameter("cuid"));
        String uname = request.getParameter("username");
        String pass = request.getParameter("pass");
		String gen = request.getParameter("gen");
		String address = request.getParameter("addr");
		//String phone = request.getParameter("phn");
		//int phone=Integer.parseInt(request.getParameter("phn"));
		String phone = request.getParameter("phn");
        String dob = request.getParameter("dob");
        String idt1 = request.getParameter("idt");
        String idn1 = request.getParameter("idn");
		String dor = request.getParameter("dor");
		//ps1.setInt(1,cuid);
        ps1.setString(1,uname);
		ps1.setString(2,pass);
		ps1.setString(3,gen);
		ps1.setString(4,address);
		ps1.setString(5,phone);
		ps1.setString(6,dob);
        ps1.setString(7,idt1);
        ps1.setString(8,idn1);
		ps1.setString(9,dor);
        
	    int cnt = ps1.executeUpdate();
		  if(cnt>0)
		  {
			   out.println("<center><h2><font color=green>WelCome to SKA RAILWAYS</font></h2></center>");
			   out.println("<center><font color=blue><h3>New User Registration Successfull</h3></font></center>");
		       out.println("<center><img src=images/welcome.jpg width=600 height=250></img></center>");
				//out.println("<center><h2><font color=green>Your Account number is </font></h2></center>");
				out.println("<center><h2><font color=orange>Please Keep User Number,User Name and Password For Further Steps</font></h2></center>");

        out.println("</table>");
		//out.println("<center><h2><font color=orange>This Site Is Developed By SKA Developments</font></h2></center>");
		 	  
		out.println("</center>");
		
          String u1 = request.getParameter("username");
          ps2.setString(1,u1);
	     String dr1 = request.getParameter("dor");
          ps2.setString(2,dr1);
           String p1 = request.getParameter("pass");
          ps2.setString(3,p1);
         ResultSet rs2 = ps2.executeQuery();
        
        out.println("<center>");
		out.println("<table border=3 bgcolor=#ffefd5 height=10 width=500>");
		out.println("<tr>");
		out.println("<th>USER_NUMBER</th>");
		out.println("<th>USER NAME</th>");
        out.println("<th>ID TYPE</th>");
        out.println("<th>ID NUMBER</th>");
        out.println("<th>DATE OF REGISTER</th>");
		
		out.println("</tr>");
         while(rs2.next())
        {
            out.println("<tr>");
            out.println("<td>"+rs2.getInt(1)+"</td>");
            out.println("<td>"+rs2.getString(2)+"</td>");
            out.println("<td>"+rs2.getString(3)+"</td>");	
            out.println("<td>"+rs2.getString(4)+"</td>");	
            out.println("<td>"+rs2.getString(5)+"</td>");		
			 out.println("</tr>");
        }
        out.println("</table>");
		//out.println("<center><h2><font color=orange>This Site Is Developed By SKA Developments</font></h2></center>");
		out.println("</center>");

		    }

		     else
		   {
			  
			   out.println("<center><font color=blue><h3>NEW USER REGISTRATION UN SUCCESSFULL</h3></font></center>");
		       
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