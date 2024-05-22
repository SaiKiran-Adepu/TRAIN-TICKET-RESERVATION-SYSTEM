<%@ include file="sessionvaltu.jsp"%>
<html>
<head>
<title>Ticket Cancel</title>
  <meta http-equiv="refresh" content="10">
</head>
<body>
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
 <style>
            table tr:not(:first-child){
                cursor: pointer;transition: all .25s ease-in-out;
            }
            table tr:not(:first-child):hover{background-color:#F0FFF0;}
        </style>
<%@ include file="packaget.jsp"%>
<%!

    Connection con;
    PreparedStatement ps1,ps2,ps4;
    public void jspInit()
    {
        try
        { 
			Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/train","root","tiger");
        
            ps2 = con.prepareStatement("select PNR,Frm,To1,Train_Number,Train_Name,Classc,Booked_For,status from train_reservation where status='CNF' and Booked_By=? ORDER BY PNR DESC");
                    String query = "SELECT CONCAT( TIME_FORMAT(STR_TO_DATE(Booked_On, '%H:%i:%s %Y-%m-%d'), '%h:%i:%s %p'), ' ', DATE_FORMAT(STR_TO_DATE(Booked_On, '%H:%i:%s %Y-%m-%d'), '%d-%b-%Y') ) AS Book, DATE_FORMAT(STR_TO_DATE(Booked_For, '%Y-%m-%d'), '%d-%b-%Y') AS journey FROM train_reservation WHERE pnr = ?";
           ps4 = con.prepareStatement(query);     
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
%>


<%
   
       Integer i1=(Integer)session.getAttribute("nu"); 
		      int k1=i1.intValue(); //users downloading ticket

        ps2.setInt(1,k1);
           out.println("<center>");
        out.println("<h2><font color=blue>The Upcomming/Past Journey Details</font></h2>");
		out.println("<table border=3 bgcolor=EDF2F4 border=3 id=table>");
		out.println("<tr>");
		out.println("<td>PNR NUMBER</td>");
        out.println("<td>STATUS</td>");
        out.println("<td>From</td>");
        out.println("<td>To</td>");
        out.println("<td>Train Number</td>");
        out.println("<td>Train Name</td>");
        out.println("<td>Class</td>");		
        out.println("<td>Date</td>");
        out.println("<td>Action</td>");
		out.println("</tr>");
      ResultSet rs = ps2.executeQuery();

         while(rs.next())
        {
       
            out.println("<tr>");
		
           out.println("<td>"+rs.getInt(1)+"</td>");
           String s1="Confirm";
           out.println("<td>"+rs.getString(8)+"</td>");
           out.println("<td>"+rs.getString(2)+"</td>");
			out.println("<td>"+rs.getString(3)+"</td>");
            out.println("<td>"+rs.getInt(4)+"</td>");
            out.println("<td>"+rs.getString(5)+"</td>");
            out.println("<td>"+rs.getString(6)+"</td>");
            out.println("<td>"+rs.getString(7)+"</td>");
             out.println("<td><font color=red>CANCEL</font></td>");
            //out.println("<td>"+rs.getString(7)+"</td>");
            
			//out.println("<td>"+rs.getString(6)+"</td>");
			//out.println("<td>"+rs.getString(7)+"</td>");

            out.println("</tr>");
        }
        out.println("</table>");
		out.println("</center>");

        rs.close();
    
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


	<script LANGUAGE="JavaScript">
         
    function res(form)
	{
		
        var r =confirm("ARE YOU SURE FOR E-TICKET CANCELLATION!!");
    

        if(r==true)
	  {
	  // alert("Fund Transfered to AC");
	  // return true;
	   }
	    
		else
		{ 
		  alert("REQUEST DECLINIED");
		  return false;
		  
		}
	
			}

		</script>

        
<br>
<center>
 <form name="F1" method = "post" onSubmit="return res(this)" action = "canticketua.jsp">
            <fieldset style="width:28%; background-color:lightblue">
                <h3><center>SELECTED TICKET DETAILS</center></h3>
                <hr>
                <table>
                    <tr>
                        <td>PNR NUMBER<font color="red">*</font>&nbsp:</td>
                        <td> <input type = "number" name = "pnr" id="pnr" Placeholder="PNR NUMBER" readonly></td>
                    </tr>
                 
                   <!--  <tr>
                        <td>FROM<font color="red">*</font>&nbsp:</td>
                        <td> <input type = "text" name = "frm" id="frm" Placeholder="FROM" readonly></td>
                    </tr>
                        <tr>
                        <td>TO<font color="red">*</font>&nbsp &nbsp&nbsp&nbsp&nbsp &nbsp &nbsp &nbsp &nbsp&nbsp &nbsp&nbsp:</td>
                        <td> <input type = "text" name = "to" id="to" Placeholder="TO" readonly></td>
                    </tr>
                    <tr>
                        <td>TRAIN NUMBER<font color="red">* </font>&nbsp &nbsp &nbsp &nbsp:</td>
                        <td><input type = "text" name = "trn" id="trn"  Placeholder="TO" readonly></td>
                    </tr>
                       <tr>
                        <td>TRAIN NAME<font color="red">* </font>&nbsp &nbsp &nbsp &nbsp:</td>
                        <td><input type = "text" name = "tnn" id="tnn"  Placeholder="TRAIN NAME" readonly></td>
                    </tr>

                       <tr>
                        <td>CLASS<font color="red">* </font>&nbsp &nbsp &nbsp &nbsp:</td>
                        <td><input type = "text" name = "cl" id="cl"  Placeholder="CLASS" readonly></td>
                    </tr>
                      !-->
                       <tr>
                        <td>DATE<font color="red">* </font>&nbsp &nbsp &nbsp &nbsp:</td>
                        <td><input type = "text" name = "dt" id="dt"  Placeholder="DATE" readonly></td>
                    </tr>
                    <tr>
                    <td></td>
                        <td><input type = "submit" value="CANCEL E-TICKET" name = "s1" onClick ="res(this.form)">
				             
                       <input type="reset" value="RESET" onclick="clearFunc()">
                    </td>
                    </tr>
                </table>
            </fieldset>
        </form>
         </center>



          <script>
    // for direct no neeed to enter the pnr number again and source destination to cancel the ticket 
                var table = document.getElementById('table');
                
                for(var i = 1; i < table.rows.length; i++)
                {
                    table.rows[i].onclick = function()
                    {
                         //rIndex = this.rowIndex;
                         
                         document.getElementById("pnr").value = this.cells[0].innerHTML;//trn number
                         /* document.getElementById("sts").value = this.cells[1].innerHTML;//Trin name
                         document.getElementById("frm").value = this.cells[2].innerHTML;//Trin name
                         document.getElementById("to").value = this.cells[3].innerHTML;//from
                         document.getElementById("trn").value = this.cells[4].innerHTML;//to
                         document.getElementById("tnn").value = this.cells[5].innerHTML;//date
                         document.getElementById("cl").value = this.cells[6].innerHTML;//ticket type*/
                         document.getElementById("dt").value = this.cells[7].innerHTML;//ticket type
                         
                    };
                }
    
         </script>
</body>
</html>