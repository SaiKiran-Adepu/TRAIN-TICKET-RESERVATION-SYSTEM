<%@ include file="sessionvala.jsp"%>
<%@ include file="packaget.jsp"%>
<!doctype html>
<html lang="en">
    <head>
        <title>Train Booking</title>
		<script>
		   function swapText() {
            // Get the values from the text boxes
            var textBox1Value = document.getElementById("train1").value;
            var textBox2Value = document.getElementById("train2").value;

            // Swap the values
            document.getElementById("train1").value = textBox2Value;
            document.getElementById("train2").value = textBox1Value;
        }
		</script>
		 <style>
        /* Style for the button */
        .transparent-button {
            background: transparent;
            border: none;
            cursor: pointer;
            padding: 0;
			
    }
	  .clickable-img {
        cursor: pointer; /* Change cursor to pointer when hovering over the image */
        }
    </style>
		<script LANGUAGE="JavaScript">
         
    function login(form)
	{
		var t1 = document.getElementById("train1").value;
		var t2 = document.getElementById("train2").value;
		var doj = document.getElementById("doj").value;
		var tyc = document.getElementById("tyc").value;
		var tyb = document.getElementById("tyt").value;
		if(t1 =='')
		{
			alert("Please Select From");
			return false;
		}
		else if(t2=='')
		{
        	alert("Please select TO");
			return false;
		}
		else if(document.F1.train1.value==document.F1.train2.value)
       {
	     alert("Your Selected Same Stations !"); 
	     document.F1.train1.focus();
	     document.F1.train2.value="";	
	     return false;
		 
	   }
	   else if(doj=='')
		{
        	alert("Please select Date of Journey");
			return false;
		}
		 else if(tyc=='')
		{
        	alert("Please select Type of Ticket");
			return false;
		}
		 else if(tyt=='')
		{
        	alert("Please select Type of Booking");
			return false;
		}
      //window.open("ticketbu.jsp");


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
        <form name=F1 method = "POST" onSubmit="return login(this)" action ="ticketab.jsp">
			<fieldset style="width:32%; background-color:#B3DED4; border-end-start-radius:25;">
           <h3><font>BOOK A TICKET</font></h3>
			<table>
			<tr>
			<td><img src="images/from2.png" width="21" height="16">
			<input list="source" name="SOURCE" id="train1" placeholder="FROM">
			<datalist id="source" name="train1">
			   <%@ include file="trainstations1.jsp" %>
			</datalist>
			</td>
			<td>

     
      <script type="text/javascript">
    window.onload=function()
    {
     var today = new Date().toISOString().split('T')[0];
     document.getElementsByName("setTodaysDate")[0].setAttribute('min', today);
    }

      </script> 
         <input name="setTodaysDate" type="date" id="doj">

</td>
			</tr>
					</tr>
	<tr>
		<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp

        
<img src="images/updo.png" alt="Arrow Up" width="20" height="20" onclick="swapText()" class="clickable-img">

  </td>
	
	</tr>
			<tr>
			<td>
	<img src="images/to.jpg" width="22" height="16">
			<input list="dest" name="DEST" id="train2" placeholder="TO">
			<datalist id="dest" name="train2">
				 <%@ include file="trainstations.jsp" %>
			</datalist>
				<td>
				
				 <select name="tycl" id="tyc">
    <option value="AC FIRST CLASS">AC FIRST CLASS (1A)</option>
    <option value="AC 2 Tier(2A)">AC 2 Tier(2A)</option>
    <option value="AC 3 Tier (3A)">AC 3 Tier (3A)</option>
	<option value="CHAIR CAR">CHAIR CAR</option>
    <option value="SLEEPER" id="sl">SLEEPER</option>
	<option value="SECOND SITTING" id="ss">SECOND SITTING</option>
  </select>
</td>
			</td>
			</tr>
			 <tr>
			 <td>
			 <br>
		 <script>
					function showAlert()
		 {
      var ld = document.getElementById("tyt").value;
	  if (ld === "LADIES" || ld === "PHC") 
	  {
        alert("Specially abled passengers need to carry Photo Identity card issued by Government which is to be produced for On-board / Off-board verification during journey.: " + ld);
      }
      
    }
			 </script>
			  <label for="tyt">Type OF Ticket:</label>
  <select name="tyt" id="tyt" onchange="showAlert()">
    <option value="GENERAL">GENERAL</option>
    <option value="LADIES">LADIES</option>
    <option value="TATKAL">TATKAL</option>
	<option value="PREMIUM TATKAL">PREMIUM TATKAL</option>
    <option value="PHC"id="phc">PHC</option>
  </select>
  </td>
  </tr>
  <tr>
  <td>
<textarea id="demo1" name="dob" hidden>
                               </textarea>				      		
							<script>
                                  window.onload1 = function () {
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
  </tr>
  </table>
  <br>
					<input type = "submit" value="SEARCH" onClick ="login(this.form)">
				<input type="reset" value="RESET" onclick="clearFunc()">
					</fieldset>
        </form>
		     <br>
		           </center>
	</body>
</html>