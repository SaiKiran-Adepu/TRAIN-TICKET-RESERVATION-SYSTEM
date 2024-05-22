<%@ include file="sessionvala.jsp"%>
<!doctype html>
<html lang="en">
    <head>
        <title>FARE UPDATE</title>

		<script LANGUAGE="JavaScript">
         
    function login(form)
	{
		var frm = document.getElementById("frm").value;
        //var to = document.getElementById("to").value;
		var fare = document.getElementById("fare").value;
		if(frm =='')
		{
			alert("PLEAE SELECT STATIONS.");
			return false;
		}
		
        		else if(fare=='')
		{
        	alert("PLEASE ENTER FARE");
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
				      <script type="text/javascript">
     document.onload = ctck();
     
function addStation() {
    var stationInput = document.getElementById('trains2');
    var selectedStationsInput = document.getElementById('frm');
    
    if (selectedStationsInput.value !=='') {
        selectedStationsInput.value +=','+stationInput.value;
    } else {
        selectedStationsInput.value = stationInput.value;
    }
    stationInput.value ='';
}
        </script>
    </head>
    <body>
	<center>
        <form method = "post" onSubmit="return login(this)" action = "changefareb.jsp">
            <fieldset style="width:23%; background-color:lightblue">
                <h3><center>UPDATE TRAIN FARE</center></h3>
                <hr>
                <table>
					  <tr><td>SELECT STATIONS:</td><td>
					  	  <input list="dest" name="DEST" id="trains2" placeholder="SELECT STATIONS">
			<datalist id="dest" name="trains2">
				  <%@ include file="trainstations1.jsp" %>
			</datalist><br>
	
            <input type="button" value="Add Station" onclick="addStation()">
            </td></tr>
                    <tr>
                        <td>FROM<font color="red">*</font>:</td>
                        <td> <input type = "text" name = "frm" id="frm" readonly Placeholder="STATIONS"></td>
                    </tr>
                   
                    <tr>
                        <td>FARE<font color="red">* </font>:</td>
                        <td><input type = "number" name = "fare" id="fare"  Placeholder="FARE"></td>
                    </tr>
                    <tr>
                    <% out.println("<textarea rows1 cols=15 name = adm id=adm hidden>"+name1+"</textarea>");%>
					
                        <td></td>
                        <td><input type = "submit" value="UPDATE FARE" name = "s1" onClick ="login(this.form)">
						<input type="reset" value="RESET" onclick="clearFunc()">
						
						</td>
                    </tr>
                </table>
            </fieldset>
        </form>
		<h3>Station Names Automatically Retirves From Database Table ex AtoB or BtoA.</h3>
        <br>
		
           </center>
	</body>
</html>