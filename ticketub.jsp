<%@ include file="sessionvaltu.jsp"%>
<%@ include file="packaget.jsp"%>
<%!
    Connection con;
    PreparedStatement ps1,ps2;
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
  background-color: #E6E6FA;
}
textarea {
  resize: none;
}
</style>
  <style>
            table tr:not(:first-child){
                cursor: pointer;transition: all .25s ease-in-out;
            }
            table tr:not(:first-child):hover{background-color:#F0FFF0;}
        </style>
        
<title>BOOKING TICKET</title>


<script>
	         
    function tc()
	{
		var tcl  = document.getElementById("tcl").value;
        var fr  = document.getElementById("fr").value;
	
    }
    		function clearFunc()
	{
		document.getElementById("email").value="";
		document.getElementById("pwd1").value="";
	}	


</script>



</head>
   
<body>


<%

       //int nt =Integer.parseInt(request.getParameter("number"));
        String s = request.getParameter("SOURCE");
        String d = request.getParameter("DEST");
        String tcl = request.getParameter("tycl");
        String tt = request.getParameter("tyt");
        String tcl1 = request.getParameter("tycl");
        String tt1 = request.getParameter("tyt");
        String dt = request.getParameter("setTodaysDate");
                 
        ps1.setString(1,s);
        ps1.setString(2,d);
        ps1.setString(3,tcl);
        ps1.setString(4,tt);
        ps2.setString(1,s);
        ps2.setString(2,d);
       
         out.println("<center><font color=blue><h3>JOURNEY DETAILS</h3></font></center>");
       
              out.println("<center>");
               
		    out.println("<table border=3 bgcolor= orange  id=table border=1>");// <table id="table" border="1">
		
         out.println("<tr>");
		          out.println("<th>TRAIN NUMBER</th>");
		         out.println("<th>TRAIN NAME</th>");
          out.println("<th>FROM</th>");
          out.println("<th>TO</th>");
          out.println("<th>CLASS</th>"); //Sec to kazipet
           out.println("<th>TICKET TYPE</th>");
           out.println("<th>JOURNEY ON</th>");
          out.println("<th>ACTION</th>");
           //out.println("<th>FARE</th>");
           //out.println("<th>KM</th>");
		       out.println("</tr>");
         ResultSet rs = ps1.executeQuery();
        
         while(rs.next())
         {
            out.println("<tr>");
		   
            int trn1=rs.getInt(1);
            out.println("<td hidden>"+rs.getInt(1)+"</td>");// correct way
            out.println("<td hidden>"+rs.getString(2)+"</td>");
            out.println("<td hidden>"+s+"</td>");
             out.println("<td hidden>"+d+"</td>");
             out.println("<td hidden>"+dt+"</td>");
             out.println("<td hidden>"+tt+"</td>");
            out.println("<td><textarea rows1 cols=15 name=tno id=tno readonly>"+rs.getInt(1)+"</textarea></td>");
            out.println("<td><textarea rows1 cols=15 name=tname readonly>"+rs.getString(2)+"</textarea></td>");
            out.println("<td><textarea rows1 cols=15 name=s readonly>"+s+"</textarea></td>");
            out.println("<td><textarea rows1 cols=15 name=d readonly>"+d+"</textarea></td>");
            out.println("<td><textarea rows1 cols=15 name=tcl readonly>"+tcl+"</textarea></td>");
            out.println("<td><textarea rows1 cols=15 name=tt readonly>"+tt+"</textarea></td>");
            out.println("<td><textarea rows1 cols=15 name=tt readonly>"+dt+"</textarea></td>");
         out.println("<td><a>SELECT A TRAIN</a></td>");
       
          out.println("</tr>");
         }
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
               //int c1=r-q1;
               out.println("<br>");
               //out.println("<td><textarea rows1 cols=5 name=fr readonly>"+c1+"</textarea></td>");
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
                // out.println("<td><a href=reservationu.jsp>BOOK NOW</a></td>");
        
               out.println("</table>");
               out.println("<br>");
               out.println("<center>");
               out.println("<table border=3 bgcolor=#F5FFFA style=width:10% border=1>");// <table id="table" border="1">
		              out.println("<tr>");
              // out.println("<th>BASE FARE</th>");
              // out.println("<th>QUOTA FARE</th>");
               out.println("<th>FARE</th>");
               out.println("<th>KM</th>");
               out.println("</tr>");
               out.println("<tr>");
               out.println("<td><textarea rows1 cols=5 name=fr id=fr readonly>"+r+"</textarea></td>");
               out.println("<td><textarea rows1 cols=5 name=km id=km readonly>"+rs1.getInt(2)+"</textarea></td>");
              out.println("</tr>");
               out.println("</table>");
               out.println("</center>");
        }
          out.println("</center>");
        
          
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


		<script LANGUAGE="JavaScript">
         
    function res(form)
	{
		var trn = document.getElementById("trn").value;
    if(trn =='')
		{
			alert("PLEAE SELECT A TRAIN.");
			return false;
		}
	
			}

		</script>


<br>
<center>
 <form name="F1" method = "post" onSubmit="return res(this)" action = "reservationua.jsp">
            <fieldset style="width:28%; background-color:lightblue">
                <h3><center>SELECTED TRAIN DETAILS</center></h3>
                <hr>
                <table>
                    <tr>
                        <td>TRAIN NUMBER<font color="red">*</font>&nbsp:</td>
                        <td> <input type = "number" name = "trn" id="trn" Placeholder="TRAIN NUMBER" readonly></td>
                    </tr>
                     <tr>
                        <td>TRAIN NAME<font color="red">*</font>&nbsp:</td>
                        <td> <input type = "text" name = "trnn" id="trnn" Placeholder="TRAIN NAME" readonly></td>
                    </tr>
                        <tr>
                        <td>FROM<font color="red">*</font>&nbsp &nbsp&nbsp&nbsp&nbsp &nbsp &nbsp &nbsp &nbsp&nbsp &nbsp&nbsp:</td>
                        <td> <input type = "text" name = "frm" id="frm" Placeholder="FROM" readonly></td>
                    </tr>
                    <tr>
                        <td>TO<font color="red">* </font>&nbsp &nbsp &nbsp &nbsp:</td>
                        <td><input type = "text" name = "to" id="to"  Placeholder="TO" readonly></td>
                    </tr>
                       <tr>
                        <td>DATE<font color="red">* </font>&nbsp &nbsp &nbsp &nbsp:</td>
                        <td><input type = "text" name = "dt" id="dt"  Placeholder="DATE" readonly></td>
                    </tr>
                       <tr>
                        <td>TICKET TYPE<font color="red">* </font>&nbsp &nbsp &nbsp &nbsp:</td>
                        <td><input type = "text" name = "tt" id="tt"  Placeholder="TICKET TYPE" readonly></td>
                    </tr>
                         <!--   <tr>
                        <td>Fare<font color="red">* </font>&nbsp &nbsp &nbsp &nbsp:</td>
                  
                        <td><input type = "text" name = "fr" id="fr1" Placeholder="Fare" ></td>
                    </tr>
                          <tr>
                        <td>KM<font color="red">* </font>&nbsp &nbsp &nbsp &nbsp:</td>
                  
                        <td><input type = "text" name = "km" id="km1" Placeholder="KM" ></td>
                    </tr>-->
                    <tr>
                    <td></td>
                        <td><input type = "submit" value="BOOK" name = "s1" onClick ="res(this.form)">
				               <a href="javascript:history.back()">
				               <input type="button" value="BACK"></a>
                       <input type="reset" value="RESET" onclick="clearFunc()">
                    </td>
                    </tr>
                </table>
            </fieldset>
        </form>
         </center>
<script>
/*
//var fr=document.getElementById("fr").innerHTML=f1r;
var f = document.getElementById("fr").value;
document.forms["F1"]["fr1"].value = f;
var k = document.getElementById("km").value;
document.forms["F1"]["km1"].value = k;
document.write(t1);*/
</script>
 <script>
    // for direct no neeed to enter the train number again and source destination 
                var table = document.getElementById('table');
                
                for(var i = 1; i < table.rows.length; i++)
                {
                    table.rows[i].onclick = function()
                    {
                         //rIndex = this.rowIndex;
                         
                         document.getElementById("trn").value = this.cells[0].innerHTML;//trn number
                         document.getElementById("trnn").value = this.cells[1].innerHTML;//Trin name
                         document.getElementById("frm").value = this.cells[2].innerHTML;//from
                         document.getElementById("to").value = this.cells[3].innerHTML;//to
                         document.getElementById("dt").value = this.cells[4].innerHTML;//date
                         document.getElementById("tt").value = this.cells[5].innerHTML;//ticket type
                    };
                }
    
         </script>




</body>
</html>