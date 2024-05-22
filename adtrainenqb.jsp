<%@ include file="sessionvala.jsp"%>
<%@ include file="packaget.jsp"%>
<%!
    Connection con;
    PreparedStatement ps1,ps2,ps1d;//ps4;
	public void jspInit()
    {
        try
        {
            
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/train","root","tiger");
            // ps1d = con.prepareStatement("insert into Train_Names (DOJR)values(?)");
        ps1 = con.prepareStatement("SELECT Train_Number,Train_Name FROM trains WHERE FIND_IN_SET(?,Fstation) AND FIND_IN_SET(?,Fstation) AND FIND_IN_SET(?,CLASS) AND FIND_IN_SET(?,ticket_type)");
       ps2 = con.prepareStatement("SELECT fare,km FROM train_Fare WHERE FIND_IN_SET(?,Fstation) AND FIND_IN_SET(?,FStation)>0");
       
    
    }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
%>
<html>
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 90%;
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
<title>BOOKING TICKET</title>
</head>

<script>
	         
    function tc()
	{
		var tcl  = document.getElementById("tcl").value;
        var fr  = document.getElementById("fr").value;
	
    }


</script>
<body onkeydown="return(event.keyCode == 154)">


</body>

</html>

<%

   //String uname = request.getParameter("");
      

        String s = request.getParameter("SOURCE");
        String d = request.getParameter("DEST");
        String tcl = request.getParameter("tycl");
        String tt = request.getParameter("tyt");
        String tcl1 = request.getParameter("tycl");
        String tt1 = request.getParameter("tyt");
                 
        ps1.setString(1,s);
        ps1.setString(2,d);
        ps1.setString(3,tcl);
        ps1.setString(4,tt);
        ps2.setString(1,s);
        ps2.setString(2,d);
       
        //ps4.setString(1,s);
        //ps4.setString(2,d);
        //int cnt1=0 ;//= ps3.executeQuery();
         out.println("<center><font color=blue><h3>JOURNEY DETAILS</h3></font></center>");
		     ResultSet rs = ps1.executeQuery();
       
    
         while(rs.next())
         {
              out.println("<center>");
		    out.println("<table border=3 bgcolor= orange>");
		    out.println("<tr>");
		          out.println("<th>TRAIN NUMBER</th>");
		         out.println("<th>TRAIN NAME</th>");
          out.println("<th>FROM</th>");
          out.println("<th>TO</th>");
          out.println("<th>CLASS</th>"); //Sec to kazipet
           out.println("<th>TICKET TYPE</th>");//from to
           out.println("<th>FARE</th>");
           out.println("<th>KM</th>");
           //out.println("<th>DATE OF JURNEY</th>");
         // out.println("<th>ACTION</th>");
         
		       out.println("</tr>");
            out.println("<tr>");
            out.println("<td>"+rs.getInt(1)+"</td>");
            out.println("<td>"+rs.getString(2)+"</td>");
            out.println("<td>"+s+"</td>");
            out.println("<td>"+d+"</td>");
            out.println("<td>"+tcl+"</td>");
            out.println("<td>"+tt+"</td>");
            out.println("<br>");
              ResultSet rs1 = ps2.executeQuery();
              while(rs1.next())
        {
                  int r =rs1.getInt(1);
                  out.println("BASE FARE:&nbsp"+r);
                  //int q =rs1.getInt(1);
          
                //out.println("<br>");
                  int q1;
                switch(tcl) {
               case "AC FIRST CLASS":
                     r=r+200;
            
              q1=200;
              out.println("<br>");
              out.println("1 AC CHARGES:+&nbsp"+q1);
              out.println("<br>");
              break;
               case "AC 2 Tier(2A)":
               r=r+120;
               q1=120;
              out.println("2 AC CHARGES:+&nbsp"+q1);
              out.println("<br>");
               break;
                case "AC 3 Tier (3A)":      
               r=r+80;
               //out.println("<p>"+r+"</p>");
               q1=80;
               out.println("<br>");
              out.println("3 AC CHARGES:+&nbsp"+q1);
              out.println("<br>");
               break;
              case "CHAIR CAR":      
               r=r+60;
               //out.println("<p>"+r+"</p>");
               q1=60;
               out.println("<br>");
              out.println("CAHIR CAR CHARGES:+&nbsp"+q1);
              out.println("<br>");
               break;
                case "SLEEPER":
               r=r+40;
               //out.println("<p>"+r+"</p>");
               q1=40;
               out.println("<br>");
              out.println("SLEEPER CLASS CHARGES:+&nbsp"+q1);
              out.println("<br>");
               break;
               case "SECOND SITTING":
               r=r+20;
               //out.println("<p>"+r+"</p>");
               q1=20;
               out.println("<br>");
              out.println("2 SITTING CHARGES:+&nbsp"+q1);
              out.println("<br>");
               break;
            
               default:
               
              }
               int q2;
                switch(tt) {
            case "TATKAL":
               //out.println("It\'s Sunday.");
               r=r+50;
                q2=50;
               out.println("TATKAL CHARGES:+&nbsp"+q2);
              out.println("<br>");
               break;
               case "PREMIUM TATKAL":
               r=r+70;
               //out.println("<p>"+r+"</p>");
                q2=70;
               out.println("PREMIUM TATKAL CHARGES:+&nbsp"+q2);
              out.println("<br>");
               break;
                case "LADIES":
               r=r-20;
               //out.println("<p>"+r+"</p>");
                q2=-20;
                //out.println("<br>");
               out.println("LADIES QUOTA:&nbsp"+q2);
              out.println("<br>");
               break;
                case "PHC":
               r=r-40;
              // out.println("<p>"+r+"</p>");
                q2=-40;
               out.println("PHC QUOTA:&nbsp"+q2);
              out.println("<br>");
               break;  
            default:
         }

                out.println("<td>"+r+"</td>");
          //out.println("<td>"+rs1.getInt(1)+"</td>");
                 out.println("<td>"+rs1.getInt(2)+"</td>");
                //out.println("<td><a href=userlogin.jsp>BOOK NOW</a></td>");
       
          out.println("</tr>");
          //        out.println("<br>");
                out.println("</table>");
		      out.println("</center>");
              
          } 
         
    }
%>
<%!
    public void jspDestroy()
    {
        try
        {   ps1d.close();
            ps1.close();
            ps2.close();
            //ps3.close();
            //ps4.close();
            con.close();
        
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
%>

