<%@ include file="sessionvala.jsp"%>
<<%@ include file="packaget.jsp"%>
<!doctype html>
<html lang="en">
    <head>
        <title>ADMIN CANCEL TICKET</title>

		<script LANGUAGE="JavaScript">
         
    function login(form)
	{
		var pnr = document.getElementById("pnr").value;
		var r =confirm("ARE YOU SURE FOR E-TICKET CANCELLATION!!");
		if(pnr =='')
		{
			alert("PLEAE ENTER PNR NUMBER.");
			return false;
		}
		 
    

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
		function clearFunc()
	{
		document.getElementById("email").value="";
		document.getElementById("pwd1").value="";
	}	
	
		</script>
    </head>
    <body>
	<center>
        <form method = "post" onSubmit="return login(this)" action = "cantadb.jsp">
            <fieldset style="width:23%; background-color:lightblue">
                <h3><center>ADMIN CANCEL E-TICKET</center></h3>
                <hr>
                <table>
                    <tr>
                        <td>PNR NUMBER<font color="red">*</font>:</td>
                        <td> <input type = "number" name = "pnr" id="pnr" Placeholder="PNR NUMBER"></td>
                    </tr>
				
                   
                    <tr>					
                        <td></td>
                        <td><input type = "submit" value="Cancel E-Ticket" name = "s1" onClick ="login(this.form)">
						<input type="reset" value="RESET" onclick="clearFunc()">
						
						</td>
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
                </table>
            </fieldset>
        </form>
		<h3><font color="blue">THE ADMIN CAN CANCEL RESERVATION E-TICKET.</font></h3>
        <br>
		
           </center>
	</body>
</html>