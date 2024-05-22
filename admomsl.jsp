<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*,java.util.*" %>

  <%
     
     Integer i=(Integer)session.getAttribute("nu"); 
     
	 if(i==null)
	 {
		response.sendRedirect("una1u.jsp");
	 }
	 else
	 {
		int k=i.intValue();
       //out.print("<textarea>"+k);
    //out.println("<textarea rows1 cols=15 name = acid id=acid1>"+k+"</textarea>");
	 }					

 %>


<!doctype html>
<html lang="en">
    <head>
        <title>Modify Master List</title>

		<script LANGUAGE="JavaScript">
         
    function msl(form)
	{
		
		//still pending
		
        var pname = document.getElementById("pname").value;
		var pdob = document.getElementById("pdob").value;
		var pgen = document.getElementById("pgen").value;
		var bp = document.getElementById("bp").value;
		var idt = document.getElementById("idt").value;
		var idn = document.getElementById("idn").value;
		
		 if(pname=='')
		{
        	alert("Please Enter Passenger Name");
			return false;
		}
        		else if(pdob=='')
		{
        	alert("Please Enter DOB");
			return false;
		}
 		else if(pgen=='')
		{
        	alert("Please Select Gender");
			return false;
		}
       else if(bp=='')
		{
        	alert("Please Select Birthprefernce");
			return false;
		}
		 else if(idt=='')
		{
        	alert("Please Select Type of ID");
			return false;
		}
		 else if(idn=='')
		{
        	alert("Please Enter ID Number");
			return false;
		}
		else
		{
		  //alert("please fill corect details");
		  //window.location.href =ul;
		 //const myWindow.document.open(+<form method = post action = "http://192.168.43.42:8181/test/Jdbin.jsp"); 
		  //document.writeln("<form method = post action = http://192.168.43.42:8181/uservaljsp/Jdbin.jsp ">
		  
		  
		  
		}


   for(var i=0; i<form.elements.length; i++)
   {
		if(form.elements[i].value == "")
		{
		   alert("Fill out all Fields");
		   document.F1.pgen.focus();
		   return false;
		}
   }

	}
		function clearFunc()
	{
		
	}	
		</script>
    </head>
    <body>
	<center>
        <form name=F1 method = "post" onSubmit="return msl(this)" action = "jsmsl.jsp">
            <fieldset style="width:33%; background-color:lightblue">
                <h3><center>ADD PASSENGER LIST PENDING</center></h3>
                <hr>
       
	            <table>
                    
                        <tr><td>Passenger Type<font color="red">* </font>:<br><br></td>
				<td>Normal<input type="radio" name="pt" value="Normal" id="pt" checked>PHC/Escort<input type="radio" name="pt" value="PHC/Escort" id="pt">Journalist<input type="radio" name="pt" value="Escort" id="pt"><br><br></td></tr>
                    <tr>
                        <td>Name<font color="red">*</font>&nbsp:<br><br></td>
                        <td> <input type = "text" name = "pname" id="pname" Placeholder="Passenger Name"><br><br></td>
                    </tr>
                    <tr>
                       <td>DOB<font color="red">* </font>:<br><br></td><td> <input type="date" name="pdob" id="pdob" Placeholder="DOB"/><br><br></td>
					     </tr>
        <tr><td>Gender<font color="red">* </font>:<br><br></td>
					<td>Male<input type="radio" name="pgen" value="Male" id="pgen">Female<input type="radio" name="pgen" value="Female" id="pgen">Not To Specify<input type="radio" name="pgen" value="DSpecify" id="pgen"><br><br></td></tr>
							 	<tr>
						 <td>Birth Preference<font color="red">*</font>&nbsp:<br><br></td>	
			
<td>
                    <select name="bp" id="bp">
                      <option value="No Choice">No Choice</option>
                <option value="Lower">Lower</option>
               <option value="Middle">Middle</option>
              <option value="Upper">Upper</option>
			   <option value="Side Lower">Side Lower</option>
			    <option value="Side Middle">Side Middle</option>
				 <option value="Side Upper">Side Upper</option>
				  <option value="Window Side">Window Side</option>
                  </select>
		<br><br>
			  </td>
			  </tr>

			  <tr>
			  <td>Id Card Type<font color="red">* </font>:<br><br></td>
<td>
            <!-- <select name="idt" id="idt">-->
			<input list="idt1" name="idt" id="idt" placeholder="ID Type">
			<datalist id="idt1" name="idt">
  <option value="Aadhar Card">Aadhar Card</option>
  <option value="PAN Card">PAN Card</option>
  <option value="Bank Passbook">Bank Passbook</option>
  <option value="Driving License">Driving License</option>
  <option value="Voter ID">Voter ID</option>
                </datalist>
</td>
			  </tr>
			  <tr>
			  <td>Id Card Number<font color="red">* </font><br><br></td>
                        <td> <input type = "text" name = "idn" id="idn" Placeholder="Id Number"><br><br></td>
                  
			  </tr>
<tr><td>User Number<font color="red">* </font>:</td><td><% out.println("<textarea rows1 cols=15 name = uno id=uno readonly hidden>"+i+"</textarea>");%></td></tr>
                    <tr>
					
                        <td></td>
						
                        <td><input type = "submit" value="Submit" name = "s1" onClick ="msl(this.form)">
						<input type="reset" value="Reset" onclick="clearFunc()">
						
						</td>
                    </tr>
                </table>
            </fieldset>
        </form>
		
        <br>
		
           </center>
	</body>
</html>