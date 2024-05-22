<!doctype html>
<html lang="en">
    <head>
        <title>Welcome To SKA RAILWAYS</title>
 
		<script LANGUAGE="JavaScript">
         
    function login(form)
	{
		var num = document.getElementById("number").value;
        var name = document.getElementById("name").value;
		var pass = document.getElementById("pass").value;
		if(num =='')
		{
			alert("PLEAE ENTER YOUR NUMBER.");
			return false;
		}
		else if(name=='')
		{
        	alert("PLEASE ENTER YOUR NAME");
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
        <form method = "post" onSubmit="return login(this)" action = "jsusrt.jsp">
            <fieldset style="width:24%; background-color:lightblue">
                <h3><center>Train User Login</center></h3>
                <hr>
                <table>
                    <tr>
                        <td>USER NUMBER<font color="red">*</font>&nbsp:</td>
                        <td> <input type = "number" name = "number" id="number" Placeholder="USER NUMBER"></td>
                    </tr>
                                        <tr>
                        <td>NAME<font color="red">*</font>&nbsp &nbsp&nbsp&nbsp&nbsp &nbsp &nbsp &nbsp &nbsp&nbsp &nbsp&nbsp:</td>
                        <td> <input type = "text" name = "name" id="name" Placeholder="USER NAME"></td>
                    </tr>
                    <tr>
                        <td>PASSWORD<font color="red">* </font>&nbsp &nbsp &nbsp &nbsp:</td>
                        <td><input type = "password" name = "passc" id="pass"  Placeholder="PASSWORD"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type = "submit" value="login" name = "s1" onClick ="login(this.form)">
						<input type="reset" value="Reset" onclick="clearFunc()">
						<a href="index.html"><input type="button" value="back"></a>
						</td>
                    </tr>
                </table>
            </fieldset>
        </form>
		
        <br>
		
           </center>
	</body>
</html>