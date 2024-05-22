<%@ include file="sessionvala.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<SCRIPT LANGUAGE="JavaScript">
function dil(form)
{    
     var tn = document.getElementById("trainnumber").value;
	  var trn = document.getElementById("trainname").value;
	  var st = document.getElementById("stations").value;
	   var bsf = document.getElementById("bsf").value;
	  /*
	  var repass = document.getElementById("").value;
	  var gen = document.getElementById("gen").value;
		  var addr = document.getElementById("addr").value;
		  var phn = document.getElementById("phn").value;
		  var dob = document.getElementById("dob").value;*/
	 if(tn=="")
	 {
	 alert("Please Enter Train Number");
	 return false;
	 }
	 else if(trn=="")
	 {
	 alert("Please Enter Train Name");
	 return false;
	 }
	  else if(st=="")
	 {
	 alert("Please Enter Stations That Train Halt by , Between");
	 return false;
	 }
 else if(bsf=="")
	 {
	 alert("Please Enter Base Fare");
	 return false;
	 }

   }
</SCRIPT>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>THE SKA RAIWAYS ..</title>
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
			
			
			            </ul>
			
       </div>
	</td>
    
    <td width="1200" valign="top">
    	<div id="welcome" style="border-right:#666666 1px dotted;"><h1>NEW TRAIN REGISTER</h1><br>
    	    <table  align="center" bgcolor="white">
		<tr>
			
		</tr>
		<tr>
			<td>
				<form name=F1 method="post" onSubmit="return dil(this)" action="newtrainb.jsp" >
				  <table cellspacing="5" cellpadding="3">
                   <tr><font color="red">* Feilds Mandatory</font></tr>	
				   <tr><td>TRAIN NUMBER<font color="red">* </font>:</td><td> <input type="number" name="trainnumber" id="trainnumber" Placeholder="TRAIN NUMBER"/></td></tr>
				   <tr><td>TRAIN NAME<font color="red">* </font>:</td><td> <input type="text" name="trainname" id="trainname" Placeholder="TRAIN NAME"/></td></tr>
					  <tr><td>SELECT STATIONS:</td><td>
					  	  <input list="dest" name="DEST" id="train2" placeholder="STATIONS">
			<datalist id="dest" name="train2">
				  <%@ include file="trainstations1.jsp" %>
			</datalist><br>
	
            <input type="button" value="Add Station" onclick="addStation()">
            </td></tr>
			<tr>
					 <td>SELECTED STATIONS<font color="red">* </font>:</td><td> <input type="text" name="stations" id="stations" readonly Placeholder="SELECTED STATIONS"/>
				</td></tr>
	<tr><td>BASE FARE<font color="red">* </font>:</td><td> <input type="text" name="bsf" id="bsf" Placeholder="Base Fare"/></td></tr>
     <tr><td>COUCH CLASS<font color="red">* </font>:<br/><br/></td><td>
	 <input type="checkbox" id="1ac" name="1ac" value="AC FIRST CLASS,">
  <label for="1ac">1 AC</label><br>
  <input type="checkbox" id="2ac" name="2ac" value="AC 2 Tier(2A),">
  <label for="2ac">2 AC</label><br>
  <input type="checkbox" id="3ac" name="3ac" value="AC 3 Tier (3A),">
  <label for="3ac">3 AC</label><br>
  <input type="checkbox" id="CC" name="cc" value="CHAIR CAR,">
  <label for="CC">CHAIR CAR</label><br>
  <input type="checkbox" id="sleeper" name="sleeper" value="SLEEPER,">
  <label for="sleeper">SLEEPER</label><br>
    <input type="checkbox" id="2s" name="2s" value="SECOND SITTING,">
  <label for="2s">2 SITTING</label><br><br>
	
					</td></tr>
					<tr><td>COUCH QUOTA<font color="red">* </font>:<br/><br/></td><td>
  <input type="checkbox" id="gen" name="gen" value="GENERAL,">
  <label for="gen">GENERAL</label><br>
  <input type="checkbox" id="ld" name="ld" value="LADIES,">
  <label for="ld">LADIES</label><br>
  <input type="checkbox" id="tkl" name="tkl" value="TATKAL,">
  <label for="tkl">TATKAL</label><br>
  <input type="checkbox" id="ptkl" name="ptkl" value="PREMIUM TATKAL,">
  <label for="ptkl">PREMIUM TATKAL</label><br>
    <input type="checkbox" id="phc" name="phc" value="PHC,">
  <label for="phc">PHC</label><br><br>
					</td></tr>
					<tr><td>TRAIN ADMIN<font color="red">* </font>:</td><td><% out.println("<textarea rows1 cols=15 name = adm id=adm readonly>"+name1+"</textarea>");%></td></tr>
					
					
					<tr><td><td>
					 <textarea id="demo1" name="doa" >
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
					
					</td>
				
					</td></tr>
					<tr><td>
					</td><td><input type="submit" value="Submit" onClick ="dil(this.form)"/>
					<INPUT TYPE=RESET VALUE="CLEAR">
				
					</td></tr>
					</table>
               		</form>
			</td>
		</tr>
	
	</table>
    	   </div>      
    
    
   <td width="299" valign="top">
    	<div id="welcome" style="border-right:#666666 1px dotted;"><h1>Welcome</h1><br>
    	    <center><img src="images/wel.jpg" alt="business" width="196" height="106"></center><br>
<h2><font color="blue">Instructions to Admin While Adding a new Train</font></h2>
    <p>While adding a new train Admins can Also Imediately add the same stations that while entered the same stations with fare in the add station fare</p>
     <p> with KM and Fare</p>



		    <p>Each people plan their Toore to Enjoy the Vaccation Book a ticket With SKRKA Trains.</p>
	    	
	    </div>      
   
             	
    
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
     </div>

    </body>
   </html>
