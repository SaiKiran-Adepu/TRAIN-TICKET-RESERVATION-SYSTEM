<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*,java.util.*" %>

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
textarea {
  resize: none;
}
</style>
  <style>
            table tr:not(:first-child){
                cursor: pointer;transition: all .25s ease-in-out;
            }
            table tr:not(:first-child):hover{background-color: #ddd;}
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

      
<//<body onkeydown="return(event.keyCode == 154)">
<body>


   Train Number:<input type="text" name="trn" id="trn"><br><br>
        TO:<input type="text" name="lname" id="lname"><br><br>
        Train Name:<input type="text" name="age" id="age"><br><br>


<%


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
               
		    out.println("<table border=3 bgcolor= orange  id=table border=1>");// <table id="table" border="1">
         
		    out.println("<tr>");
		          out.println("<th>TRAIN NUMBER</th>");
		         out.println("<th>TRAIN NAME</th>");
          out.println("<th>FROM</th>");
          out.println("<th>TO</th>");
          out.println("<th>CLASS</th>"); //Sec to kazipet
           out.println("<th>TICKET TYPE</th>");
           //out.println("<th>BASE FARE</th>");
           //out.println("<th>COUCH CHARGE</th>");//from to
           out.println("<th>FARE</th>");
           out.println("<th>KM</th>");
           //out.println("<th>DATE OF JURNEY</th>");
          out.println("<th>ACTION</th>");
		       out.println("</tr>");

            out.println("<tr>");
            int trn1=rs.getInt(1);
            out.println("<td hidden>"+rs.getInt(1)+"</td>");// correct way
            out.println("<td><textarea rows1 cols=15 name=tno id=fname readonly>"+rs.getInt(1)+"</textarea></td>");
            out.println("<td><textarea rows1 cols=15 name=tname readonly>"+rs.getString(2)+"</textarea></td>");
            out.println("<td><textarea rows1 cols=15 name=s readonly>"+s+"</textarea></td>");
            out.println("<td><textarea rows1 cols=15 name=d readonly>"+d+"</textarea></td>");
            out.println("<td><textarea rows1 cols=15 name=tcl readonly>"+tcl+"</textarea></td>");
            out.println("<td><textarea rows1 cols=15 name=tt readonly>"+tt+"</textarea></td>");
            
              ResultSet rs1 = ps2.executeQuery();
              if(rs1.next())
        {
                  int r =rs1.getInt(1);
                  out.println("<textarea rows1 cols=15 name=bsf readonly hidden>"+r+"</textarea>");
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
              out.println("<textarea rows1 cols=15 name=acc readonly hidden>"+q1+"</textarea>");
              //<textarea rows1 cols=15 name=d readonly>
              out.println("<br>");
              break;
               case "AC 2 Tier(2A)":
               r=r+120;
               q1=120;
               out.println("<br>");
              out.println("2 AC CHARGES:+&nbsp"+q1);
              out.println("<textarea rows1 cols=15 name=acc readonly hidden>"+q1+"</textarea>");

              out.println("<br>");
               break;
                case "AC 3 Tier (3A)":      
               r=r+80;
               //out.println("<p>"+r+"</p>");
               q1=80;
               out.println("<br>");
              out.println("3 AC CHARGES:+&nbsp"+q1);
              out.println("<textarea rows1 cols=15 name=acc readonly hidden>"+q1+"</textarea>");
              out.println("<br>");
               break;
              case "CHAIR CAR":      
               r=r+60;
               //out.println("<p>"+r+"</p>");
               q1=60;
               out.println("<br>");
              out.println("CAHIR CAR CHARGES:+&nbsp"+q1);
              out.println("<textarea rows1 cols=15 name=acc readonly hidden>"+q1+"</textarea>");

              out.println("<br>");
               break;
                case "SLEEPER":
               r=r+40;
               //out.println("<p>"+r+"</p>");
               q1=40;
               out.println("<br>");
              out.println("SLEEPER CLASS CHARGES:+&nbsp"+q1);
              out.println("<textarea rows1 cols=15 name=acc readonly hidden>"+q1+"</textarea>");

              out.println("<br>");
               break;
               case "SECOND SITTING":
               r=r+20;
               //out.println("<p>"+r+"</p>");
               q1=20;
               out.println("<br>");
              out.println("2 SITTING CHARGES:+&nbsp"+q1);
              out.println("<textarea rows1 cols=15 name=acc readonly hidden>"+q1+"</textarea>");

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
               out.println("<textarea rows1 cols=15 name=tc readonly hidden>"+q2+"</textarea>");

              out.println("<br>");
               break;
               case "PREMIUM TATKAL":
               r=r+70;
               //out.println("<p>"+r+"</p>");
                q2=70;
               out.println("PREMIUM TATKAL CHARGES:+&nbsp"+q2);
               out.println("<textarea rows1 cols=15 name=tc readonly hidden>"+q2+"</textarea>");

              out.println("<br>");
               break;
                case "LADIES":
               r=r-20;
               //out.println("<p>"+r+"</p>");
                q2=-20;
                //out.println("<br>");
               out.println("LADIES QUOTA:&nbsp"+q2);
               out.println("<textarea rows1 cols=15 name=tc readonly hidden>"+q2+"</textarea>");

              out.println("<br>");
               break;
                case "PHC":
               r=r-40;
              // out.println("<p>"+r+"</p>");
                q2=-40;
               out.println("PHC QUOTA:&nbsp"+q2);
               out.println("<textarea rows1 cols=15 name=tc readonly hidden>"+q2+"</textarea>");

              out.println("<br>");
               break;  
            default:
         }

                out.println("<td><textarea rows1 cols=5 name=fr readonly>"+r+"</textarea></td>");
          //out.println("<td>"+rs1.getInt(1)+"</td>");
                 out.println("<td><textarea rows1 cols=5 name=km readonly>"+rs1.getInt(2)+"</textarea></td>");
                out.println("<td><a href=reservationu.jsp>BOOK NOW</a></td>");
       
          out.println("</tr>");
                out.println("</table>");
		      out.println("</center>");
          rs1.close();
              
          }
         
    }
%>
<%!
    public void jspDestroy()
    {
        try
        {   
            //ps1d.close();
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
  <script>
    
                var table = document.getElementById('table');
                
                for(var i = 1; i < table.rows.length; i++)
                {
                    table.rows[i].onclick = function()
                    {
                         //rIndex = this.rowIndex;
                         
                         document.getElementById("trn").value = this.cells[0].innerHTML;
                         document.getElementById("lname").value = this.cells[1].innerHTML;
                         document.getElementById("age").value = this.cells[2].innerHTML;
                    };
                }
    
         </script>
</body>
</html>