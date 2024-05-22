<%@ include file="packaget.jsp"%>
  <%
  
   //no session required because its public in index and user just a basic details of journey
 %>

<!doctype html>
<html lang="en">
    <head>
        <title>PNR ENQUIRY</title>

		<script LANGUAGE="JavaScript">
         
    function login(form)
	{
		var pnr = document.getElementById("pnr").value;
		if(pnr =='')
		{
			alert("PLEAE ENTER PNR NUMBER.");
			return false;
		}
		
		else
		{
		  //alert("please fill corect details");
		  //window.location.href =ul;
		 //const myWindow.document.open(+<form method = post action = "http://192.168.43.42:8181/test/Jdbin.jsp"); 
		  //document.writeln("<form method = post action = http://192.168.43.42:8181/uservaljsp/Jdbin.jsp ">
		  
		  
		  
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
        <form method = "post" onSubmit="return login(this)" action = "PNRbiu.jsp">
            <fieldset style="width:23%; background-color:lightblue">
                <h3><center>PNR ENQUIRY</center></h3>
                <hr>
                <table>
                    <tr>
                        <td>PNR NUMBER<font color="red">*</font>:</td>
                        <td> <input type = "number" name = "pnr" id="pnr" Placeholder="PNR NUMBER"></td>
                    </tr>
                   
                    <tr>					
                        <td></td>
                        <td><input type = "submit" value="ENQUIRY" name = "s1" onClick ="login(this.form)">
						<input type="reset" value="RESET" onclick="clearFunc()">
						
						</td>
                    </tr>
                </table>
            </fieldset>
        </form>
		<h3><font color="blue">THE PUBLIC USERS CAN VIEW ONLY SPECIFIC DETAILS OF A TRAIN RESERVATION LIKE PNR NUMBER TRAIN NUMBER TRAIN NAME FROM TO DEPATURE TIME CLASS BOOKING STATUS.</font></h3>
        <br>
		
           </center>
	</body>
</html>