<%@ include file="sessionvaltu.jsp"%>
<%@ include file="reservationucnfp.jsp"%>
<!doctype html>
<html lang="en">
    <head>
        <title>Bank Gateway</title>
		<script LANGUAGE="JavaScript">
         
    function login(form)
	{
		var acid = document.getElementById("acid").value;
		var pass = document.getElementById("pass").value;
		if(acid =='')
		{
			alert("please enter Account Id");
			return false;
		}
		else if(pass=='')
		{
        	alert("enter password");
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
        <form method = "post" onSubmit="return login(this)" action = "gatewayub.jsp">
            <fieldset style="width:23%; background-color:lightblue">
                <h3><center>PAYMENT GATEWAY SKA-RAILWAYS</center></h3>
                <hr>
                <table>
                <tr>
			<td>RS:</td><td><input type ="text" name ="fr" id="fr" value='<%=fr%>'readonly>
			 </td>
                <td></td>
                </tr>
                    <tr>
                        <td>User id<font color="red">* </font>:</td>
                        <td> <input type = "number" name = "acid" id="acid" Placeholder="Account Number"></td>
                    </tr>       
                     <tr>
                        <td>Mobile Number<font color="red">* </font>:</td>
                        <td> <input type = "number" name = "mbl" id="mbl" Placeholder="Mobile Number"></td>
                    </tr>
                    <tr>
                        <td>Password<font color="red">* </font>:</td>
                        <td><input type = "password" name = "pass" id="pass"  Placeholder="Password"></td>
                    </tr>
                    <tr>
						  <td><input type="radio" name="trm" value="Db SKA Railway" id="trm" checked  hidden></td>
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
                        <td><input type = "submit" value="Pay" name = "s1" onClick ="login(this.form)">
						<input type="reset" value="Reset" onclick="clearFunc()">
						<input type="button" value="Back" onclick="history.back()">
						</td>
                    </tr>
                </table>

<input type="number" name="tn" readonly="readonly" value='<%=tno11%>' hidden/></td>
 <input type="text" name="tname" readonly="readonly" value='<%=tname%>' hidden/></td>                    
<input type="text" name="s" readonly="readonly" value='<%=s%>' hidden/></td>                    
<input type="text" name="d" readonly="readonly" value='<%=d%>' hidden/></td>                    
<input type="text" name="tcl" readonly="readonly" value='<%=tcl%>' hidden/></td>                    
<input type="text" name="tt" readonly="readonly" value='<%=tt%>' hidden/></td>                    
                  
<input type="number" name="ad" readonly="readonly" value='<%=ad%>' hidden/></td>                    
<input type="number" name="ch" readonly="readonly" value='<%=ch%>' hidden/></td>                    
<input type="text" name="couch" readonly="readonly" value='<%=couch%>' hidden/></td>                    
 
<input type="text" name="bsf" readonly="readonly" value='<%=bsf%>' hidden/></td>                    
<input type="text" name="acc" readonly="readonly" value='<%=acc%>' hidden/></td>   
<input type="text" name="tc" readonly="readonly" value='<%=tc%>' hidden/></td>   <!-- tatkal charges-->
<input type="text" name="fr" readonly="readonly" value='<%=fr%>' hidden/></td>
<input type="text" name="km" readonly="readonly" value='<%=km%>' hidden/></td>
<input type="text" name="dob" readonly="readonly" value='<%=dob%>' hidden/></td>                    
<input type="text" name="doj" readonly="readonly" value='<%=doj%>' hidden/></td>                    
<input type="text" name="usr" readonly="readonly" value='<%=usr%>' hidden/></td>                    










            </fieldset>
        </form>
           </center>
	</body>
</html>