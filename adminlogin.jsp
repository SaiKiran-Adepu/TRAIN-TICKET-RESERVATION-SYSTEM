<!doctype html>
<html lang="en">
    <head>
        <title>Welcome To SKA RAIWAYS </title>
		<script LANGUAGE="JavaScript">
         
    function login(form)
	{
		var name = document.getElementById("name").value;
		var pass = document.getElementById("pass").value;
		if(name =='')
		{
			alert("please enter Admin name.");
			return false;
		}
		else if(pass=='')
		{
        	alert("enter password");
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
	
<style>
table {

  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {

  border: solid #dddddd;
  text-align: left;
  padding: 1.5px;
}

tr:nth-child(even) {

  background-color: #dddddd;
}
</style>
	<center>
        <form method = "post" onSubmit="return login(this)" action ="jsadmin.jsp">
            <fieldset style="width:26%; background-color:lightblue">
                <h3><center>ADMIN LOGIN</center></h3>
                <hr>
                <table>
                    <tr>
                        <td>ADMIN NAME<font color="red">* </font>:</td>
                        <td> <input type = "text" name = "namem" id="name"  Placeholder="ADMIN NAME"></td>
                    </tr>
                    <tr>
                        <td>ADMIN PASSWORD<font color="red">* </font>:</td>
                        <td><input type = "password" name = "passm" id="pass"  Placeholder="ADMIN PASSWORD"></td>
                    </tr>
					
					   
					
					
					
                    <tr>
                        <td></td>
                        <td><input type = "submit" value="Login" name = "s1" onClick ="login(this.form)">
						<input type="reset" value="Reset" onclick="clearFunc()">
						<a href="index.html"><input type="button" value="Back"></a>
						</td>
                    </tr>
                </table>
            </fieldset>
        </form>
		
        <br>
		
           </center>
	</body>
</html>