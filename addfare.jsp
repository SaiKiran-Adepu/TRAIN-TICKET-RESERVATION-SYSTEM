<%@ include file="sessionvala.jsp"%>
<!doctype html>
<html lang="en">
    <head>
        <title>ADD FARE & STATIONS</title>

		<script LANGUAGE="JavaScript">
         
    function login(form)
	{
		var frm = document.getElementById("stations").value;
        var km = document.getElementById("km").value;
		var fare = document.getElementById("fare").value;
		if(frm =='')
		{
			alert("PLEAE ENTER STATIONS.");
			return false;
		}
		else if(km=='')
		{
        	alert("PLEASE ENTER KM");
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
    var stationInput = document.getElementById('train2');
    var selectedStationsInput = document.getElementById('stations');
    
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
        <form method = "post" onSubmit="return login(this)" action = "addfareb.jsp">
            <fieldset style="width:33%; background-color:lightblue">
                <h3><center>ADD STATIONS WITH FARE</center></h3>
                <hr>
                <table>
				  <tr><td>SELECT STATIONS:</td><td>
					  	  <input list="dest" name="DEST" id="train2" placeholder="SELECT STATIONS">
			<datalist id="dest" name="train2">
				  <%@ include file="trainstations1.jsp" %>
			</datalist><br>
	
            <input type="button" value="Add Station" onclick="addStation()">
            </td></tr>
                <tr>

                        <td>SELECTED STATIONS<font color="red">*</font>:</td>
                        <td> <input type = "text" name = "stations" id="stations" Placeholder="SELECTED STATIONS"></td>
                    </tr>
                   
                    <tr>
                        <td>FARE<font color="red">* </font>:</td>
                        <td><input type = "number" name = "fare" id="fare"  Placeholder="FARE"></td>
                    </tr>
					  <tr>
                        <td>KM<font color="red">* </font>:</td>
                        <td><input type = "number" name = "km" id="km"  Placeholder="KM"></td>
                    </tr>
                    <tr>
                    <% out.println("<textarea rows1 cols=15 name = adm id=adm hidden>"+name1+"</textarea>");%>
					
					
                        <td></td>
                        <td><input type = "submit" value="ADD" name = "s1" onClick ="login(this.form)">
						<input type="reset" value="RESET" onclick="clearFunc()">
						
						</td>
                    </tr>
                </table>
            </fieldset>
        </form>
		<h3><font color="blue">NOW STATION NAMES DIRECTLY RETIVED FROM DATABASE TABLE....</font></h3>
        <br>
		
           </center>
	</body>
</html>