<%@ include file="sessionvala.jsp"%>
<html>
<head>
<title>Adding New Train</title>
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
             ps1 = con.prepareStatement("insert into trains(TRAIN_NUMBER,TRAIN_NAME,FSTATION,Base_Fare,CLASS,TICKET_TYPE,Train_addedon,Train_Admin)values(?,?,?,?,?,?,?,?)");
			//ps2 = con.prepareStatement("select train_number,Train_name from trains where train_admin= ? and train_addedon=?");


           
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
%>
<%
        
        int trainnumber=Integer.parseInt(request.getParameter("trainnumber"));
        String trainname = request.getParameter("trainname");
        String stations = request.getParameter("stations");
         String bsf = request.getParameter("bsf");

		String s1ac = request.getParameter("1ac");
        String s2ac = request.getParameter("2ac");
		String s3ac = request.getParameter("3ac");
        String cc = request.getParameter("cc");
		String sleeper = request.getParameter("sleeper");
        String s2s = request.getParameter("2s");

       String gen = request.getParameter("gen");
		String ld = request.getParameter("ld");
        String tkl = request.getParameter("tkl");
        String ptkl = request.getParameter("ptkl");
        String phc = request.getParameter("phc");

        String doa = request.getParameter("doa");
        String adm = request.getParameter("adm");
        if(s1ac==null)
        {
            s1ac=",";
        }
        if(s2ac==null)
        {
            s2ac=",";
        }
        if(s3ac==null)
        {
            s3ac=",";
        }
         if(cc==null)
        {
            cc=",";
        }
        if(sleeper==null)
        {
            sleeper=",";
        }
        if(s2s==null)
        {
            s2s=",";
        }
       
        String classt =s1ac+s2ac+s3ac+cc+sleeper+s2s;
        if(gen==null)
        {
            gen=",";
        }
        if(ld==null)
        {
            ld=",";
        }
        if(tkl==null)
        {
            tkl=",";
        }
        if(ptkl==null)
        {
            ptkl=",";
        }
        if(phc==null)
        {
           phc=",";
        }
            
        String ct = gen+ld+tkl+ptkl+phc;
            

        ps1.setInt(1,trainnumber);
        ps1.setString(2,trainname);
		ps1.setString(3,stations);
        ps1.setString(4,bsf);
		ps1.setString(5,classt);
        ps1.setString(6,ct);
        ps1.setString(7,doa);
        ps1.setString(8,adm);
	    int cnt = ps1.executeUpdate();
		  if(cnt>0)
		  {
			   out.println("<center><h2><font color=green>THE SKA RAILWAYS</font></h2></center>");
			   out.println("<center><font color=blue><h3>New Train Successfully Registred </h3></font></center>");
		       out.println("<center><img src=images/train9.jpg width=600 height=350></img></center>");
               out.println("<br>");
				out.println("<center>");
                out.println("<table border=2px bgcolor=	#b0c4de width=80>");
			  out.println("<tr>");
			  out.println("<th>TRAIN NUMBER</th>");
			  out.println("<th>TRAIN NAME</th>");
              out.println("<th>HALTING</th>");
			  out.println("<th>TRAIN ADMIN</th>");
			  out.println("</tr>");
               out.println("<tr>");
			  out.println("<td>"+trainnumber+"</td>");
			  out.println("<td>"+trainname+"</td>");
              out.println("<td>"+stations+"</td>");
              out.println("<td>"+adm+"</td>");
			  out.println("</tr>");
			  out.println("</table>");
              out.println("</center>");

                
                
            
		    }

		     else
		   {
			  
			   out.println("<center><font color=blue><h3>NEW TRAIN REGISTRATION UN SUCCESSFULL</h3></font></center>");
		       
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