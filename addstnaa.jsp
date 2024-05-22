<%@ include file="sessionvala.jsp"%>
<html>
<head>
    <title>Admin Add Station</title>
</head>
<body>

    <center>
        <form method = "post" onSubmit="return login1(this)" action = "addstnab.jsp">
            <fieldset style="width:23%; background-color:lightblue">
                <h3><center>Add Train Stations</center></h3>
                <hr>
                <table>
                    <tr>
                        <td>Station Name:<font color="red">*</font></td>
                        <td> <input type = "text" name = "sname" id="name" Placeholder="STATION NAME"></td>
                    </tr>
                 
<tr>
	
		 
		 </td>
		 </tr>
                    <tr>
                        <td></td>
                        <td><input type = "Submit" value="Add Station" name = "s1" onClick ="login1(this.form)">
						<input type="reset" value="Reset" onclick="clearFunc()">
						
						</td>
                    </tr>
                </table>
            </fieldset>
        </form>
		<br>
		<br>
         
	</center>
 



</body>
</html>