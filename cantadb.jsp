<%@ include file="sessionvala.jsp"%>
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
      ps1 = con.prepareStatement("select fare from train_reservation where pnr=? and status='CNF' ");
           
    
    }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
%>

			

<!doctype html>
<html lang="en">
    <head>
        <title>Payment Gateway</title>
		<script LANGUAGE="JavaScript">
         
    function login(form)
	{
		var acid = document.getElementById("acid").value;
		
		if(acid =='')
		{
			alert("please enter Account Id");
			return false;
		}
	
		else
	{
        //
    }
	}
		function clearFunc()
	{
		document.getElementById("email").value="";
		document.getElementById("pwd1").value="";
	}	
		</script>
    </head>
    <body>
     
      	<center>
        <form method = "post" onSubmit="return login(this)" action = "cantadc.jsp">
            <fieldset style="width:23%; background-color:lightblue">
                <h3><center>TICKET CANCEL GATEWAY SKA-RAILWAYS</center></h3>
                <hr>
                <table>
                <tr>

	   
	   </tr>
<% 
       
         int pnr=Integer.parseInt(request.getParameter("pnr"));
		 
       ps1.setInt(1,pnr);
	 

ResultSet rs1 = ps1.executeQuery();
    //int cnt1 =ps1.executeQuery();
     int cnt=0;
         if (rs1.next())
         {
            cnt = rs1.getInt(1);
         }
   if (cnt == 0) {
        //out.println("<center><h3><font color=red>Invalid credentials</font></h3></center>");
        out.println("<center><h3><font color=red>The Ticket Already Cancelled</font></h3></center>");

    } 
else
{

rs1 = ps1.executeQuery();
while (rs1.next())
 {
    int fr = rs1.getInt(1);
 out.print("Total Collected Fare:&nbsp"+fr);
 out.print("<br>");
 int cfe = (int)((double)fr * 0.40);

 int refam=fr-cfe;
 out.print("Cancellation Fee:&nbsp"+cfe);
 out.print("<br>");
 out.print("Total Refund Amount:&nbsp"+refam);
 
%>

                      <tr>
                
                <td><textarea rows="1" cols="15" name="fr" readonly hidden><%= refam %></textarea></td>
                <td><textarea rows="1" cols="15" name="cfe" readonly hidden><%= cfe %></textarea></td>
                 <td><textarea rows="1" cols="15" name="pnr" readonly hidden><%= pnr %></textarea></td>
                 
           
            </tr>


                <td></td>
                </tr>
                    <tr>
                        <td>User id<font color="red">* </font>:</td>
                        <td> <input type = "number" name = "acid" id="acid" Placeholder="Account Number"></td>
                    </tr>       
                  
                 
                    <tr>
						  <td><input type="radio" name="trm" value="Cr SKA Railway" id="trm" checked  hidden></td>
						  </tr>
                           <tr>
						<td> <input type="number" hidden name="trnno" id="trnno" value="100" readonly="readonly"  Placeholder="trno"/></td>
                        </tr>
                         <tr>
						<td> <input type="number" hidden name="acid1" id="acid1" value="0" readonly="readonly"  Placeholder="trno"/></td>
                        </tr>
                     <tr>
						  <td>
						   <textarea id="demo1" name="dot" hidden>
                               </textarea>				      		
							<script>
                                  window.onload = function () {
        DisplayCurrentTime();
    };

  
	setInterval(() => {
                                   var date = new Date();
	var current_date = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+ date.getDate();
	var current_time = date.getHours()+":"+date.getMinutes()+":"+ date.getSeconds();
	
	var date_time =current_time+" "+current_date;	
	document.getElementById("demo1").innerHTML = date_time;
							    }, 1000);
				
   	                             </script>
							</td>						    
						  <td>
						  
						   <textarea id="demo2" name="dot1"  hidden>
                               </textarea>	
							   <script>
                                  window.onload = function () {
        DisplayCurrentTime();
    };

  
	setInterval(() => {
                                   var date = new Date();
	var current_date = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+ date.getDate();
	//var current_time = date.getHours()+":"+date.getMinutes()+":"+ date.getSeconds();
	
	var date_time =current_date;	
	document.getElementById("demo2").innerHTML = date_time;
							    }, 1000);
   	                             </script>
						  </td>
						  </tr>
                    <tr>
                        <td></td>
                        <td><input type = "submit" value="Refund" name = "s1" onClick ="login(this.form)">
						<input type="reset" value="Reset" onclick="clearFunc()">
						<input type="button" value="Back" onclick="history.back()">
						</td>
                    </tr>
 <%    }} %>
                </table>
            </fieldset>
  
      </form>
  <%
         out.println("<p><font color=blue>SKA Railwyas Recovers Only 61% of Cost of Travel on an average Ticket & Reservation Tickets</font></p>");
         
  
  %>
           </center>




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
	</body>
</html>