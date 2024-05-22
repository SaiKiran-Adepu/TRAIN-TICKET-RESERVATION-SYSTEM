<%@ include file="sessionvalu.jsp"%>
<%@ include file="packaget.jsp"%>

<html>
<head>
<title>USER MASTER LIST</title>
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
</body>
</html>

<%!
    Connection con;
    PreparedStatement ps1;
    public void jspInit()
    {
        try
        { 
			Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/train","root","tiger");
             ps1 = con.prepareStatement("insert into masterlist(uno,pname,ptype,dob,gender,bp,idt,idn)values(?,?,?,?,?,?,?,?)");
			//ps2 = con.prepareStatement("select cuid,username from userp where username= ? and Doo=? order by CUID DESC");
			//ps2 = con.prepareStatement("select user_no,username,IDT,IDN,dor from train_users where username= ? and dor=? and password=?");

        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
%>

<%
        
        int uno=Integer.parseInt(request.getParameter("uno"));
        String pname = request.getParameter("pname");
        String pt = request.getParameter("pt");
		String pdob = request.getParameter("pdob");
		String pgen = request.getParameter("pgen");
		String bp = request.getParameter("bp");
        String idt = request.getParameter("idt");
        String idn = request.getParameter("idn");
		//String dor = request.getParameter("dor");
		
		ps1.setInt(1,uno);
        ps1.setString(2,pname);
		ps1.setString(3,pt);
		ps1.setString(4,pdob);
		ps1.setString(5,pgen);
		ps1.setString(6,bp);
		ps1.setString(7,idt);
		ps1.setString(8,idn);
        
	    int cnt = ps1.executeUpdate();
		  if(cnt>0)
		  {
			   out.println("<center><h2><font color=green>WelCome to SKA RAILWAYS</font></h2></center>");
			   out.println("<center><font color=blue><h3>Master List Successfully Added</h3></font></center>");
		       out.println("<center><img src=images/welcome.jpg width=600 height=250></img></center>");
				//out.println("<center><h2><font color=green>Your Account number is </font></h2></center>");
				//out.println("<center><h2><font color=orange>Please Keep User Number,User Name and Password For Further Steps</font></h2></center>");

        out.println("</table>");
		//out.println("<center><h2><font color=orange>This Site Is Developed By SKA Developments</font></h2></center>");
		 	  
		out.println("</center>");
	
        out.println("<center>");
		out.println("<table border=3 bgcolor=#ffefd5 height=10 width=500>");
		out.println("<tr>");
		out.println("<th>USER_NUMBER</th>");
		out.println("<th>NAME</th>");
		out.println("<th>GENDER</th>");
		out.println("<th>DOB</th>");
        out.println("<th>BEARTH PREFERENCE</th>");
        out.println("<th>ID TYPE</th>");
        out.println("<th>ID NUMBER</th>");
        //out.println("<th>DATE OF REGISTER</th>");
		
		out.println("</tr>");
      
            out.println("<tr>");
            out.println("<td>"+uno+"</td>");
            out.println("<td>"+pname+"</td>");
            out.println("<td>"+pgen+"</td>");	
			 out.println("<td>"+pdob+"</td>");
             out.println("<td>"+bp+"</td>");
            out.println("<td>"+idt+"</td>");	
            out.println("<td>"+idn+"</td>");		
			 out.println("</tr>");
          out.println("</table>");
		//out.println("<center><h2><font color=orange>This Site Is Developed By SKA Developments</font></h2></center>");
		out.println("</center>");

		    }

		     else
		   {
			  
			   out.println("<center><font color=blue><h3>MASTER LIST UN SUCCESSFULL</h3></font></center>");
		       
		   }
    
		      
%>
<%!
    public void jspDestroy()
    {
        try
        {
                 ps1.close();
	
                 con.close();
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
%>
