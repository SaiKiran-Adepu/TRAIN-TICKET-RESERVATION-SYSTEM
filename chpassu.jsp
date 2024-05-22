<%@ include file="sessionvaltu.jsp"%>
<%@ include file="packaget.jsp"%>
<!doctype html>
<html lang="en">
    <head>
        <title>USER PASSWORD CHANGE</title>

		<script LANGUAGE="JavaScript">
         
    function login(form)
	{
		var opass = document.getElementById("opass").value;
        var npass = document.getElementById("npass").value;
		var cpass = document.getElementById("cpass").value;
		if(opass =='')
		{
			alert("PLEAE ENTER OLD PASSWORD.");
			return false;
		}

		else if(npass=='')
		{
        	alert("PLEASE ENTER NEW PASSWORD");
			return false;
		}
        		else if(cpass=='')
		{
        	alert("PLEASE CONFIRM PASSWORD");
			return false;
		}
		else
		{
		  //alert("please fill corect details");
		  //window.location.href =ul;
		 //const myWindow.document.open(+<form method = post action = "http://192.168.43.42:8181/test/Jdbin.jsp"); 
		  //document.writeln("<form method = post action = http://192.168.43.42:8181/uservaljsp/Jdbin.jsp ">
		  
		  
		  
		}
		 if(document.F1.npass.value!=document.F1.cpass.value)
    {
	   alert("Check & Confirm PWD"); 
	   document.F1.cpass.value=""
	   document.F1.cpass.focus()	
	   return false
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
        <form name="F1" method = "post" onSubmit="return login(this)" action = "chpassub.jsp">
            <fieldset style="width:23%; background-color:lightblue">
                <h3><center>PASSWORD UPDATE</center></h3>
                <hr>
                <table>
                    <tr>
                    <% out.println("<textarea rows1 cols=15 name =uno id=uno hidden>"+i+"</textarea>");%>
                        <td>OLD PASSWORD<font color="red">*</font>:</td>
                        <td> <input type = "password" name = "opass" id="opass" Placeholder="OLD PASSWORD"></td>
                    </tr>
                   
                    <tr>
                        <td>NEW PASSWORD<font color="red">* </font>:</td>
                        <td><input type = "password" name = "npass" id="npass"  Placeholder="NEW PASSWORD"></td>
                    </tr>
					<tr>
                        <td>CONFIRM PASSWORD<font color="red">* </font>:</td>
                        <td><input type = "password"  id="cpass"  Placeholder="CONFIRM PASSWORD"></td>
                    </tr>
                    <tr>
					
                        <td></td>
                        <td><input type = "submit" value="UPDATE" name = "s1" onClick ="login(this.form)">
						<input type="reset" value="RESET" onclick="clearFunc()">
						
						</td>
                    </tr>
                </table>
            </fieldset>
        </form>
		   <br>
		
           </center>
	</body>
</html>