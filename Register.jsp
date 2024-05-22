<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<SCRIPT LANGUAGE="JavaScript">
function dil(form)
{    
     var cuid = document.getElementById("cuid").value;
	  var usr = document.getElementById("username").value;
	  var pass = document.getElementById("pass").value;
	  var repass = document.getElementById("repass").value;
	  var gen = document.getElementById("gen").value;
		  var addr = document.getElementById("addr").value;
		  var phn = document.getElementById("phn").value;
		  var dob = document.getElementById("dob").value;
		  var idt = document.getElementById("idt").value;
		  var idn = document.getElementById("idn").value;
	 if(cuid=="")
	 {
	 alert("enter cuid");
	 return false;
	 }
	 else if(usr=="")
	 {
	 alert("enter Username");
	 return false;
	 }
	  else if(pass=="")
	 {
	 alert("Enter Password");
	 return false;
	 }
	  else if(repass=="")
	 {
	 alert("Re Enter Your Password");
	 return false;
	 }
	  else if(gen=="")
	 {
	 alert("Select Your Gender");
	 return false;
	 }
	  else if(addr=="")
	 {
	 alert("Enter Your Address");
	 return false;
	 }
	   else if(idt=="")
	 {
	 alert("Please Select Type of ID");
	 return false;
	 }
	   else if(idn=="")
	 {
	 alert("Please Enter Id Number");
	 return false;
	 }
	 if(document.F1.pass.value!=document.F1.repass.value)
    {
	   alert("Check Confirm PWD"); 
	   document.F1.repass.value=""
	   document.F1.repass.focus()	
	   return false
	}
	
	if(!isNaN(document.F1.phn.value))
   {
	   if(document.F1.phn.value >9999999999 )
	   {
		
		 document.F1.phn.value="";
		 document.F1.phn.focus();
         return false   ;
	   }
   }
   else
   {
       alert("This  field  must  be  number");
	   document.F1.phn.value="";
	   return false;
   }
      

   for(var i=0; i<form.elements.length; i++)
   {
		if(form.elements[i].value == "")
		{
		   alert("Fill out all Fields");
		   document.F1.username.focus();
		   return false;
		}
   }

   }
</SCRIPT>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>User Registration..</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function ctck()
{
var sds = document.getElementById("dum");

}
</script>

</head>

<body>

<div id="top_links">
  

<div id="header">
	<h1>SKA RAILWAYS<span class="style1"></span></h1>
    <h2><font color="orange">SAFE & HAPPY JUORNEY</font></h2>
    <A href="index.html"><IMG SRC="images/home1.gif"></IMG></A>	
</div>





<table style="width:897px; background:#FFFFFF; margin:0 auto;">
<tr >
	<td width="300" valign="top" style="border-right:#666666 1px dotted;">
    	<div id="services"><h1>SKA RAILWAY ADMINS</h1><br>
		    <ul>
        	<li><font color="blue">SAI</font></li>
            <li><font color="#0066cc">SAI KIRAN</font></li>
            <li><font color="#269900">RAMESH</font></li>
			<li><font color="#00FF00">RAJKUMAR</font></li>
			            </ul>
			
       </div>
	</td>
    
    <td width="1200" valign="top">
    	<div id="welcome" style="border-right:#666666 1px dotted;"><h1>NEW USER REGISTER</h1><br>
    	    <table  align="center" bgcolor="white">
		<tr>
			
		</tr>
		<tr>
			<td>
				<form name=F1 method="post" onSubmit="return dil(this)" action="usrreg.jsp" >
				  <table cellspacing="5" cellpadding="3">
                   <tr><font color="red">* Feilds Mandatory</font></tr>	
				   <tr><td></td><td> <input type="number" hidden name="cuid" id="cuid" value="1" readonly="readonly"  Placeholder="CUID Auto_incrementd"/></td></tr>
				   <tr><td>USER NAME<font color="red">* </font>:</td><td> <input type="text" name="username" id="username" Placeholder="Your Name"/></td></tr>
					  <tr><td>PASSWORD<font color="red">* </font>:</td><td> <input type="password" name="pass" id="pass" Placeholder="Password"/></td></tr>
					<tr><td>RE-PASS<font color="red">* </font>:</td><td> <input type="password" name="repass" id="repass" Placeholder="Re-enter Password"/></td></tr>
					<!-- Gender:<br/><br/>
					Male<input type="radio" name="gender" value="male"> Female<input type="radio" name="gender" value="female"/><br/><br/> -->
					<tr><td>GENDER<font color="red">* </font>:<br/><br/><hr></td>
					<td>Male<input type="radio" name="gen" value="Male" id="gen">Female<input type="radio" name="gen" value="Female" id="gen">Not To Specify<input type="radio" name="gen" value="DSpecify" id="gen"><br/><br/><hr></td></tr>
					<tr><td>ADDRESS<font color="red">* </font>:</td><td> <input type="text" name="addr" id="addr" Placeholder="Address"/></td></tr>
					<tr><td>MOBILE<font color="red">* </font>:</td><td> <input type="text" name="phn" id="phn" Placeholder="Mobile Number"/></td></tr>
					<tr><td>DOB<font color="red">* </font>:</td><td> <input type="date" name="dob" id="dob" Placeholder="DOB"/></td></tr>
						  <tr>
			  <td>Id Card Type<font color="red">* </font>:</td>
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
			  <td>Id Card Number<font color="red">* </font></td>
                        <td> <input type = "number" name = "idn" id="idn" Placeholder="Id Number"></td>
                  
			  </tr>
					
					
					
					<tr><td>
					    <textarea id="demo1" name="dor" hidden>
                               </textarea>				      		
							<script>
                                  window.onload = function () {
        DisplayCurrentTime();
    };

  
	setInterval(() => {
                                   var date = new Date();
	var current_date = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+ date.getDate();
	var current_time = date.getHours()+":"+date.getMinutes()+":"+ date.getSeconds();
	
	var date_time =current_time+" "+current_date;	
	document.getElementById("demo1").innerHTML = date_time;
							    }, 1000);
    
	
								
							
   	                             </script>
					</td><td><input type="submit" value="Submit" onClick ="dil(this.form)"/>
					
					<INPUT TYPE=RESET VALUE="CLEAR">
					<a href="index.html"><INPUT TYPE="button" VALUE="Back"></a>
					</td></tr>
					</table>
               		</form>
			</td>
		</tr>
	
	</table>
    	   </div>      
    </td>
    
   <td width="299" valign="top">
    	<div id="welcome" style="border-right:#666666 1px dotted;"><h1>Welcome</h1><br>
    	    <center><img src="images/wel.jpg" alt="business" width="196" height="106"></center><br>
		    <p>Each people plan their Toore to Enjoy the Vaccation Book a ticket With SKRKA Trains.</p>
	    	
	    </div>      
    </td>
             	
    
</tr></table>
    
<div id="footer_top">
  <div id="footer_navigation">
  

  </div>
  
  <div id="footer_copyright" >
 
    	    <center><img src="images/arch3.jpg"  alt="business"  width="196" height="106"></center><br>
		  <p>Each people plan their Vacation to Enjoyment which comes true with SKA RAILWAYS.</p>
	  
  Copyright ©SKA RAILWAY DEVELOPMENTS ALL RIGHTS RECEIVED 2023 </div>
</div>

<script type="text/javascript">
document.onload = ctck();
</script>
</div>

</body>
</html>

