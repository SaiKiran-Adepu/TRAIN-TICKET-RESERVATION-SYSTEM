<%@ include file="sessionvala.jsp"%>
<%@ include file="packaget.jsp"%>

<%!
    Connection con;
    PreparedStatement ps2,ps1d;//ps4;
	public void jspInit()
    {
        try
        {
            
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/train","root","tiger");
            // ps1d = con.prepareStatement("insert into Train_Names (DOJR)values(?)");
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
textarea {
  resize: none;
}
</style>

<title>GENERAL TICKET</title>
</head>


<body onkeydown="return(event.keyCode == 154)">


</body>

</html>

<%

   //String uname = request.getParameter("");
      

        String s = request.getParameter("SOURCE");
        String d = request.getParameter("DEST");
        String gen="GENERAL";
        String dc = request.getParameter("dcut");
       int ad=Integer.parseInt(request.getParameter("ad"));
       int ch=Integer.parseInt(request.getParameter("ch"));    
       
        ps2.setString(1,s);
        ps2.setString(2,d);
       
         out.println("<center><font color=blue><h3>JOURNEY DETAILS</h3></font></center>");
		out.println("<form method = post  action = genticketcnf.jsp>");
         ResultSet rs1 = ps2.executeQuery();
    
         while(rs1.next())
         {
              out.println("<center>");
		        out.println("<table border=3 bgcolor= orange>");
		        out.println("<tr>");
            //out.println("<th>TN</th>");
             out.println("<th>FROM</th>");
             out.println("<th>TO</th>");
           
           out.println("<th>TICKET TYPE</th>");//from to
           out.println("<th>ADULT</th>");
           out.println("<th>CHILD</th>");
           out.println("<th>BASE FARE</th>");
           out.println("<th>RS</th>");
           out.println("<th>KM</th>");
           out.println("<th>TIME</th>");
           //out.println("<th>DATE OF JURNEY</th>");
          out.println("<th>ACTION</th>");
		       out.println("</tr>");
            out.println("<tr>");
            
           // out.println("<td><input type=text name=s>"+s+"</td>");
           //out.println("<td><input type=number value=19 readonly name=tn ></textarea></td>");
            out.println("<td><textarea rows1 cols=15 name=s readonly>"+s+"</textarea></td>");//we desable resiable text area by textarea in style tag
            out.println("<td><textarea rows1 cols=15 name=d readonly>"+d+"</textarea></td>");
            out.println("<td><textarea rows1 cols=15 name=gen readonly>"+gen+"</textarea></td>");
            out.println("<td><textarea rows1 cols=15 name=ad readonly>"+ad+"</textarea></td>");
            out.println("<td><textarea rows1 cols=15 name=ch readonly>"+ch+"</textarea></td>");
            out.println("<br>");
                  int r =rs1.getInt(1);
            out.println("<td><textarea rows1 cols=15 name=bsf readonly>"+r+"</textarea></td>");
                  out.println("BASE FARE:&nbsp"+r);
                  //int q;
   switch(ad) {
               case 0:
                     r=r-r;
              out.println("<br>");
              break;
            case 1:
                     r=r*1;
              out.println("<br>");
              break;
               case 2:
               r=r*2;
                out.println("<br>");
               break;
                case 3:      
               r=r*3;
               out.println("<br>");
               break;
              case 4:      
               r=r*4;
              out.println("<br>");
              out.println("<br>");
               break;
                case 5:
               r=r*5;
               out.println("<br>");
               break;
               case 6:
              r=r*6;
              out.println("<br>");
              break;
               case 7:
               r=r*7;
              out.println("<br>");
              break;
               case 8:
               r=r*8;
              out.println("<br>");
              break;
               case 9:
               r=r*9;
              out.println("<br>");
              break;
              case 10:
               r=r*10;
              out.println("<br>");
              break;
            
            
            default:
               //out.println("It's definetly executes.");
            //out.println("<br>");   
         }
         
         
            int r1=rs1.getInt(1);
         switch(ch) {
            case 0:
                     r1=r1-r1;
              out.println("<br>");
              break;
            case 1:
                     r1=r1/2;
              out.println("<br>");
              break;
               case 2:
               r1=r1*2/2;
                out.println("<br>");
               break;
                case 3:      
               r1=r1/2*3;
               out.println("<br>");
               break;
              case 4:      
               r1=r1/2*4;
              out.println("<br>");
              out.println("<br>");
               break;
                case 5:
               r1=r1/2*5;
               out.println("<br>");
               break;
               case 6:
               r1=r1/2*6;
              out.println("<br>");
              break;
               case 7:
               r1=r1/2*7;
              out.println("<br>");
              break;
               case 8:
               r1=r1/2*8;
              out.println("<br>");
              break;
               case 9:
               r1=r1/2*9;
              out.println("<br>");
              break;
              case 10:
               r1=r1/2*10;
              out.println("<br>");
              break;
            
            
            default:
               //out.println("It's definetly executes.");
            //out.println("<br>");   
         }
                 int s1;
                 s1=r+r1;

         
         out.println("<td><textarea rows1 cols=15 name=rs readonly>"+s1+"</textarea></td>");
          
                 out.println("<td><textarea rows1 cols=15 name=km readonly>"+rs1.getInt(2)+"</textarea></td>");
                 out.println("<td><textarea rows1 cols=15 name=dc readonly>"+dc+"</textarea></td><b>");
        out.println("<td><input type = submit value=CUT onClick =login(this.form)><br>&nbsp&nbsp&nbsp<br><input type=button value=BACK onclick=history.back()></td>");
        //out.println("<td><</td>");
        
          out.println("</tr>");
           out.println("</table>");
		      out.println("</center>");
              
            
         
    }
%>
<%!
    public void jspDestroy()
    {
        try
        {   ps1d.close();
            //ps1.close();
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

