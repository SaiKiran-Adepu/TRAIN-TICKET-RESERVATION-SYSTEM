<%@ include file="sessionvaltu.jsp"%>
<%@ include file="packaget.jsp"%>
<!doctype html>
<html lang="en">
    <head>
        <title>DOWNLOAD CANCELLED TICKET</title>

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
        <form method = "post" onSubmit="return login(this)" action = "cantupb.jsp">
            <fieldset style="width:23%; background-color:lightblue">
                <h3><center>PRINT CANCELLED TICKET</center></h3>
                <hr>
                <table>
                    <tr>
                        <td>PNR NUMBER<font color="red">*</font>:</td>
                        <td> <input type = "number" name = "pnr" id="pnr" Placeholder="PNR NUMBER"></td>
                    </tr>
					<tr>
					<%
					Integer i1=(Integer)session.getAttribute("nu"); 
		      int k1=i1.intValue();
                       out.println("<textarea rows1 cols=15 name = usrn id=adm hidden>"+k1+"</textarea>");%>
				
                    </tr>
                   
                    <tr>					
                        <td></td>
                        <td><input type = "submit" value="DOWNLOAD" name = "s1" onClick ="login(this.form)">
						<input type="reset" value="RESET" onclick="clearFunc()">
						
						</td>
                    </tr>
                </table>
            </fieldset>
        </form>
		<h3><font color="blue">THE USER CAN DOWNLOAD/PRINT THE RESERVATION CANCELLED TICKET.</font></h3>
        <br>
		
           </center>
	</body>
</html>