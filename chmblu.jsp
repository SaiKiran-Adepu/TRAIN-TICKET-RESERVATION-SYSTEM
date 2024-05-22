<%@ include file="sessionvaltu.jsp"%>
<%@ include file="packaget.jsp"%>
<!doctype html>
<html lang="en">
    <head>
        <title>USER MOBILE UPDATE</title>

		<script LANGUAGE="JavaScript">
         
    function login(form)
	{
		var mbl = document.getElementById("mbl").value;
		var mblb = document.getElementById("mblb").value;
        var pass = document.getElementById("pass").value;
		if(mbl =='')
		{
			alert("PLEAE ENTER NEW MOBILE NUMBER.");
			return false;
		}

      else if(mblb=='')
		{
        	alert("PLEASE CONFIRM YOUR MOBILE NUMBER");
			return false;
		}
		else if(pass=='')
		{
        	alert("PLEASE ENTER YOUR PASSWORD");
			return false;
		}
		else
		{
		  //alert("please fill corect details");
		  //window.location.href =ul;
		 //const myWindow.document.open(+<form method = post action = "http://192.168.43.42:8181/test/Jdbin.jsp"); 
		  //document.writeln("<form method = post action = http://192.168.43.42:8181/uservaljsp/Jdbin.jsp ">
		
		}
		 if(document.F1.mbl.value!=document.F1.mblb.value)
    {
	   alert("CHECK & CONFIRM MOBILE NUMBER"); 
	   document.F1.mblb.value=""
	   document.F1.mblb.focus()	
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
        <form name="F1" method = "post" onSubmit="return login(this)" action = "chmblub.jsp">
            <fieldset style="width:23%; background-color:lightblue">
                <h3><center>MOBILE NUMBER UPDATE</center></h3>
                <hr>
                <table>
                    <tr>
                    <% out.println("<textarea rows1 cols=15 name =uno id=uno hidden>"+i+"</textarea>");%>
                        <td>MOBILE NUMBER<font color="red">*</font>:</td>
                        <td> <input type = "text" name = "mbl" id="mbl" Placeholder="NEW MOBILE NUMBER"></td>
                    </tr>
                    <tr>
                        <td>CONFIRM<font color="red">* </font>:</td>
                        <td><input type = "text" id="mblb"  Placeholder="CONFIRM MOBILE NUMBER"></td>
                    </tr>
                    <tr>
                        <td>PASSWORD<font color="red">* </font>:</td>
                        <td><input type = "password" name = "pass" id="pass"  Placeholder="PASSWORD"></td>
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