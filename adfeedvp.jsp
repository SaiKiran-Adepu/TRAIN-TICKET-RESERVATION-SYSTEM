<%@ include file="sessionvala.jsp"%>
<%@ include file="packaget.jsp"%>


<!doctype html>
<html lang="en">
    <head>
        <title>ADMIN VIEW FEEDBACKS</title>

		<script LANGUAGE="JavaScript">
         
    function login(form)
	{
		var fn = document.getElementById("fn").value;
		if(pnr =='')
		{
			alert("PLEAE ENTER FEEDBCAK NUMBER.");
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
        <form method = "post" onSubmit="return login(this)" action = "adfeedvpb.jsp">
            <fieldset style="width:30%; background-color:lightblue">
                <h3><center>ADMIN FEEDBACK ENQUIRY</center></h3>
                <hr>
                <table>
                    <tr>
                        <td>FEEDBACK NUMBER<font color="red">*</font>:</td>
                        <td> <input type = "number" name = "fn" id="fn" Placeholder="FEEDBACK NUMBER"></td>
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
		<h3><font color="blue">THE ADMIN CAN VIEW FEEDBACK DETAILS.</font></h3>
        <br>
		
           </center>
	</body>
</html>